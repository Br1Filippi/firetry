import 'package:flutter/material.dart';

class DetallesPage extends StatefulWidget {
  const DetallesPage({super.key, required String recetaId});

  @override
  State<DetallesPage> createState() => _DetallesPageState();
}

class _DetallesPageState extends State<DetallesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Detalles'),
      ),
    );
  }
}
