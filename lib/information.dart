// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:chatgemini/chatGemini.dart';
import 'package:chatgemini/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _Information();
}

class _Information extends State<Information> {
  bool isworking = false;
  String result = '';
  late XFile? fileImgPiker = null;
  final ImagePicker _picker = ImagePicker();
  String path = '';
  TextEditingController text_publicar = TextEditingController();
  String res = '';
  bool swRecargar = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(195, 9, 158, 101),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 5, 78, 138)
            ])),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(0, 45, 95, 1),
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Column(
                children: [
                  Text(
                    "MONITOR DE POLUCIÓN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontFamily: 'Mali',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "EN BASE A LÍQUEN PARMELIA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Mali',
                    ),
                  )
                ],
              )),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: w,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(20),
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      //color: Colors.grey.withOpacity(0.8)),
                      color: Colors.lime.withOpacity(0.9)),
                  child: textParagraph(
                      "La aplicación mide la calidad del aire de acuerdo a el efecto de la polución en líquenes Parmelia spp. Está direccionado a ser un medidor de nivel de contaminación en puntos específicos de la ciudad a través de las imágenes.",
                      18.0,
                      FontWeight.w500,
                      Colors.black,
                      FontStyle.normal),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 200,
                  width: w,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(0),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              //color: Colors.grey.withOpacity(0.8)),
                              color: Colors.transparent),
                          child: Image.asset(
                            'assets/images/verde.PNG',
                            fit: BoxFit.scaleDown,
                          )),
                      const SizedBox(width: 30),
                      Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(0),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              //color: Colors.grey.withOpacity(0.8)),
                              color: Colors.transparent),
                          child: Image.asset(
                            'assets/images/amarillo.PNG',
                            fit: BoxFit.scaleDown,
                          )),
                      const SizedBox(width: 30),
                      Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(0),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              //color: Colors.grey.withOpacity(0.8)),
                              color: Colors.transparent),
                          child: Image.asset(
                            'assets/images/naranja.PNG',
                            fit: BoxFit.scaleDown,
                          )),
                      const SizedBox(width: 30),
                      Container(
                          width: 200,
                          height: 200,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(0),
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              //color: Colors.grey.withOpacity(0.8)),
                              color: Colors.transparent),
                          child: Image.asset(
                            'assets/images/rojo.PNG',
                            fit: BoxFit.scaleDown,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  //padding: const EdgeInsets.fromLTRB(30, 50, 10, 50),
                  child: Align(
                      alignment: Alignment.center,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GenerativeAISample()));
                        },
                        label: text("Chatea con Gemini", 15.0, FontWeight.bold,
                            Colors.white, FontStyle.normal),
                        icon: Icon(
                          Icons.chat,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.pink,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
