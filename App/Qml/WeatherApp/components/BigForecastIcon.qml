import QtQuick 2.0

Item {
    id: current

    property string topText: "20*"
    property string bottomText: "Mostly cloudy!!"
    property string weatherIcon: "01d"
    property real smallSide: (current.width < current.height ? current.width : current.height)

    Text {
        text: current.topText
        font.pointSize: 35
        color: "white"
        anchors {
            top: current.top
            left: current.left
            topMargin: 5; leftMargin: 5
        }
    }

    WeatherIcon {
        id: container
        weatherIcon: current.weatherIcon
        useServerIcon: false
        anchors.centerIn: parent
//        anchors.verticalCenterOffset: -15
        width: 180; height: 180-13
//        width: current.smallSide
//        height: current.smallSide - 13
    }
    Text {
        text: current.bottomText
        font.pointSize: 20
        font.family: "Roboto"
        color: "white"
        wrapMode: Text.WordWrap
        width: parent.width
        horizontalAlignment: Text.AlignRight
        anchors {
            bottom: container.bottom
            right: current.right
            rightMargin: 5
        }
    }

}
