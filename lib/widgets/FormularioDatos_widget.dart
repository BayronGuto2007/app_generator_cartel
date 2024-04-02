import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

class FormularioDatos extends StatefulWidget {
  final void Function(
      String nombre,
      bool check,
      List<String> caracteristicas,
      String fechaPerdio,
      String sector,
      String contacto1,
      String contacto2,
      Color color,
      String url) onSubmit;

  const FormularioDatos({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _FormularioDatosState createState() => _FormularioDatosState();
}

class _FormularioDatosState extends State<FormularioDatos> {
  final _formKey = GlobalKey<FormState>();

  late String _nombre;
  late bool _check = false;
  late List<String> _caracteristicas = [];
  late String _fechaPerdio;
  late String _sector;
  late String _contacto1;
  late String _contacto2;
  late Color _color = Colors.red;
  late String _url;

  File? _imageFile;

  // Método para seleccionar imagen de la galería
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Método para abrir el ColorPicker
  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccione un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: _color,
              onColorChanged: (Color color) {
                setState(() {
                  _color = color;
                });
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('¿Recompensa?'),
              value: _check,
              onChanged: (value) {
                setState(() {
                  _check = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre de la mascota'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre de la mascota';
                }
                return null;
              },
              onSaved: (value) {
                _nombre = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Características'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese las características de la mascota';
                }
                return null;
              },
              onSaved: (value) {
                _caracteristicas =
                    value!.split(',').map((e) => e.trim()).toList();
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Fecha en que se perdió'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese la fecha en que se perdió la mascota';
                }
                return null;
              },
              onSaved: (value) {
                _fechaPerdio = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Sector donde se perdió'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el sector donde se perdió la mascota';
                }
                return null;
              },
              onSaved: (value) {
                _sector = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Contacto 1'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un contacto';
                }
                return null;
              },
              onSaved: (value) {
                _contacto1 = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Contacto 2'),
              onSaved: (value) {
                _contacto2 = value!;
              },
            ),
            
            TextFormField(
              decoration: InputDecoration(labelText: 'URL de la imagen'),
              readOnly: true,
              controller: TextEditingController(
                  text: _imageFile != null
                      ? _imageFile!.path
                      : ''), 
            ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Seleccionar Imagen'),
            ),
            ElevatedButton(
              onPressed: _openColorPicker,
              child: Text('Color del Cartel'),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.onSubmit(
                        _nombre,
                        _check,
                        _caracteristicas,
                        _fechaPerdio,
                        _sector,
                        _contacto1,
                        _contacto2,
                        _color,
                        _imageFile?.path ??
                            '', 
                      );
                    }
                  },
                  child: Text('Generar cartel'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
