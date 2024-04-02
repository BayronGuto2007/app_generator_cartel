import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  final TextEditingController nombreCnt = TextEditingController();
  final TextEditingController caractCnt = TextEditingController();
  final TextEditingController fechaPCnt = TextEditingController();
  final TextEditingController zonaPCnt = TextEditingController();
  final TextEditingController contacto1Cnt = TextEditingController();
  final TextEditingController contacto2Cnt = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Campo de Nombre
                TextField(
                  controller: nombreCnt,
                  decoration: InputDecoration(labelText: 'Nombre de la Mascota'),
                ),
                const SizedBox(height: 16.0),
      
                // Checkbox de Recompensa
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text('Ofrece Recompensa'),
                  ],
                ),
                const SizedBox(height: 16.0),
      
                // Campo de Características
                const TextField(
                  decoration:
                      InputDecoration(labelText: 'Características de la Mascota'),
                ),
                const SizedBox(height: 16.0),
      
                // Campo de Fecha de Pérdida
                const TextField(
                  decoration: InputDecoration(labelText: 'Fecha de Pérdida'),
                ),
                const SizedBox(height: 16.0),
      
                // Campo de Zona de Pérdida
                const TextField(
                  decoration:
                      InputDecoration(labelText: 'Zona o Barrio de Pérdida'),
                ),
                const SizedBox(height: 16.0),
      
                // Campo de Información de Contacto
                const TextField(
                  decoration:
                      InputDecoration(labelText: 'Información de Contacto'),
                ),
                const SizedBox(height: 16.0),
      
                // Botón para Seleccionar Imagen
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Seleccionar Imagen'),
                ),
                const SizedBox(height: 16.0),
      
                // Botón para Enviar el Formulario
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
