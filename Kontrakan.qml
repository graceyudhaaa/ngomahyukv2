import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.LocalStorage 2.0

PageBackground {
    id: kontrakan
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
            onClicked: {
                kontrakanloader.source = ""
            }

        }
    }

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("ngomahyuk", "1.0", "StorageDatabase", 1000000);

        var kontrakanPrice
        if (textFieldHargaKontrakan.text === ""){
            kontrakanPrice = 0
        } else {
            kontrakanPrice = parseInt(textFieldHargaKontrakan.text)
        }

        var kontrakanJumlahKamar
        if (textFieldJumlahKamar.text === ""){
            kontrakanJumlahKamar = 0
        } else {
            kontrakanJumlahKamar = parseInt(textFieldJumlahKamar.text)
        }

        db.transaction(function(tx){
            var res = tx.executeSql("SELECT * FROM kontrakan WHERE jumlahKamar <= "+kontrakanJumlahKamar+" AND harga <="+ kontrakanPrice + " ORDER BY harga");

            for(var i = 0; i < res.rows.length; i++){
                listViewKontrakan.model.append({
                    "imagePath" :  JSON.stringify(res.rows[i].thumbnail).replace(/\"/g, ""),
                    "kontrakanName" : res.rows[i].namakontrakan,
                    "kontrakanAlamat" : res.rows[i].alamat,
                    "kontrakanJumlahKamar": JSON.stringify(res.rows[i].jumlahKamar),
                    "kontrakanJumlahKM" : JSON.stringify(res.rows[i].jumlahKM),
                    "kontrakanHarga": JSON.stringify(res.rows[i].harga).replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1."),
                    "kontrakanDeskripsi":res.rows[i].desk,
                    "ownerContact": res.rows[i].owner,
                });
            }
        });
    }



    ListView {
        id: listViewKontrakan
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
            height  : 235
            width   : 640

            Image {
                id: idthumbnail
                x: 8
                y: 12
                width: 222
                height: 156
                source: imagePath
                fillMode: Image.PreserveAspectCrop
            }

            Text {
                id: idnamakos
                x: 252
                y: 8
                text: kontrakanName
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
                text: qsTr("Alamat            : " + kontrakanAlamat)
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
                text: qsTr("Jumlah Kamar : " + kontrakanJumlahKamar)
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                font.family: "Verdana"
            }

            Text {
                id: idjumlahKM
                x: 251
                y: 83
                width: 265
                height: 14
                text: qsTr("Gender            : " + kontrakanJumlahKM)
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
                text: qsTr("Harga              : Rp " + kontrakanHarga)
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                elide: Text.ElideNone
                font.family: "Verdana"
            }

            Text {
                id: iddesk
                x: 251
                y: 123
                width: 154
                height: 14
                text: qsTr("Deskripsi          :")
                wrapMode: Text.WordWrap
                elide: Text.ElideNone
                font.pixelSize: 12
                font.family: "Verdana"

                Text {
                    id: deskripsi
                    x: 100
                    y: 0
                    width: 243
                    height: 43
                    text: qsTr(kontrakanDeskripsi)
                    font.family: "Verdana"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 12
                }
            }

            Button {
                id: buttonHubungi
                x: 473
                y: 181
                width: 123
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
                y: 217
                width: 600
                height: 15
                orientation: Qt.Horizontal
            }

        }
    }
}

