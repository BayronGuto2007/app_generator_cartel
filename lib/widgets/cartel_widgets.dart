import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:app_generator_cartel1/widgets/ListItem_widget.dart';
import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';

class CartelAppWidget extends StatefulWidget {
  const CartelAppWidget({
    Key? key,
    required this.nombre,
    required this.check,
    required this.caracteristicas,
    required this.url,
    required this.fechaPerdio,
    required this.sector,
    required this.contacto1,
    required this.contacto2,
    required this.color,
  }) : super(key: key);

  final String nombre;
  final bool check;
  final List<String> caracteristicas;
  final String url;
  final String fechaPerdio;
  final String sector;
  final String contacto1;
  final String contacto2;
  final Color color;

  @override
  State<CartelAppWidget> createState() => _CartelAppWidgetState();
}

class _CartelAppWidgetState extends State<CartelAppWidget> {
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RepaintBoundary(
          key: globalKey,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFdacec4),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "SE BUSCA A ${widget.nombre.toUpperCase()}",
                            style: TextStyle(
                                fontSize: widget.nombre.length < 10 ? 30 : 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.check
                      ? Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text("OFREZCO RECOMPENSA",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'Características',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.caracteristicas
                                      .map((caracteristica) {
                                    return ListItem(
                                        text: caracteristica,
                                        sizefont: 14,
                                        colores: widget.color);
                                  }).toList(),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'SE PERDIO EL',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListItem(
                                        text: widget.fechaPerdio.toUpperCase(),
                                        sizefont: 14,
                                        colores: widget.color),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'ZONA Y BARRIO',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListItem(
                                      text: widget.sector.toUpperCase(),
                                      sizefont: 12,
                                      colores: widget.color,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity, // Ancho fijo
                            height: 400, // Alto fijo
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: widget.color,
                                width: 6,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(23),
                              child: widget.url.isNotEmpty
                                  ? Image.file(
                                      File(widget.url),
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    )
                                  : Image.asset(
                                      'assets/dog.png',
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("SI L@ VES, POR FAVOR LLAMAR AL",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w900)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          widget.contacto1.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Text(widget.contacto2.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _capturePng();
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  Future<void> _capturePng() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Guardar la imagen capturada en el dispositivo
    final result = await ImageGallerySaver.saveImage(pngBytes);

    if (result['isSuccess']) {
      // Imagen guardada exitosamente
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se ha guardado tu imagen'),
        ),
      );
    } else {
      // Error al guardar la imagen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar la imagen: ${result['error']}'),
        ),
      );
    }
  }
}
