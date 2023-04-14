import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import Qt.Backend 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Text-Editor")

    Backend {
        id: backend
        onPathChanged: console.log("Path: ", path)
        onDataChanged: console.log("Path: ", path)
    }

    //Event open & updata File
    FileDialog {
        id: openDialog
        title: "Please choose a file: "
        folder: shortcuts.home
        selectMultiple: false
        selectExisting: true

        onAccepted: {
            backend.path = openDialog.fileUrl
            editor.text = backend.data
        }
    }
    //Event save file
    FileDialog {
        id: saveDialog
        title: "Please choose a file: "
        folder: shortcuts.home
        selectMultiple: false
        selectExisting: false

        onAccepted: {
            backend.path = saveDialog.fileUrl
            backend.data = editor.text
        }
    }

//Handle event Button
    Action {
        id: actionNew
        text: qsTr("New")
        iconSource: "qrc:/App/Qml/QtTextEditor/outlines/oNew.png"
        onTriggered: editor.text = ""            // Set new text = ""
    }
    Action {
        id: actionOpen
        text: qsTr("Open")
        iconSource: "qrc:/App/Qml/QtTextEditor/outlines/oOpen.png"
        onTriggered: openDialog.open()
    }
    Action {
        id: actionSave
        text: qsTr("Save")
        iconSource: "qrc:/App/Qml/QtTextEditor/outlines/oSave.png"
        onTriggered: saveDialog.open()
    }
    Action {
        id: actionCopy
        text: qsTr("Copy")
        iconSource: "qrc:/App/Qml/QtTextEditor/outlines/oCopy.png"
        onTriggered: editor.copy()
    }
    Action {
        id: actionCut
        text: qsTr("Cut")
        iconSource: "qrc:/App/Qml/QtTextEditor/outlines/oCut.png"
        onTriggered: editor.cut()
    }
    Action {
        id: actionPaste
        text: qsTr("Paste")
        iconSource: "qrc:/App/Qml/QtTextEditor/outlines/oPaste.png"
        onTriggered: editor.paste()
    }

    //Todo List - add actions
    menuBar: MenuBar {
        Menu {
            id: menuFile
            title: "File"
            MenuItem {action: actionNew}
            MenuItem {action: actionOpen}
            MenuItem {action: actionSave}
        }
        Menu {
            id: editFile
            title: "Edit"
            MenuItem {action: actionCopy}
            MenuItem {action: actionCut}
            MenuItem {action: actionPaste}
        }
    }

//    ToolBar: ToolBar {
        Row {
            ToolButton {action: actionNew}
            ToolButton {action: actionOpen}
            ToolButton {action: actionSave}
            ToolButton {action: actionCopy}
            ToolButton {action: actionCut}
            ToolButton {action: actionPaste}
        }
//    }
//    Rectangle {
//        width: parent.width
//        height: parent.height
//                    anchors.rightMargin: 0
//                    anchors.bottomMargin: -31
//                    anchors.leftMargin: 0
//                    anchors.topMargin: 31
        ScrollView {
            id: vieText
            anchors.rightMargin: 0
            anchors.bottomMargin: -31
            anchors.leftMargin: 0
            anchors.topMargin: 29
            anchors.fill: parent
//            width: parent.width
//            height: parent.height
            TextArea {
                id: editor
                width: vieText.width
                height: vieText.height
                focus: true
                text: "New here"
                selectByMouse: true
            }
        }
//    }
}












