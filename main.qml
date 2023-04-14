import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.5
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 768
    height: 538
    title: qsTr("My App")

    property int iconsWH: 55
//    Item {}
    StackView{
        id: stackView
    }


    header: Button {
        id: backBtn
        width: 35; height: 35
        onClicked: {
//            stackView.push(Qt.resolvedUrl("qrc:/main.qml"))
            stackView.push("qrc:/main.qml")
            dashboardIcon.visible = true
        }
        Image {
            id: name
            anchors.centerIn: parent
            source: "qrc:/icons-dashboard/left-arrow.png"
            width: parent.width; height: parent.height - 5
        }
    }


    Rectangle {
        visible: true
        id: dashboardIcon
        width: parent.width
        //        anchors.top: backBtn.bottom
        anchors.centerIn: parent
        Row {
            x: 241
            y: -27
            spacing: 60
            //width: dashboardIcon.width; //height: 200
            Button {
                id: todoList
                width: iconsWH; height: iconsWH
                onClicked: {
                    stackView.push(Qt.resolvedUrl("qrc:/App/Qml/TextEditor/TodoList2.qml"))
                    dashboardIcon.visible = false
                }
                Image {
                    source: "qrc:/icons-dashboard/todo-list.png"
                    width: parent.width; height: parent.height
                }
            }

            Button {
                id: weatherApp
                width: iconsWH; height: iconsWH
                onClicked: {
                    stackView.push(Qt.resolvedUrl("qrc:/App/Qml/WeatherApp/WeatherApp.qml"))
                    dashboardIcon.visible = false
                }
                Image {
                    source: "qrc:/icons-dashboard/weather.png"
                    width: parent.width; height: parent.height
                }
            }

            Button {
                id: qtTextEditor
                width: iconsWH; height: iconsWH
//                anchors.centerIn: parent
                onClicked: {
                    stackView.push(Qt.resolvedUrl("qrc:/App/Qml/QtTextEditor/QtTextEditor.qml"))
                    dashboardIcon.visible = false
                }
                Image {
                    source: "qrc:/icons-dashboard/text-editor.png"
                    width: parent.width; height: parent.height
                }
            }
        }
    }
}
