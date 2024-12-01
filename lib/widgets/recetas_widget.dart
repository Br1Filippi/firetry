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
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/${this.receta['foto']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  receta['nombre'],
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'StardewValley',
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  softWrap: true,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        receta['creador'],
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'StardewValley',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF6B3710),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        receta['categoria'],
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'StardewValley',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6B3710),
                      padding: EdgeInsets.symmetric(vertical: 12),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
