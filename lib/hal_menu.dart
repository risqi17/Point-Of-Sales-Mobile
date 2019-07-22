import 'dart:io';

import 'package:flutter/material.dart';
import './hal_detail_pesanan.dart' as detail;
import 'fancy_button.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'models.dart';

void main() => runApp(new Menu());

class Menu extends StatefulWidget {
  Menu(): super();
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  Future<List<Produk>> fetchListMenu() async {
  final response = await http
      .get("https://apiposit.000webhostapp.com/public/produk", headers: {
    HttpHeaders.authorizationHeader:
        "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhcmllIn0.OJ-BEAYBDij1Yx9JtCIl2jmPzhUEpIBQKIzCfhv1gSM"
  });
  final jsonResponse = json.decode(response.body);
  Produk produk = new Produk.fromJson(jsonResponse);
  print('Status ${produk.status}');
  print('Status ${produk.data[0].productname}');

  List<Produk> produks = [];
  for(var u in produk.data){
    //Produk produkdata = Produk(u["productid"], u["productname"], u["productstock"], u["productstatus"], u["productprice"], u["productimg"]);
    print('data ');
  }
  }

  @override
  void initState(){
    super.initState();
    fetchListMenu();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
        backgroundColor: Color(0xffF0EEF1),
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
                            colors: [redgrad1, redgrad2])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Outlet i-Bills',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListMenu('Ayam Goreng Kremes', 'Rp. 12.500,-', makanan1),
                      SizedBox(
                        height: 8.0,
                      ),
                      // Container(
                      //   height: MediaQuery.of(context).size.height / 0.75,
                      //   child: FutureBuilder<List<Produk>>(
                      //     future: fetchListMenu(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasData) {
                      //         List<Produk> produks = snapshot.data;
                      //         return new ListView(
                      //           children: produks
                      //               .map((produk) =>
                      //                   Text('Menu : ${produk.data[1].productname}'))
                      //               .toList(),
                      //         );
                      //       } else if (snapshot.hasError) {
                      //         return Text('${snapshot.error}');
                      //       }
                      //     },
                      //   ),
                      // ),
                      ListMenu('Ayam Goreng Kremes', 'Rp. 12.500,-', makanan2),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListMenu('Mie Super Jumbo', 'Rp. 12.500,-', makanan4),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListMenu('Mie Ayam Jago', 'Rp. 12.500,-', makanan3),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListMenu('Ayam Bawang Crispy', 'Rp. 12.500,-', makanan4),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListMenu('Es Teh Thailand', 'Rp. 12.500,-', makanan2),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListMenu('Dawet Banyuwangi', 'Rp. 12.500,-', makanan1),
                      SizedBox(
                        height: 8.0,
                      ),ListMenu('Bebek Geprek', 'Rp. 12.500,-', makanan3),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListMenu('Ayam Bakar Pedas', 'Rp. 12.500,-', makanan4),
                      SizedBox(
                        height: 8.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
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


// class Menu extends StatelessWidget {
  var makanan1 =
      'https://eksotisjogja.com/wp-content/uploads/2017/06/Cenil-Jajanan-Pasar-Khas-Yogyakarta.jpg';
  var makanan2 =
      'https://phinemo.com/wp-content/uploads/2017/09/19050508_109605866314963_1210741239108861952_n.jpg';
  var makanan3 =
      'https://media.travelingyuk.com/wp-content/uploads/2016/10/Soto-Sulung.jpg';
  var makanan4 =
      'http://tempatwisataindonesia.id/wp-content/uploads/2017/07/Krecek_Jogja.jpg';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color(0xffF0EEF1),
//         body: ListView(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 Container(
//                   height: 170.0,
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                             begin: Alignment.bottomLeft,
//                             end: Alignment.topRight,
//                             colors: [redgrad1, redgrad2])),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Outlet i-Bills',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                       ListMenu('Ayam Goreng Kremes', 'Rp. 12.500,-', makanan1),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height / 0.75,
//                         child: FutureBuilder<List<DataMenu>>(
//                           future: fetchListMenu(),
//                           builder: (context, snapshot) {
//                             if (snapshot.hasData) {
//                               List<DataMenu> produks = snapshot.data;
//                               return new ListView(
//                                 children: produks
//                                     .map((produk) =>
//                                         Text('Menu : ${produk.data.productname}'))
//                                     .toList(),
//                               );
//                             } else if (snapshot.hasError) {
//                               return Text('${snapshot.error}');
//                             }
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8.0,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: FancyButton(
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 new MaterialPageRoute(
//                     builder: (context) => detail.DetailPesanan()));
//           },
//         ),
//       ),
//     );
//   }
// }

var orange = Color(0xFFfc9f6a);
var pink = Color(0xFFee528c);
var blue = Color(0xFF8bccd6);
var darkblue = Color(0xFF60a0d7);
var valueBlue = Color(0xFF5fa0d6);
var redgrad1 = Color(0xffff0844);
var redgrad2 = Color(0xffffb199);

class ListMenu extends StatelessWidget {
  final namaMenu;
  final harga;
  final image;
  ListMenu(this.namaMenu, this.harga, this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(image),
              backgroundColor: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(namaMenu,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Text(harga,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                ],
              ),
            )
          ],
        ),
      ),
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0),
            blurRadius: 2.0,
          ),
        ],
        color: Colors.white,
      ),
    );
  }
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
