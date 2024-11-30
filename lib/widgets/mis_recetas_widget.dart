import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MisRecetasWidget extends StatelessWidget {
  final DocumentSnapshot receta;

  MisRecetasWidget({required this.receta});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xFFDDA059),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xFF6B3710), width: 2),
        ),
        child: ListTile(
          leading: Container(
            height: double.infinity,
            width: 70,
            color: Colors.green,
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
          title: Container(
            child: Text(
              receta['nombre'],
              style: TextStyle(
                fontFamily: 'StardewValley',
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          subtitle: Container(
            child: Text(
              receta['creador'],
              style: TextStyle(
                fontFamily: 'StardewValley',
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          trailing: Container(
            child: Text(
              receta['categoria'],
              style: TextStyle(
                fontFamily: 'StardewValley',
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
