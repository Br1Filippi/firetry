import 'package:cloud_firestore/cloud_firestore.dart';

class FbStoreService {
  Stream<QuerySnapshot> recetas() {
    return FirebaseFirestore.instance.collection('recetas').snapshots();
  }

  Stream<QuerySnapshot> recetasPorCreador(String creador) {
    return FirebaseFirestore.instance
        .collection('recetas')
        .where('creador', isEqualTo: creador)
        .snapshots();
  }

  Future<List<String>> obtenerCategorias() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('categorias').get();
    return snapshot.docs.map((doc) => doc['nombre'] as String).toList();
  }

  Future<void> nuevaReceta(
      String nombre, String inst, String foto, String creador, String cat) {
    return FirebaseFirestore.instance.collection('recetas').doc().set({
      'nombre': nombre,
      'instrucciones': inst,
      'foto': foto,
      'creador': creador,
      'categoria': cat
    });
  }

  Future<void> borrarReceta(String id) {
    return FirebaseFirestore.instance.collection('recetas').doc(id).delete();
  }
}
