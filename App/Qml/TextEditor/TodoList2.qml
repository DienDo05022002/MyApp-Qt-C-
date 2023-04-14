import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Item {
    visible: true
    width: 768
    height: 538

    ListModel{
        id: todoModel
    }

    Item{
        anchors.fill: parent
        Rectangle{
            id: header
            height: 50
            width: parent.width
            color: "#0080ff"
            anchors.top: parent.top
            Text{
                text: "My Todo-List"
                font.bold: true
                font.pixelSize: 30
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 35
                anchors.centerIn: parent
            }
        }
        Item {
            id: rightItem
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.top: header.bottom
            Rectangle{
                id: leftRect
                width: 0.5 * parent.width
                height: parent.height
                anchors.left: parent.left
                color: "#C4C4C4"
                ListView{
                    id: lv
                    model: todoModel
                    anchors.centerIn: parent
                    width: parent.width *  0.7
                    height: parent.height *  0.8
                    spacing: 5
                    delegate: Rectangle{
                        id: dlg
                        width: lv.width
                        height: 70
                        radius: 15
                        color: "white"

                        //Feature of app
                        property string title: _title
                        property string description: _description
                        Rectangle{
                            color: "red"
                            width: 80
                            height: parent.height
                            anchors.right: parent.right
                            Text{
                                color: "white"
                                text: "DELETE"
                                anchors.centerIn: parent
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    todoModel.remove(index)
                                }
                            }
                        }
                        Column{
                            anchors.fill: parent
                            anchors.leftMargin: 20
                            anchors.rightMargin: 50
                            anchors.topMargin: 5
                            anchors.bottomMargin:  5
                            Text{
                                text: dlg.title
                                color: "black"
                                font.bold: true
                                font.pixelSize: 18
                            }
                            Text{
                                text: dlg.description
                                color: "black"
                                font.pixelSize: 16
                            }
                        }
                    }
                }
            }
            Item{
                id: rightRect
                width: 0.5 * parent.width
                height: parent.height
                anchors.right: parent.right
                //                anchors.leftMargin: 20
                Column{
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    spacing: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    TextField{
                        id: textTitle
                        placeholderText: "Enter the title"
                        height: 50
                        width: leftRect.width * 0.7
                        color: "black"
                    }
                    TextArea{
                        id: textDescription
                        placeholderText: "Description"
                        width: leftRect.width * 0.7
                        height: 150
                    }
                    Button{
                        text: "ADD"
                        height: 50
                        width: leftRect.width * 0.7
                        onClicked: {
                            todoModel.append({"_title": textTitle.text, "_description":textDescription.text})
                            textTitle.text = ""
                            textDescription.tetx = ""
                        }
                    }
                }
            }
        }
    }

}















