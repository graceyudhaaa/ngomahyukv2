import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.LocalStorage 2.0
import "./Storage.js" as Storage

PageBackground {
    id: kos
    width: 640
    height: 480
    property var db


    Text {
        id: element
        x: 6
        y: 20
        width: 24
        height: 32
        color: "#ffffff"
        text: qsTr("<")
        font.strikeout: false
        styleColor: "#ffffff"
        font.underline: false
        font.italic: false
        font.bold: true
        font.pixelSize: 25
        MouseArea {
            id: mouseArea
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: kosloader.source = ""
        }

    }

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("ngomahyuk", "1.0", "StorageDatabase", 1000000)

        db.transaction(function(tx){
           var res = tx.executeSql("SELECT * FROM kos WHERE gender = '"+ comboBoxGender.currentText +"' AND harga <="+ parseInt(textFieldHarga.text));
            for(var i = 0; i < res.rows.length; i++){
                listViewKos.model.append({
                    "imagePath" :  JSON.stringify(res.rows[i].thumbnail).replace(/\"/g, ""),
                    "kosName" : res.rows[i].namakos,
                    "kosAlamat" : res.rows[i].alamat,
                    "kosJumlahKamar": JSON.stringify(res.rows[i].jumlahKamar),
                    "kosGender" : res.rows[i].gender,
                    "kosHarga": JSON.stringify(res.rows[i].harga),
                    "kosProfile": "KosSpec.qml",
                    "ownerContact": res.rows[i].owner
                });
            }

        });
    }


    ListView {
        id: listViewKos
        x: 15
        y: 87
        width: 640
        height: 410
        clip: true
        model: ListModel{
//            need to be in for loop and data from database
        }


//        delegate listview template
        delegate: Item {
            height  : 195
            width   : 640
            Image {
                id: idthumbnail
                x: 0
                y: 1
                width: 235
                height: 165
                source: imagePath
                fillMode: Image.PreserveAspectCrop
            }

            Text {
                id: idnamakos
                x: 252
                y: 8
                text: kosName
                font.bold: true
                font.family: "Verdana"
                wrapMode: Text.WordWrap
                font.pixelSize: 22
            }

            Text {
                id: idalamat
                x: 251
                y: 40
                width: 301
                height: 17
                text: qsTr("Alamat            : " + kosAlamat)
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                font.family: "Verdana"
            }

            Text {
                id: idjumlahkamar
                x: 252
                y: 63
                width: 240
                height: 14
                text: qsTr("Jumlah Kamar : " + kosJumlahKamar)
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                font.family: "Verdana"
            }

            Text {
                id: idgender
                x: 251
                y: 83
                width: 265
                height: 14
                text: qsTr("Gender            : " + kosGender)
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                font.family: "Verdana"
            }

            Text {
                id: idharga
                x: 251
                y: 103
                width: 373
                height: 14
                text: qsTr("Harga              : Rp " + kosHarga)
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                elide: Text.ElideNone
                font.family: "Verdana"
            }

            Button {
                id: buttonCek
                x: 510
                y: 131
                width: 96
                height: 35
                visible: true
                font.family: "Verdana"
                font.pixelSize: 16
                background: Rectangle{
                    color: "#ef3644"
                    anchors.fill: parent

                }
                contentItem: Text {
                    id: cek
                    text: "CEK"
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 10
                    horizontalAlignment: Text.AlignHCenter
                    color: "#ffffff"
                }

                MouseArea {
                    id: mouseAreaCek
                    anchors.fill: parent
                    onClicked: {
                        kosspec.visible = true
                        kosspec.source = kosProfile
                    }
                }


            }

            Button {
                id: buttonHubungi
                x: 400
                y: 131
                width: 96
                height: 35
                font.family: "Verdana"
                visible: true
                contentItem: Text {
                    id: name1
                    color: "#ef3644"
                    text: "HUBUNGI"
                    anchors.fill: parent
                    font.bold: true
                    font.pointSize: 10
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                    color: "#00f1f0f0"
                    border.width: 4
                    border.color: "#ef3644"
                    anchors.fill: parent
                }
                font.pixelSize: 16

                MouseArea {
                    id: mouseAreaHubungi
                    anchors.fill: parent
                    onClicked: {
                        Qt.openUrlExternally (ownerContact);
                    }
                }
            }

            ToolSeparator {
                id: toolSeparator
                x: 8
                y: 172
                width: 600
                height: 15
                orientation: Qt.Horizontal
            }

        }
    }


    Loader{
        id: kosspec
        visible: false
        source: "KosSpec.qml"
    }
    Loader{
        id: kosspec1
        visible: false
        source: "KosSpec1.qml"
    }
    Loader{
        id: kosspec2
        visible: false
        source: "KosSpec2.qml"
    }
}

