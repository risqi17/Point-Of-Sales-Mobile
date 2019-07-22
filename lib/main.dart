import 'package:flutter/material.dart';

import './hal_dashboard.dart' as dashboard;
import './hal_transaksi.dart' as transaksi;
import './hal_riwayat.dart' as riwayat;
import './hal_akun.dart' as akun;


void main(){
  runApp(new MaterialApp(
    title: "Tab Bar",
    home: new Home(),
    debugShowCheckedModeBanner: false,
  )); //material app
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  
  TabController controller;

  @override
  void initState(){
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   backgroundColor: Colors.amber,
      //   title: new Text("Daftar Elektronik"),
      //   // bottom: new TabBar(
      //   //   controller: controller,
      //   //   tabs: <Widget>[
      //   //     new Tab(icon: new Icon(Icons.dashboard),text: "Dashboard",),
      //   //     new Tab(icon: new Icon(Icons.money_off),text: "Transaksi",),
      //   //     new Tab(icon: new Icon(Icons.list),text: "Riwayat",),
      //   //     new Tab(icon: new Icon(Icons.people),text: "Akun",),
      //   //   ],
      //   // ),
      // ),

    body: new TabBarView(
      controller: controller,
      children: <Widget>[
        new dashboard.Dashboard(),
        new transaksi.Transaksi(),
        new riwayat.Riwayat(),
        new akun.Akun(),
      ],
    ),

    bottomNavigationBar: new Material(
      
      color: Color(0xffff0844),
      child: new TabBar(
        controller: controller,
        tabs: <Widget>[
          new Tab(icon: new Icon(Icons.dashboard),),
            new Tab(icon: new Icon(Icons.store),),
            new Tab(icon: new Icon(Icons.refresh),),
            new Tab(icon: new Icon(Icons.account_circle),),
        ],
      ),
    ),

    );
  }
}