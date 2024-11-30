import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertry/services/fbstore_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fluttertry/pages/detalles_page.dart';
import 'package:fluttertry/widgets/mis_recetas_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MisRecetasTab extends StatelessWidget {
  final FbStoreService _fbService = FbStoreService();

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
      stream: _fbService.recetasPorCreador(user?.displayName ?? 'Anónimo'),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var receta = snapshot.data!.docs[index];
            return Slidable(
              key: Key(receta.id),
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      MaterialPageRoute route = MaterialPageRoute(
                        builder: (context) => DetallesPage(recetaId: receta.id),
                      );
                      Navigator.push(context, route);
                    },
                    label: 'Detalles',
                    icon: Icons.info,
                    backgroundColor: Color(0XFF59C9F1),
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) async {
                      await _fbService.borrarReceta(receta.id);
                    },
                    label: 'Borrar',
                    icon: MdiIcons.trashCan,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              child: MisRecetasWidget(receta: receta),
            );
          },
        );
      },
    );
  }
}
