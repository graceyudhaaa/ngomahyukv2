import QtQuick 2.4
import QtQuick.Controls 2.3

PageBackground {
    id: kontrakan
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
            onClicked: kontrakanloader.source = ""
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
                imagePath : "static/kontrakan1.jfif"
                kontrakanName : "Kontrakan Lorem"
                kontrakanAlamat : "Jalan Lorem, No. 3 RT6/RW4"
                kontrakanJumlahKamar: "3"
                kontrakanJumlahKM : "2"
                kontrakanHarga: "Rp.28.000.000"
                kontrakanProfile: "KontrakanSpec.qml"
                ownerContact: "https://www.instagram.com/sandi.laa/?hl=id"
            }
           ListElement{
                imagePath : "static/kontrakan2.jpg"
                kontrakanName : "Kontrakan Dolor"
                kontrakanAlamat : "Jalan Dolor, No. 2 RT1/RW21"
                kontrakanJumlahKamar: "3"
                kontrakanJumlahKM : "2"
                kontrakanHarga: "Rp.23.000.000"
                kontrakanProfile: "KontrakanSpec1.qml"
                ownerContact: "https://www.instagram.com/graceyudha/?hl=id"
            }
           ListElement{
                imagePath : "static/kontrakan3.jpg"
                kontrakanName : "Kontrakan Ipsum"
                kontrakanAlamat : "Jalan Ipsum, No. 12 RT1/RW1"
                kontrakanJumlahKamar: "4"
                kontrakanJumlahKM : "3"
                kontrakanHarga: "Rp.35.000.000"
                kontrakanProfile: "KontrakanSpec2.qml"
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
                id: idnamakontrakan
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
                y: 43
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
                id: idjumlahkm
                x: 251
                y: 83
                width: 373
                height: 14
                text: qsTr("Jumlah KM      : " + kontrakanJumlahKM)
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                elide: Text.ElideNone
                font.family: "Verdana"
            }
            Text {
                id: idharga
                x: 251
                y: 103
                width: 373
                height: 14
                text: qsTr("Harga              : " + kontrakanHarga)
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
                        kontrakanspec.visible = true
                        kontrakanspec.source = kontrakanProfile
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
        id: kontrakanspec
        visible: false
        source: "KontrakanSpec.qml"
    }
    Loader{
        id: kontrakanspec1
        visible: false
        source: "KontrakanSpec1.qml"
    }
    Loader{
        id: kontrakanspec2
        visible: false
        source: "KontrakanSpec2.qml"
    }
}

