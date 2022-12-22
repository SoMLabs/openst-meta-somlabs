#ifndef LEDHANDLER_H
#define LEDHANDLER_H

#include <QObject>
#include <QFile>

class LedHandler : public QObject
{
    Q_OBJECT
public:
    explicit LedHandler(QString ledPath, QObject *parent = nullptr);

signals:

public slots:
    void setEnabled(bool enabled);
    void setBrightness(unsigned int brightness);

private:
    QFile* file;
    bool enabled;
    unsigned int brightness;

    void writeBrightness(unsigned int brightness);
};

#endif // LEDHANDLER_H
