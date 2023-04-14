import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

import AppTODOLIST.TodoModel 1.0

Item {
//    visible: true
//    width: 768
//    height: 538

    function running() {
        console.log("Running...")
    }
    TodoModel{
        id: myModel
    }

    ListView {
        id: myTodoList
        model: myModel
        height: parent.height
        anchors.fill: parent
        header: Row {
            Button{
                text: "append"
                anchors.top: parent.bottom
                onClicked: {
                    myModel.addItem()
                    running()
                }
            }
        }

        delegate: Row{
            TextField{
                text: noidung
                onTextChanged: {
                    noidung = text
                }
            }
            CheckBox{
                checked: trangthai
                onCheckedChanged: {
                    trangthai = checked
                }
            }
            Button{
                text: "Remove"
                onClicked: {
                    myModel.removeItem(index)
                }
            }
        }
    }
}





















