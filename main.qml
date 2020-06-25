import QtQuick 2.5
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.1
import QtQuick.LocalStorage 2.0
import "./Storage.js" as Storage


ApplicationWindow {
    id: applicationWindow
    width: 640
    height: 480
    property alias textFieldHarga: textFieldHarga
    property alias comboBoxGender: comboBoxGender
    property alias kontrakanloader: kontrakanloader
    property int kontrakanJumlahKamar
    property int kontrakanPrice
    property int kosPrice
    property string kosGenderType
    property alias kosloader: kosloader
    title: qsTr("Ngomah Yuk")
    visible: true
    property var db

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("ngomahyuk", "1.0", "StorageDatabase", 1000000)

        db.transaction(function(tx){
//           var sql = 'CREATE TABLE IF NOT EXISTS gender(id INTEGER AUTOINCREMENT PRIMARY KEY NOT NULL, gender TEXT)';
//            tx.executeSql(sql);
            tx.executeSql('CREATE TABLE IF NOT EXISTS gender(gender TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS kos(namakos TEXT, alamat TEXT, jumlahKamar INTEGER, gender TEXT, harga INTEGER, owner TEXT, desk TEXT, thumbnail TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS kontrakan(namakontrakan TEXT, alamat TEXT, jumlahKamar INTEGER, jumlahKM INTEGER, harga INTEGER, owner TEXT, desk TEXT, thumbnail TEXT)');
        });

//        insert gender type for kos
        db.transaction(function(tx){
            for (var i = 0; i < Storage.kos.length; i++){
                try {
                    tx.executeSql("INSERT INTO kos (namakos, alamat, jumlahKamar, gender, harga, owner, desk, thumbnail)
                                VALUES ('"+Storage.kos[i]['nama']+"','"+Storage.kos[i]['alamat']+"',"
                                +Storage.kos[i]['jumlahKamar']+",'"+Storage.kos[i]['gender']+"',"
                                +Storage.kos[i]['harga']+",'"+Storage.kos[i]['owner']
                                +"','"+Storage.kos[i]['desk']+"','"+Storage.kos[i]['thumbnail']+"');");

                } catch (err) {
                    console.log(err);
                }
            }
        });

       db.transaction(function(tx){
       for (var i = 0; i < Storage.kontrakan.length; i++){
           try{
       tx.executeSql("INSERT INTO kontrakan (namakontrakan, alamat, jumlahKamar, jumlahKM, harga, owner, desk, thumbnail)
                                VALUES ('"+Storage.kontrakan[i]['nama']+"','"+Storage.kontrakan[i]['alamat']
                                +"',"+Storage.kontrakan[i]['jumlahKamar']
                                +","+Storage.kontrakan[i]['jumlahKM']+","+Storage.kontrakan[i]['harga']
                                +",'"+Storage.kontrakan[i]['owner']
                                +"','"+Storage.kontrakan[i]['desk']+"','"+Storage.kontrakan[i]['thumbnail']+"');");
                }catch (err){
                    console.log(err);
                }
            }
        });
        db.transaction(function(tx){
            try {

                tx.executeSql("INSERT INTO gender (gender)
                            VALUES ('Laki-laki');");
                tx.executeSql("INSERT INTO gender (gender)
                            VALUES ('Perempuan')");
            } catch (err) {
                console.log(err);
            }

        });
    }


    // HALAMAN UTAMA
    BorderImage {
        id: borderImage
        height: 198
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        source: "static/header.png"
        Button {
            id: buttonHubungi
            x: 526
            y: 14
            width: 96
            height: 35
            font.family: "Verdana"
            visible: true
            contentItem: Text {
                id: name1
                color: "#fff"
                text: "EXIT"
                anchors.fill: parent
                font.bold: true
                font.pointSize: 10
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            background: Rectangle {
                color: "#00f1f0f0"
                border.width: 4
                border.color: "#fff"
                anchors.fill: parent
            }
            font.pixelSize: 16

            MouseArea {
                id: mouseAreaHubungi
                anchors.fill: parent
                onClicked: {
                    Qt.quit()
                    db.transaction(function(tx){
                        tx.executeSql("DROP TABLE kos");
                        tx.executeSql("DROP TABLE kontrakan");
                        tx.executeSql("DROP TABLE gender");
                    });
                }
            }
        }

    }

    ToolSeparator {
        id: toolSeparator
        x: 314
        width: 13
        anchors.top: borderImage.bottom
        anchors.topMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 33
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: button
        x: 198
        width: 87
        height: 30
        text: qsTr("Search")
        font.bold: true
        anchors.top: borderImage.bottom
        anchors.topMargin: 198
        anchors.right: toolSeparator.left
        anchors.rightMargin: 28
        MouseArea{
            anchors.fill: parent
            onClicked:{
                if (textFieldHarga.text === ""){
                    kosPrice = 0
                } else {
                    kosPrice = parseInt(textFieldHarga.text)
                }

                kosGenderType = comboBoxGender.currentText
                kosloader.active = true
                kosloader.visible = true



                if (kosGenderType == "Laki-laki" && kosPrice >= 7350000){


                    kosloader.source = "Kos.qml"
                }else if (kosGenderType == "Perempuan" && kosPrice >= 7350000){
                    kosloader.source = "KosPerempuan.qml"
                }else {
                    alertDialogKos.open()
                }


//                console.log(kosPrice)
//                console.log(kosGenderType)
            }
        }

        MessageDialog{
            id: alertDialogKos
            modality: Qt.ApplicationModal
            title: "Dana Kurang"
            text: "Dana yang dimasukan tidak mencukupi."
            onAccepted: {
                alertDialogKos.close()
            }
        }

        background: Rectangle {
            id: background
            color: "#ef3644"
        }

        contentItem: Text {
            id: textItem
            font: control.font
            opacity: enabled ? 1.0 : 0.3
            color: "white"
            text: "Search"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    TextField {
        id: textFieldHarga
        x: 81
        width: 200
        height: 25
        text: qsTr("")
        anchors.top: borderImage.bottom
        anchors.topMargin: 103
        anchors.right: toolSeparator.left
        anchors.rightMargin: 32
        placeholderText: ""
    }

    Text {
        id: textHarga
        x: 23
        text: qsTr("Harga:")
        anchors.top: borderImage.bottom
        anchors.topMargin: 109
        anchors.right: textFieldHarga.left
        anchors.rightMargin: 23
        font.pixelSize: 12
    }

    ComboBox {
        id: comboBoxGender
        x: 83
        width: 197
        height: 22
        anchors.top: borderImage.bottom
        anchors.topMargin: 140
        anchors.right: toolSeparator.left
        anchors.rightMargin: 33
        textRole: "text"
        model: ListModel {
            ListElement {
                text: "Laki-laki"
                value: 1
            }
            ListElement {
                text: "Perempuan"
                value: 2
            }
        }
    }

    Text {
        id: element
        x: 16
        text: qsTr("Gender:")
        anchors.top: borderImage.bottom
        anchors.topMargin: 142
        anchors.right: comboBoxGender.left
        anchors.rightMargin: 23
        font.pixelSize: 12
    }

    Text {
        id: element1
        x: 33
        width: 50
        height: 28
        color: "#ef3644"
        text: qsTr("KOS")
        anchors.right: toolSeparator.left
        anchors.rightMargin: 230
        anchors.top: borderImage.bottom
        anchors.topMargin: 63
        font.bold: true
        font.pixelSize: 22
    }

    Text {
        id: element2
        x: 363
        y: 268
        width: 50
        height: 28
        text: qsTr("KONTRAKAN")
        font.pixelSize: 22
        anchors.left: toolSeparator.right
        anchors.leftMargin: 40
        anchors.top: borderImage.bottom
        anchors.topMargin: 63
        font.bold: true
        color: "#ef3644"
    }

    Text {
        id: element3
        x: 23
        text: qsTr("Harga:")
        anchors.top: borderImage.bottom
        anchors.topMargin: 109
        anchors.left: textFieldHarga.right
        anchors.leftMargin: 95
        font.pixelSize: 12
    }

    TextField {
        id: textFieldHargaKontrakan
        x: 394
        y: 301
        text: qsTr("")
        width: 200
        height: 25
        anchors.top: borderImage.bottom
        anchors.topMargin: 103
        anchors.left: toolSeparator.right
        anchors.leftMargin: 100
        placeholderText: ""
    }

    Text {
        id: element4
        x: 350
        y: 342
        width: 37
        height: 12
        text: qsTr("Jumlah Kamar:")
        font.pixelSize: 12
        anchors.top: borderImage.bottom
        anchors.topMargin: 142
        anchors.left: comboBoxGender.right
        anchors.leftMargin: 53
    }

    TextField {
        id: textFieldJumlahKamar
        x: 426
        y: 338
        width: 200
        height: 25
        anchors.top: borderImage.bottom
        anchors.topMargin: 138
        anchors.left: toolSeparator.right
        anchors.leftMargin: 100
        placeholderText: "Kosongkan jika tidak tertentu"
    }

    Button {
        id: button1
        x: 526
        y: 391
        width: 87
        height: 30
        text: qsTr("Search")
        font.bold: true
        anchors.top: borderImage.bottom
        anchors.topMargin: 198
        anchors.left: toolSeparator.right
        anchors.leftMargin: 213
        background: Rectangle {
            id: background1
            color: "#ef3644"
        }

        contentItem: Text {
            id: textItem1
            font: control.font
            opacity: enabled ? 1.0 : 0.3
            color: "white"
            text: "Search"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        MouseArea {
            id: mouseAreakontrakan
            anchors.fill: parent
            onClicked: {
                if (textFieldHargaKontrakan.text === ""){
                    kontrakanPrice = 0
                } else {
                    kontrakanPrice = parseInt(textFieldHargaKontrakan.text)
                }

                if (textFieldJumlahKamar.text === ""){
                    kontrakanJumlahKamar = 0
                } else {
                    kontrakanJumlahKamar = parseInt(textFieldJumlahKamar.text)
                }

                if (kontrakanPrice >= 35000000){
                    kontrakanloader.source = "Kontrakan.qml"
                }else {
                    alertDialogKontrakan.open()
                }

                kontrakanloader.active = true
                kontrakanloader.visible = true
                console.log(kontrakanPrice)
                console.log(kontrakanJumlahKamar)
            }
        }
    }

    MessageDialog{
        id: alertDialogKontrakan
        modality: Qt.ApplicationModal
        title: "Dana Kurang"
        text: "Dana yang dimasukan tidak mencukupi."
        onAccepted: {
            alertDialogKontrakan.close()
        }
    }

    Loader{
        id: kosloader
        width: 640
        height: 480
        opacity: 1
        clip: false
        visible: false
        active: false
        anchors.fill: parent
        source: ""
    }

    Loader{
        id: kontrakanloader
        width: 640
        height: 480
        opacity: 1
        clip: false
        visible: false
        active: false
        anchors.fill: parent
        source: ""
    }


}


