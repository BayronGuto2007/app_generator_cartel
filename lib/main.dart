import 'dart:typed_data';
import 'package:app_generator_cartel1/widgets/FormularioDatos_widget.dart';
import 'package:app_generator_cartel1/widgets/cartel_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';


void main() {
  runApp(const MaterialApp(
    title: "App Generator Cartel",
    debugShowCheckedModeBanner: false,
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generador de Carteles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: FormularioDatos(
                onSubmit: (nombre, check, caracteristicas, fechaPerdio, sector,
                    contacto1, contacto2, color, url, ) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartelAppWidget(
                        nombre: nombre,
                        check: check,
                        caracteristicas: caracteristicas,
                        fechaPerdio: fechaPerdio,
                        sector: sector,
                        contacto1: contacto1,
                        contacto2: contacto2,
                        color: color,
                        url: url,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
