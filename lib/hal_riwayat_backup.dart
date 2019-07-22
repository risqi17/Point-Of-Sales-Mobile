import 'package:flutter/material.dart';
import './hal_detail_pesanan.dart' as detail;
import 'fancy_button.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatelessWidget {
  Future<List<Trans>> _getTrans() async {
    var data = await http
        .get("http://apiposit.000webhostapp.com/transaksiSelesai.json");
    var jsonData = json.decode(data.body);

    List<Trans> transaksis = [];

    for (var u in jsonData) {
      //Trans transaksi =Trans(u["id"], u["waktu"], u["totaltransaksi"], u["totalbayar"], u["bayar"], u["kembalian"], u["userid"], u["pembeli"],u["catatan"],u["status"]);
      Trans transaksi = Trans(
          u["id"],
          u["waktu"],
          u["totaltransaksi"],
          u["totalbayar"],
          u["bayar"],
          u["kembalian"],
          u["bayarpakai"],
          u["userid"],
          u["pembeli"],
          u["catatan"],
          u["status"]);
      transaksis.add(transaksi);
    }
    print(transaksis.length);
    return transaksis;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 170.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [redgrad1,redgrad2]
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text('Riwayat transaksi', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),),
                        SizedBox(height: 8.0,),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 16.0,),
                       Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 2.0,
                                ),
                            ],
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                        Text('Rabu, 10 April 2019', style: TextStyle(color: Colors.black54, fontSize: 12.0),),
                         Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 2.0,
                                ),
                            ],
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                         Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 2.0,
                                ),
                            ],
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                         Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 2.0,
                                ),
                            ],
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                         Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 6.0),
                                  blurRadius: 2.0,
                                ),
                            ],
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.0,),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FancyButton(
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => detail.DetailPesanan()));
          },
        ),
      ),
    );
  }
}

var orange = Color(0xFFfc9f6a);
var pink = Color(0xFFee528c);
var blue = Color(0xFF8bccd6);
var darkblue = Color(0xFF60a0d7);
var valueBlue = Color(0xFF5fa0d6);
var redgrad1 = Color(0xffff0844);
var redgrad2 = Color(0xffffb199);

class Trans {
  final int id;
  final String waktu;
  final int totaltransaksi;
  final int totalbayar;
  final int bayar;
  final int kembalian;
  final String bayarpakai;
  final int userid;
  final String pembeli;
  final String catatan;
  final String status;

  Trans(
      this.id,
      this.waktu,
      this.totaltransaksi,
      this.totalbayar,
      this.bayar,
      this.kembalian,
      this.bayarpakai,
      this.userid,
      this.pembeli,
      this.catatan,
      this.status);
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
