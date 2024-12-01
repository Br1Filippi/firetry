import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertry/pages/detalles_page.dart';

class MisRecetasWidget extends StatelessWidget {
  final DocumentSnapshot receta;

  MisRecetasWidget({required this.receta});

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
      child: ListTile(
        contentPadding: EdgeInsets.all(12.0),
        onTap: () {
          MaterialPageRoute route = MaterialPageRoute(
            builder: (context) => DetallesPage(
              recetaId: receta.id,
            ),
          );
          Navigator.push(context, route);
        },
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFF6B3710),
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/${receta['foto']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          receta['nombre'],
          style: TextStyle(
            fontFamily: 'StardewValley',
            fontSize: 24,
            color: Colors.white,
          ),
          maxLines: 3,
          softWrap: true,
        ),
        subtitle: Text(
          receta['creador'],
          style: TextStyle(
            fontFamily: 'StardewValley',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Color(0xFF6B3710),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            receta['categoria'],
            style: TextStyle(
              fontFamily: 'StardewValley',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
