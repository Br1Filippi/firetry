import 'package:flutter/material.dart';

Padding RecetasWidget() {
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
          // child: Image.asset('assets/images/Receta1.jpg', fit: BoxFit.cover),
        ),
        title: Container(
          child: Text(
            'Nombre de la receta',
            style: TextStyle(fontFamily: 'StardewValley', fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        subtitle: Container(
          child: Text('Creador de la receta', style: TextStyle(fontFamily: 'StardewValley', color: Colors.white, fontSize: 15)),
        ),
        trailing: Container(
          child: Text('Categoria', style: TextStyle(fontFamily: 'StardewValley', color: Colors.white, fontSize: 15)),
        ),
      ),
    ),
  );
}
