import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2

Window {
    property int displayWidth: (Screen.height > Screen.width) ? Screen.height : Screen.width
    property int displayHeight: (Screen.height < Screen.width) ? Screen.height : Screen.width

    width: displayWidth
    height: displayHeight
    visible: true
    flags: Qt.FramelessWindowHint

    Image {
        width: displayWidth
        height: displayHeight
        source: "img/background.jpg"
        fillMode: Image.Stretch
    }

    Rectangle {
        objectName: "videoRectangle"
        width: 0.75 * displayWidth
        height: 0.57 * displayHeight
        x: 0.125 * displayWidth
        y: 0.125 * displayHeight
        color: "#000000"
    }

    Button {
        objectName: "ledbutton"
        text: "LED"
        width: 0.2 * displayWidth
        height: 0.1 * displayHeight
        x: 0.125 * displayWidth
        y: 0.76 * displayHeight
        checkable: true
        onCheckedChanged: {

            ledHandler.setEnabled(checked)
            ledSlider.enabled = checked
        }
    }

    Slider {
        id: ledSlider
        objectName: "slider"
        width: 0.325 * displayWidth
        height: 0.1 * displayHeight
        x: 0.3375 * displayWidth
        y: 0.76 * displayHeight
        from: 0
        value: 0
        to: 128
        stepSize: 16
        onValueChanged: ledHandler.setBrightness(value)
        enabled: false
    }

    Button {
        objectName: "closebutton"
        text: "Close"
        width: 0.2 * displayWidth
        height: 0.1 * displayHeight
        x: 0.675 * displayWidth
        y: 0.76 * displayHeight
        checkable: false
        onClicked: {
            Qt.quit()
        }
    }
}
