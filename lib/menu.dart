import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isworking = false;
  String result = '';
  late XFile? fileImgPiker = null;
  final ImagePicker _picker = ImagePicker();
  String path = '';
  TextEditingController text_publicar = TextEditingController();
  String res = '';
  bool swRecargar = false;

  @override
  void initState() {
    super.initState();
    //PedirPermisos().permisos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(195, 9, 158, 50),
              Color.fromARGB(255, 5, 150, 150)
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
          body: body(),
        ));
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(),
          if (path.isNotEmpty)
            SizedBox(
              width: 300,
              height: 300,
              child: Image(
                image: FileImage(File(fileImgPiker?.path ?? '')),
                fit: BoxFit.contain,
              ),
            ),
          ElevatedButton(
              style: styleButton(Colors.lime),
              onPressed: () {
                getImagen(true);
              },
              child: const Text(
                'Galeria',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mali',
                ),
              )),
          ElevatedButton(
              style: styleButton(Colors.lime),
              onPressed: () {
                getImagen(false);
              },
              child: const Text(
                'Camara',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Mali',
                ),
              )),
          ElevatedButton(
              style: styleButton(Colors.pink),
              onPressed: () {
                setState(() {
                  swRecargar = true;
                });
                enviarImagen();
              },
              child: swRecargar
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Mali',
                      ),
                    )),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            width: 500,
            height: 40,
            child: Text(
              "Resultado obtenido: " + result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Mali',
              ),
            ),
          ),
          Icon(Icons.check_box,
              color: (result == "")
                  ? Colors.white.withOpacity(0.5)
                  : (result == "Amarillo")
                      ? Colors.yellow
                      : (result == "Naranja")
                          ? Colors.orange
                          : (result == "Rojo")
                              ? Colors.red
                              : Colors.green),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 80,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Prediccion:"
              "${(result == "") ? "" : '''El resultado obtenido, nos indica que existe'''} ${(result == "") ? "" : (result == 'Amarillo') ? "BAJO NIVEL DE POLUCIÓN  \n  Indice de calidad: 26-50" : (result == 'Naranja') ? "NIVEL DE POLUCIÓN MODERADO \n  Indice de calidad: 51-100" : (result == 'Rojo') ? "NIVEL ALTO DE POLUCIÓN. Dañino para grupos sensibles. \n  Indice de calidad: 101 <" : "EXISTE UN NIVEL CASI NULO DE POLUCIÓN \n  Indice de calidad: 0-25"}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Mali',
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white.withOpacity(0.9),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getImagen(bool sw) async {
    swRecargar = false;
    fileImgPiker = null;
    path = '';
    fileImgPiker = await _picker.pickImage(
        imageQuality: 10,
        source: sw ? ImageSource.gallery : ImageSource.camera);
    if (fileImgPiker != null) path = fileImgPiker!.path;
    setState(() {});
  }

  Future<bool> pedirPermiso() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  ButtonStyle styleButton(color) {
    return TextButton.styleFrom(backgroundColor: color);
  }

  Future<void> enviarImagen() async {
    try {
      // Obtener el archivo de la imagen capturada
      File imagenCapturada = File(fileImgPiker?.path ?? '');

      // Verificar si el archivo existe
      if (!imagenCapturada.existsSync()) {
        throw Exception('No se pudo encontrar la imagen capturada');
      }

      // Construir el cuerpo de la solicitud HTTP
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://tu-api.com/enviar-imagen'),
      );

      // Adjuntar la imagen al cuerpo de la solicitud
      request.files.add(await http.MultipartFile.fromPath(
        'imagen',
        imagenCapturada.path,
      ));

      // Enviar la solicitud HTTP
      var response = await request.send();

      // Verificar el estado de la respuesta
      if (response.statusCode == 200) {
        // La imagen se envió correctamente
        // Actualizar el estado para detener el indicador de carga
        setState(() {
          swRecargar = false;
        });
        // Leer la respuesta del servidor si es necesario
        String respuesta = await response.stream.bytesToString();
        print('Respuesta del servidor: $respuesta');
      } else {
        // Hubo un error al enviar la imagen
        throw Exception('Error al enviar la imagen: ${response.statusCode}');
      }
    } catch (error) {
      // Manejar errores si ocurren
      print('Error al enviar la imagen: $error');
      // Actualizar el estado para detener el indicador de carga en caso de error
      setState(() {
        swRecargar = false;
      });
    }
  }
}
