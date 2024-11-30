import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertry/pages/detalles_page.dart';

class RecetasWidget extends StatelessWidget {
  final DocumentSnapshot receta;

  RecetasWidget({required this.receta, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            color: Colors.red,
            child: Center(
              child: Text(
                receta['foto'] ?? 'No Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              receta['nombre'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              receta['creador'],
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => DetallesPage(
                    recetaId: receta.id,
                  ),
                );
                Navigator.push(context, route);
              },
              child: Text('Detalles'),
            ),
          ),
        ],
      ),
    );
  }
}
