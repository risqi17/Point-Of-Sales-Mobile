import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(new MaterialApp()); //material app
}

class Riwayat extends StatefulWidget {
  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  Future<List<Data>> _getTrans() async {
    var data = await http
        .get("https://apiposit.000webhostapp.com/public/transaksi",
        headers: {HttpHeaders.authorizationHeader: "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhcmllIn0.OJ-BEAYBDij1Yx9JtCIl2jmPzhUEpIBQKIzCfhv1gSM"},);
    var jsonData = json.decode(data.body);

    List<Data> transaksis = [];

    for (var u in jsonData) {
    
      Data transaksi = Data(
          u["transid"],
          u["transdate"],
          u["transtotal"],
          u["transtotalprice"],
          u["transpay"],
          u["transreturn"],
          u["userid"],
          u["transbuyer"],
          u["transnote"],
          u["transstatus"],
          u["transpayment"]);
      transaksis.add(transaksi);
    }
    print(transaksis.length);
    return transaksis;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffF0EEF1),
      appBar: new AppBar(
        backgroundColor: Colors.redAccent[400],
        title: new Text("Riwayat transaksi"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getTrans(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: SpinKitCircle(
                    color: Color(0xff6991c7),
                    size: 50.0,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                       Navigator.push(
                           context,
                           new MaterialPageRoute(
                               builder: (context) =>
                                   DetailPage(snapshot.data[index])));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                            child: Text('No.'),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 0.0),
                                child: Text(snapshot.data[index].transid.toString(),
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                              ),
                              VerticalDivider(),
                              Expanded(
                                child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Rp. " +
                                            snapshot.data[index].transtotalprice
                                                .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      Text(
                                        snapshot.data[index].transpayment,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 19.0,
                                    ),
                                    child: Text('14.30',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0)),
                                  ),
                                ],
                              ),
                              )
                              
                            ],
                          ),
                          SizedBox(
                            height: 25.0,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class Data {
  final String transid;
  final String transdate;
  final String transtotal;
  final String transtotalprice;
  final String transpay;
  final String transreturn;
  final String userid;
  final String transbuyer;
  final String transnote;
  final String transstatus;
  final String transpayment;

  Data(
      this.transid,
      this.transdate,
      this.transtotal,
      this.transtotalprice,
      this.transpay,
      this.transreturn,
      this.userid,
      this.transbuyer,
      this.transnote,
      this.transstatus,
      this.transpayment
      );

}




class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      width: 1.0,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  final width;
  HorizontalDivider(this.width);
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 1.0,
      width: width,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Data trans;
  DetailPage(this.trans);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent[400],
          title: Text("No. Transaksi " + trans.transid.toString()),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 32.0, right: 90.0, top: 30.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Tanggal', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11.0)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text('Senin, 4 Maret 2019', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,)),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Jam', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11.0)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text('16.50', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Pembeli', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11.0)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text('Syamsul Arifin', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,)),
                      ),
                      SizedBox(height: 20.0),
                      Text('Voucher', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11.0)),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text('-', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,)),
                      )
                    ],
                  )
                ],
              ),
            ),
            HorizontalDivider(MediaQuery.of(context).size.width / 0.8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Tempe Goreng Crispy X 3', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,)),
                          Text('Rp. 2.000,-', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Text('Rp. 6.000,-', style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Mie Ayam Jago X 1', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,)),
                          Text('Rp. 7.500,-', style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      Text('Rp. 7.500,-', style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Bakso Ceker Pedas X 4', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,)),
                          Text('Rp. 10.000,-', style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      Text('Rp. 40.000,-', style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  HorizontalDivider(300.0),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Total Belanja', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                          SizedBox(height: 10.0,),
                          Text('Jumlah Bayar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                          SizedBox(height: 10.0,),
                          Text('Diskon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                          SizedBox(height: 10.0,),
                          Text('Kembalian', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Rp. 53.500,-', style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10.0,),
                          Text('Rp. 60.000,-', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10.0,),
                          Text('Rp. -', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10.0,),
                          Text('Rp. 6.500,-', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )));
  }
}
