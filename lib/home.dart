// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatgemini/information.dart';
import 'package:chatgemini/menu.dart';
import 'package:chatgemini/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        //backgroundColor: const Color.fromRGBO(0, 40, 90, 10),
        body: Stack(
      children: [
        Container(
          width: w,
          height: h,
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(60),
            //     bottomRight: Radius.circular(60)),
            image: DecorationImage(
                image: AssetImage("assets/images/Portada_Liquen.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        // SizedBox(
        //   height: h / 1.5,
        //   width: w,
        //   child: Image.asset("assets/images/Portada_Liquen.jpg",
        //       fit: BoxFit.cover),
        // ),
        SafeArea(
            child: Container(
                padding: const EdgeInsets.only(top: 70),
                //color: Colors.amber.withOpacity(0.7),
                color: Colors.transparent,
                height: 150,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      text("BIENVENIDOS", 20.0, FontWeight.bold, Colors.white,
                          FontStyle.normal),
                      const SizedBox(
                        height: 10,
                      ),
                      text("MONITOR DE POLUCIÓN", 25.0, FontWeight.bold,
                          Colors.white, FontStyle.normal),
                    ],
                  ),
                ))),

        Align(
          alignment: Alignment(0, 0.43),
          child: button(
              text("Empezar a Medir", 25.0, FontWeight.bold, Colors.white,
                  FontStyle.normal),
              context,
              const Menu()),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Information()));
                },
                label: text("Info", 15.0, FontWeight.bold, Colors.white,
                    FontStyle.normal),
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                backgroundColor: Colors.pink,
              )),
        ),
      ],
    ));
  }
}
