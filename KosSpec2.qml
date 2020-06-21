import QtQuick 2.4
import QtQuick.Controls 2.5

PageBackground {
    id: kos1
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
            onClicked: kosspec.source = ""
        }
   }
    /////////////////////////////////////       SPESIFIKASI KOS 2  ////////////////////////////


                 BorderImage {
                   id: borderImage5
                   x: 17
                   y: 102
                   width: 265
                   height: 185
                   source: "static/kosku1.jpg"
                    }

                    Text {
                        id: element16
                        x: 293
                        y: 115
                        width: 196
                        height: 19
                        text: qsTr("KOS IPSUM")
                        font.bold: true
                        font.pixelSize: 18
                    }

                    Text {
                        id: element17
                        x: 310
                        y: 140
                        font.pixelSize: 12
                    }

                    Text {
                        id: element18
                        x: 293
                        y: 147
                        text: qsTr("Alamat            : Jalan Ipsum, No. 666 RT3/RW1")
                        font.pixelSize: 12
                    }

                    Text {
                        id: element19
                        x: 293
                        y: 167
                        width: 216
                        height: 14
                        text: qsTr("Jumlah Kamar  : 14")
                        font.pixelSize: 12
                    }

                    Text {
                        id: element20
                        x: 293
                        y: 187
                        text: qsTr("Gender           : Laki-laki")
                        font.pixelSize: 12
                    }

                    Text {
                        id: element21
                        x: 293
                        y: 207
                        text: qsTr("Harga             : Rp. 7.000.000,00 - Rp. 8.500.000 / tahun")
                        font.pixelSize: 12
                    }

                    Text {
                        id: element22
                        x: 293
                        y: 233
                        text: qsTr("DESKRIPSI")
                        font.bold: true
                        font.pixelSize: 12
                    }

                    Label {
                        id: label
                        x: 293
                        y: 253
                        width: 323
                        height: 70
                        text: qsTr("Kos dengan hunian sangat nyaman tapi tiba-tiba hilang ):. ")
                    }

                          Button {
                              id: button6
                              x: 443
                              y: 387
                              width: 145
                              height: 36
                              text: qsTr("BOOK NOW")
                              font.bold: true
                              font.pointSize: 15
                              font.family: "Verdana"

                              background: Rectangle{
                                  id: background5
                                  color: "#ef3644"
                              }
                              contentItem: Text {
                                  id: text3
                                  text: qsTr("BOOK NOW")
                                  font.bold: true
                                  font.pointSize: 13
                                  font.family: "Verdana"
                                  verticalAlignment: Text.AlignVCenter
                                  horizontalAlignment: Text.AlignHCenter
                                  color: "#ffffff"
                              }
                          }

                          Text {
                              id: element31
                              x: 293
                              y: 395
                              width: 138
                              height: 20
                              text: qsTr("Rp. 7.000.000")
                              font.bold: true
                              font.family: "Arial"
                              verticalAlignment: Text.AlignVCenter
                              horizontalAlignment: Text.AlignHCenter
                              font.pixelSize: 21
                          }

                          Rectangle {
                              id: rectangle4
                              x: 17
                              y: 309
                              width: 73
                              height: 31
                              color: "#fbfbfb"
                              border.color: "#f73737"

                              Text {
                                  id: element32
                                  x: 8
                                  y: 8
                                  width: 60
                                  height: 14
                                  text: qsTr("Kamar")
                                  font.bold: true
                                  font.family: "Arial"
                                  verticalAlignment: Text.AlignVCenter
                                  horizontalAlignment: Text.AlignHCenter
                                  font.pixelSize: 14

                                  MouseArea {
                                      anchors.fill: parent
                                      id: mouseArea2
                                      x: 17
                                      y: 321
                                      width: 76
                                      height: 30
                                      anchors.rightMargin: 0
                                      anchors.bottomMargin: 0
                                      anchors.leftMargin: 0
                                      anchors.topMargin: 0

                                      onPressed: parent.color = "red"
                                      onReleased: parent.color = "black"
                                  }
                              }
                          }

                          Rectangle {
                              id: rectangle6
                              x: 113
                              y: 309
                              width: 73
                              height: 31
                              color: "#ffffff"
                              border.color: "#f73737"

                              Text {
                                  id: element33
                                  x: 5
                                  y: 8
                                  text: qsTr("KM Dalam")
                                  font.bold: true
                                  font.family: "Arial"
                                  verticalAlignment: Text.AlignVCenter
                                  horizontalAlignment: Text.AlignHCenter
                                  font.pixelSize: 13
                                  MouseArea {
                                      anchors.fill: parent
                                      id: mouseArea3
                                      x: 17
                                      y: 321
                                      width: 76
                                      height: 30
                                      anchors.rightMargin: 0
                                      anchors.bottomMargin: 0
                                      anchors.leftMargin: 0
                                      anchors.topMargin: 0

                                      onPressed: parent.color = "red"
                                      onReleased: parent.color = "black"
                                  }
                              }

                          }

                          Rectangle {
                              id: rectangle7
                              x: 209
                              y: 309
                              width: 73
                              height: 31
                              color: "#ffffff"
                              border.color: "#f73737"

                              Text {
                                  id: element34
                                  x: 11
                                  y: 8
                                  text: qsTr("AC + TV")
                                  font.bold: true
                                  font.family: "Arial"
                                  verticalAlignment: Text.AlignVCenter
                                  horizontalAlignment: Text.AlignHCenter
                                  font.pixelSize: 13

                                  MouseArea {
                                      anchors.fill: parent
                                      id: mouseArea4
                                      x: 17
                                      y: 321
                                      width: 76
                                      height: 30
                                      anchors.rightMargin: 0
                                      anchors.bottomMargin: 0
                                      anchors.leftMargin: 0
                                      anchors.topMargin: 0

                                      onPressed: parent.color = "red"
                                      onReleased: parent.color = "black"
                                  }
                              }
                          }
}
