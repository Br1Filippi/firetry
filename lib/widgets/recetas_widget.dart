import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertry/pages/detalles_page.dart';

class RecetasWidget extends StatelessWidget {
  final DocumentSnapshot receta;

  RecetasWidget({required this.receta, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFDDA059),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color(0xFF6B3710),
          width: 4,
        ),
      ),
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                color: Color(0xFF6B3710),
                width: 4,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/${this.receta['foto']}'),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
            child: null,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              receta['nombre'],
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'StardewValley',
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  receta['creador'],
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'StardewValley',
                    color: Colors.white,
                  ),
                ),
                Text(
                  receta['categoria'],
                  style: TextStyle(
                    fontSize: 22, // Tamaño de la categoría aumentado
                    fontFamily: 'StardewValley',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF6B3710)),
                  ),
                  onPressed: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => DetallesPage(
                        recetaId: receta.id,
                      ),
                    );
                    Navigator.push(context, route);
                  },
                  child: Text(
                    'Detalles',
                    style: TextStyle(
                      fontFamily: 'StardewValley',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
