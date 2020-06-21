import QtQuick 2.0
import QtQuick.Controls 2.13

Item {
    Image {
        id: idthumbnail
        x: 0
        y: 1
        width: 235
        height: 165
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Text {
        id: idnamakontrakan
        x: 252
        y: 8
        text: qsTr("KONTRAKAN")
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
        text: qsTr("Alamat            : ")
        font.pixelSize: 12
        font.family: "Verdana"
    }

    Text {
        id: idjumlahkamar
        x: 252
        y: 63
        width: 240
        height: 14
        text: qsTr("Jumlah Kamar : ")
        font.pixelSize: 12
        font.family: "Verdana"
    }

    Text {
        id: idharga
        x: 251
        y: 83
        width: 373
        height: 14
        text: qsTr("Harga              : ")
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
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:10;anchors_height:100;anchors_width:100}
D{i:14;anchors_height:100;anchors_width:100}
}
##^##*/
