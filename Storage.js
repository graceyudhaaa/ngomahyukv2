.import QtQuick.LocalStorage 2.0 as Sql

//// First, let's create a short helper function to get the database connection
function getDatabase() {
     return Sql.LocalStorage.openDatabaseSync("ngomahyuk", "0.1", "StorageDatabase", 100000);
}

var kos = [{'nama':'Kos Lorem',
            'alamat':'Jalan Lorem, No.01 RT6/RW1',
            'jumlahKamar':15,
            'gender':'Laki-laki',
            'harga':"7350000",
            'owner':'https://www.instagram.com/sandi.laa/?hl=id',
            'desk':'kos dengan hunian sangat nyaman dan fasilitas seperti hotel',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/Bisnis-kos-kosan.png'
           },
           {'nama':'Kos Dolor',
            'alamat':'Jalan Dolor, No.12 RT1/RW12',
            'jumlahKamar':13,
            'gender':'Laki-laki',
            'harga':7100000,
            'owner':'https://www.instagram.com/graceyudha/?hl=id',
            'desk':'kos dengan hunian sangat nyaman dan fasilitas seperti hotel',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/kosku.jpg'
           },
           {'nama':'Kos Ipsum',
            'alamat':'Jalan Ipsum, No.666 RT3/RW1',
            'jumlahKamar':14,
            'gender':'Laki-laki',
            'harga':7000000,
            'owner':'https://www.instagram.com/wandaalifh/?hl=id',
            'desk':'kos dengan hunian sangat nyaman dan fasilitas seperti hotel',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/kosku1.jpg'
           },
           {'nama':'Kos Lorem',
            'alamat':'Jalan Lorem, No11 RT1/RW12',
            'jumlahKamar':15,
            'gender':'Perempuan',
            'harga':720000,
            'owner':'https://www.instagram.com/sandi.laa/?hl=id',
            'desk':'kos dengan hunian sangat nyaman dan fasilitas seperti hotel',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/Bisnis-kos-kosan.png'
           },
           {'nama':'Kos Dolor',
            'alamat':'Jalan Dolor, No.21 RT3/RW1',
            'jumlahKamar':13,
            'gender':'Perempuan',
            'harga':7350000,
            'owner':'https://www.instagram.com/graceyudha/?hl=id',
            'desk':'kos dengan hunian sangat nyaman dan fasilitas seperti hotel',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/Bisnis-kos-kosan.png'
           },
           {'nama':'Kos Ipsum',
            'alamat':'Jalan Ipsum, No.5 RT2/RW14',
            'jumlahKamar':14,
            'gender':'Perempuan',
            'harga':7150000,
            'owner':'https://www.instagram.com/wandaalifh/?hl=id',
            'desk':'kos dengan hunian sangat nyaman dan fasilitas seperti hotel',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/Bisnis-kos-kosan.png'
           }
        ];

var kontrakan = [{'nama':'Kontrakan Lorem',
            'alamat':'Jalan Lorem, No.03 RT6/RW4',
            'jumlahKamar':3,
            'jumlahKM':2,
            'harga':28000000,
            'owner':'https://www.instagram.com/sandi.laa/?hl=id',
            'desk':'Tempat Stategis Nyaman dan Aestetik.',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/Bisnis-kos-kosan.png'
           },
           {'nama':'Kontrakan Dolor',
            'alamat':'Jalan Dolor, No.2 RT1/RW2',
            'jumlahKamar':3,
            'jumlahKM':2,
            'harga':23000000,
            'owner':'https://www.instagram.com/graceyudha/?hl=id',
            'desk':'Tempat Stategis Nyaman dan Aestetik.',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/Bisnis-kos-kosan.png'
           },
           {'nama':'Kontrakan Ipsum',
            'alamat':'Jalan Ipsum, No.12 RT1/RW1',
            'jumlahKamar':4,
            'jumlahKM':3,
            'harga':35000000,
            'owner':'https://www.instagram.com/wandaalifh/?hl=id',
            'desk':'Tempat Stategis Nyaman dan Aestetik.',
            'fasilitas':['Kamar','KM Dalam','AC+TV'],
            'thumbnail': 'static/Bisnis-kos-kosan.png'
           }
        ];


function kosQuery() {
    db = LocalStorage.openDatabaseSync("ngomahyuk", "1.0", "StorageDatabase", 1000000)

    db.transaction(function(tx){
       var res = tx.executeSql("SELECT * FROM kos WHERE gender = '"+comboBoxGender.currentText+"' AND harga <="+ parseInt(textFieldHarga.text));
       for (var i; i < res.rows.length; i++){
           listViewKos.model.append({
               "imagePath" :  res.rows[i].thumbnail,
               "kosName" : res.rows[i].namakos,
               "kosAlamat" : res.rows[i].alamat,
               "kosJumlahKamar": res.rows[i].jumlahKamar,
               "kosGender" : res.rows[i].gender,
               "kosHarga": res.rows[i].harga,
               "kosProfile": "KosSpec.qml",
               "ownerContact": res.rows[i].owner
           });
       }
    });
}
