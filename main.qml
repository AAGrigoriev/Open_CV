import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2

import QtQuick.Controls.Private 1.0
import QtQuick.Dialogs 1.2
import Qt.labs.folderlistmodel 2.2


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Column{
        anchors.fill: parent
        spacing: 5

        Button{
            width: parent.width
            text:"open file dialog"
            onClicked:{
    //                dataStore.callMeFromQml()
                fileDialog.open()
            }
        }

        CheckBox {
            checked: true
            text: qsTr("tv")
        }
        CheckBox {
            text: qsTr("ir")
        }
        CheckBox {
            checked: true
            text: qsTr("bins")
        }
        CheckBox {
            checked: true
            text: qsTr("svs")
        }
    }


    Rectangle {
        id: mainRect
        x: 340
        y: 40
        width: 300
        height: 397
        border.color: "black"
        radius: 30
        ListView {
            y: 30
            width: parent.width
            height: parent.height - 60
            synchronousDrag: false
            pixelAligned: false
            contentHeight: 200
            highlightMoveVelocity: 400
            clip: true
            model: FolderListModel {
                id: folderListModel
                showDirsFirst: true
 //               nameFilters: ["*.ghsm"]
                nameFilters: ["*.*"]
                rootFolder: "file:///home/"
                folder: "file:///home/"

            }

            delegate: Button {
                width: parent.width
                height: 20
                text: fileName
                onClicked: {
//                    if (fileIsDir) {
//                        folderListModel.folder = fileURL
//                        bg_button.color = "#bbbbbb"
//                    }
                    if (bg_button.color == "#58bc58")
                        bg_button.color = "#bbbbbb"
                    else
                        bg_button.color = "#58bc58"
                }
                background: Rectangle {
                    id: bg_button
                    color: "#58bc58"
                    border.color: "black"
                }
            }
        }
    }
    Button {
        y: 440
        width: 300
        height: 40
        anchors.left: mainRect.right
        anchors.leftMargin: -300
        text: "back"
        onClicked: {
            if(folderListModel.folder.toString() !== "file:///home/")
            folderListModel.folder = folderListModel.parentFolder

//            text: qsTr("Add Item")
            comboBox1.addElement("Add Item")
        }
    }



    FileDialog{
        id: fileDialog
        selectMultiple: false
        selectFolder: true
        folder: "file:///home/"
        //nameFilters: "*.o , *.cpp"
        onAccepted:{
            console.log("You chose: " + fileDialog.fileUrl)
            dataAdapter.callMeFromQml(fileDialog.fileUrl)
            folderListModel.folder = fileDialog.fileUrl
        }

    }

    ComboBox {
        id: comboBox1
        x: 6
        y: 225
        width: 328
        height: 40
        model: ListModel {
                id: model
                ListElement { text: "Banana" }
                ListElement { text: "Apple" }
                ListElement { text: "Coconut" }
            }
        onAccepted: {
            if (find(editText) === -1)
                cb.append({text: editText})
        }
    }




}
