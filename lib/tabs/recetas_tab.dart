import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertry/services/fbstore_service.dart';
import 'package:fluttertry/widgets/recetas_widget.dart';

class RecetasTab extends StatelessWidget {
  const RecetasTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: StreamBuilder(
        stream: FbStoreService().recetas(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var receta = snapshot.data!.docs[index];
              return RecetasWidget(receta: receta);
            },
          );
        },
      ),
    );
  }
}
