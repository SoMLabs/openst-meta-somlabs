#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQuick/QQuickItem>
#include <QWindow>
#include <qpa/qplatformnativeinterface.h>
#include <QDebug>
#include <LedHandler.h>

#include <gst/gst.h>
#include <gst/video/videooverlay.h>
#include <wayland/wayland.h>

GstElement *pipeline;
GstVideoOverlay *overlay;
QGuiApplication* appHandler;
QQuickItem* videoItem;

static GstBusSyncReply
bus_sync_handler (GstBus * bus, GstMessage * message, gpointer user_data)
{
    if(GST_MESSAGE_TYPE (message) == GST_MESSAGE_NEED_CONTEXT) {
        QPlatformNativeInterface *native =
                QGuiApplication::platformNativeInterface();
        struct wl_display *display_handle = (struct wl_display *)
                native->nativeResourceForWindow("display", NULL);

        GstContext* context = gst_wayland_display_handle_context_new (display_handle);
        gst_element_set_context (GST_ELEMENT (GST_MESSAGE_SRC (message)), context);

        gst_message_unref (message);
        return GST_BUS_DROP;

    } else if (GST_MESSAGE_TYPE(message) == GST_MESSAGE_SEGMENT_DONE) {
        gst_element_seek(pipeline, 1.0, GST_FORMAT_TIME,
                         (GstSeekFlags)(GST_SEEK_FLAG_SEGMENT | GST_SEEK_FLAG_ACCURATE),
                          GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, GST_CLOCK_TIME_NONE);

    } else if (gst_is_video_overlay_prepare_window_handle_message (message)) {

        QPlatformNativeInterface *native =
                    QGuiApplication::platformNativeInterface();
        QWindow* top = appHandler->topLevelWindows().first();
        struct wl_surface *surface = static_cast<struct wl_surface *>(native->nativeResourceForWindow("surface", top));

        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY (GST_MESSAGE_SRC (message)), (guintptr)surface);
        gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY (GST_MESSAGE_SRC (message)), videoItem->x(), videoItem->y(), videoItem->width(), videoItem->height());
        gst_element_set_state (pipeline, GST_STATE_PLAYING);

        gst_message_unref (message);
        return GST_BUS_DROP;
    }

    return GST_BUS_PASS;
}

void startPlay(char* filePath) {
    QString uri = QString("file://") + QString(filePath);
    qDebug() << "playing: " << uri.toStdString().c_str();
    pipeline = gst_parse_launch("playbin video-sink='waylandsink'", NULL);
    g_object_set(pipeline, "uri", uri.toStdString().c_str(), NULL);

    GstBus *bus = gst_pipeline_get_bus(GST_PIPELINE (pipeline));
    gst_bus_add_signal_watch(bus);
    gst_bus_set_sync_handler(bus, bus_sync_handler, NULL, NULL);
    gst_object_unref(bus);

    gst_element_set_state(pipeline, GST_STATE_PAUSED);
    gst_element_get_state(pipeline, NULL, NULL, GST_CLOCK_TIME_NONE);
    gst_element_seek(pipeline, 1.0, GST_FORMAT_TIME,
                     (GstSeekFlags)(GST_SEEK_FLAG_SEGMENT | GST_SEEK_FLAG_FLUSH),
                      GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, GST_CLOCK_TIME_NONE);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);
}

int main(int argc, char *argv[])
{    
    if ((argc != 4) || (!QFile::exists(argv[3])) || (QString(argv[1]) != QString("-platform")) 
        || (QString(argv[2]) != QString("wayland-egl"))) {
        qCritical() << "Correct usage: SomlabsDemo -platform wayland-egl <absolute path to video file>";
        return -1;
    }

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    appHandler = &app;

    int gstArgc = 1;
    gst_init (&gstArgc, &argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    LedHandler lh("/sys/class/leds/led2/brightness");
    engine.rootContext()->setContextProperty("ledHandler", &lh);

    videoItem = (QQuickItem*)engine.rootObjects().first()->findChild<QObject *>(QString("videoRectangle"), Qt::FindChildrenRecursively);

    startPlay(argv[3]);

    return app.exec();
}
