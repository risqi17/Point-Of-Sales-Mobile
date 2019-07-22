import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'hal_menu.dart' as menu;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Transaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<List<Trans>> _getUser() async{
    var data = await http.get("http://apiposit.000webhostapp.com/transaksi.json");
    var jsonData =json.decode(data.body);

    List<Trans> transaksis = [];

    for(var u in jsonData){
      //Trans transaksi =Trans(u["id"], u["waktu"], u["totaltransaksi"], u["totalbayar"], u["bayar"], u["kembalian"], u["userid"], u["pembeli"],u["catatan"],u["status"]);
      Trans transaksi =Trans(u["id"], u["waktu"], u["totaltransaksi"], u["totalbayar"], u["bayar"], u["kembalian"], u["userid"], u["pembeli"],u["catatan"],u["status"]);
      transaksis.add(transaksi);
    }
    print(transaksis.length);
    return transaksis;
  }

    return new MaterialApp(
      title: "",
      home: new Scaffold(
        backgroundColor: Color(0xffF0EEF1),
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          backgroundColor: Colors.redAccent[400],
          title: new Text("Pesanan aktif"),
        ),
        body: Container(
        child: FutureBuilder(
          future: _getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: SpinKitCircle(color: Color(0xff6991c7),),
                ),
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal:6.0),

                      child: GestureDetector(
                        onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  menu.Menu()));
                    },
                        child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        //  leading: CircleAvatar(
                        //    backgroundImage: NetworkImage(
                        //      snapshot.data[index].picture
                        //  ),
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data[index].waktu, style: TextStyle(fontSize: 10.0),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Text(snapshot.data[index].id.toString(), style: TextStyle(fontSize: 40.0, color: Color(0xff9B9B9B), fontWeight: FontWeight.bold), ),
                                  VerticalDivider(),     
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Total transaksi', style: TextStyle(color: Color(0xff9B9B9B), fontWeight: FontWeight.bold),),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                                        child: Text('Rp. '+snapshot.data[index].totalbayar.toString()+",-", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Color(0xff9B9B9B)),),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0,)

                          ],
                        ),
                  ),
                      )
                      
                    );
                },
              );
            }
          },
        ),
      ),

        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.red),
          child: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, 
                new MaterialPageRoute(builder: (context) => menu.Menu())
              );
            },
            child: Icon(Icons.add),
          ),
        ),

      ),
    );
  }
}

class Trans{
  final int id;
  final String waktu;
  final int totaltransaksi;
  final int totalbayar;
  final int bayar;
  final int kembalian;
  final int userid;
  final String pembeli;
  final String catatan;
  final String status;

  Trans(this.id, this.waktu, this.totaltransaksi, this.totalbayar, this.bayar, this.kembalian, this.userid, this.pembeli, this.catatan, this.status);

}
class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 45.0,
      width: 1.0,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}