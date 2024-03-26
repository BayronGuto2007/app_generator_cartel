import 'package:app_generator_cartel1/widgets/ListItem_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartelAppWidget extends StatefulWidget {
  const CartelAppWidget({super.key});

  @override
  State<CartelAppWidget> createState() => _CartelAppWidgetState();
}

class _CartelAppWidgetState extends State<CartelAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFFdacec4),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "SE BUSCA A PAULINA",
                      style: TextStyle(
                          fontSize: 33,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("OFREZCO RECOMPENSA",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Características',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListItem(text: 'GATA HEMBRA'),
                                  ListItem(text: '5 AÑOS'),
                                  ListItem(text: 'ESTERILIZADA'),
                                  ListItem(text: 'BLANCA CON CAFE Y GRIS'),
                                  ListItem(text: 'OREJA GRIS Y COLA CAFE'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.red,
                              width: 6,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(23),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOhFZg1R9L_-Fa28LRlu4se6iEDX1G9hZCCzod4_o0Rw&s',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
