import QtQuick 2.0

Item {
    id: datetimeIcon

    property string currentDay: ""
    property string currentTime: ""

    Rectangle {
        id: date

        Image {
            id: imgDate
            source: "qrc:/App/Qml/WeatherApp/icons/clendar.png"
            width: 20; height: 20
        }
        Text {
            text: currentDay
            color: "white"
            font.pointSize: 12
            anchors.left: imgDate.right; anchors.leftMargin: 5
        }
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                var date = new Date()
                var day = date.getDay()
                var month = date.getMonth()
                var year = date.getFullYear()
                var hours = date.getHours()
                var minutes = date.getMinutes()
                var seconds = date.getSeconds()
//                currentDay = day + "/" + month + "/" + year + "  " + hours + ":"+minutes+":"+seconds
                currentDay = date
            }
        }

    }
    Rectangle {
        id: time
        anchors.left: date.right; anchors.leftMargin: 10
//        Image {
//            source: "qrc:/icons/clock.jpg"
//            width: 20; height: 20
//        }

    }
}
