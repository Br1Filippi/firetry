import 'package:flutter/material.dart';
import 'package:fluttertry/services/fbstore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AgregarPage extends StatefulWidget {
  @override
  _AgregarPageState createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController instruccionesController = TextEditingController();
  final TextEditingController fotoController = TextEditingController();
  User? _currentUser;
  String? _selectedCategoria;
  List<String> _categorias = [];

  @override
  void initState() {
    super.initState();
    _loadCategorias();
    _currentUser = FirebaseAuth.instance.currentUser;
  }

  Future<void> _loadCategorias() async {
    final categorias = await FbStoreService().obtenerCategorias();
    setState(() {
      _categorias = categorias;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Receta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: instruccionesController,
                decoration: InputDecoration(labelText: 'Instrucciones'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese las instrucciones';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: fotoController,
                decoration: InputDecoration(labelText: 'Foto URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese Nombre de la Foto';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategoria,
                decoration: InputDecoration(labelText: 'Categoría'),
                items: _categorias.map((String categoria) {
                  return DropdownMenuItem<String>(
                    value: categoria,
                    child: Text(categoria),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategoria = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor seleccione una categoría';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FbStoreService()
                        .nuevaReceta(
                      nombreController.text.trim(),
                      instruccionesController.text.trim(),
                      fotoController.text.trim(),
                      _currentUser?.displayName ?? 'Anónimo',
                      _selectedCategoria!,
                    )
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Receta agregada exitosamente')),
                      );
                      _formKey.currentState!.reset();
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Error al agregar receta: $error')),
                      );
                    });
                  }
                },
                child: Text('Agregar Receta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
