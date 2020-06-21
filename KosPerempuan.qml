import QtQuick 2.4
import QtQuick.Controls 2.3

PageBackground {
    id: kos
    width: 640
    height: 480

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

    ListView {
        id: listView
        x: 15
        y: 87
        width: 640
        height: 410
        model: ListModel{
//            need to be in for loop and data from database
           ListElement{
                imagePath : "static/kos1.jpg"
                kosName : "Kos Lorem"
                kosAlamat : "Jalan Lorem, No. 111 RT1/RW12"
                kosJumlahKamar: "15"
                kosGender : "Perempuan"
                kosHarga: "Rp.7.200.000"
                kosProfile: "KosSpecFemale.qml"
                ownerContact: "https://www.instagram.com/sandi.laa/?hl=id"
            }
           ListElement{
                imagePath : "static/kos2.jpg"
                kosName : "Kos Dolor"
                kosAlamat : "Jalan Dolor, No. 21 RT3/RW1"
                kosJumlahKamar: "13"
                kosGender : "Perempuan"
                kosHarga: "Rp.7.350.000"
                kosProfile: "KosSpecFemale1.qml"
                ownerContact: "https://www.instagram.com/graceyudha/?hl=id"
            }
           ListElement{
                imagePath : "static/kost.jpg"
                kosName : "Kos Ipsum"
                kosAlamat : "Jalan Ipsum, No. 5 RT2/RW14"
                kosJumlahKamar: "14"
                kosGender : "Perempuan"
                kosHarga: "Rp.7.150.000"
                kosProfile: "KosSpecFemale2.qml"
                ownerContact: "https://www.instagram.com/wandaalifh/?hl=id"
            }
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
                text: qsTr("Harga              : " + kosHarga)
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
                        kosspecfemale.visible = true
                        kosspecfemale.source = kosProfile
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
        id: kosspecfemale
        visible: false
        source: "KosSpecFemale.qml"
    }
    Loader{
        id: kosspecfemale1
        visible: false
        source: "KosSpecFemale1.qml"
    }
    Loader{
        id: kosspecfemale2
        visible: false
        source: "KosSpecFemale2.qml"
    }
}


