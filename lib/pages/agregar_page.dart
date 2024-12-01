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
        iconTheme: IconThemeData(color: Color(0xFFF7BA20)),
        leading: Padding(
          padding: EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF6B3710),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          'Agregar Receta',
          style: TextStyle(
            fontFamily: 'StardewValley',
            fontSize: 28,
            color: Color(0xFFF7BA20),
            shadows: [
              Shadow(offset: Offset(-1, -1), color: Color(0xFF6B3710)),
              Shadow(offset: Offset(1, -1), color: Color(0xFF6B3710)),
              Shadow(offset: Offset(-1, 1), color: Color(0xFF6B3710)),
              Shadow(offset: Offset(1, 1), color: Color(0xFF6B3710)),
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/FondoAppbar1.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFDDA059),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF6B3710), width: 4),
            ),
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nombreController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(
                        fontFamily: 'StardewValley',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: fotoController,
                    decoration: InputDecoration(
                      labelText: 'Foto URL',
                      labelStyle: TextStyle(
                        fontFamily: 'StardewValley',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese Nombre de la Foto';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedCategoria,
                    decoration: InputDecoration(
                      labelText: 'Categoría',
                      labelStyle: TextStyle(
                        fontFamily: 'StardewValley',
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
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
                  TextFormField(
                    maxLines: 16,
                    controller: instruccionesController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontFamily: 'StardewValley',
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      labelText: 'Instrucciones',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese las instrucciones';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF6B3710)),
                      ),
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
                              SnackBar(
                                content: Text('Receta agregada exitosamente'),
                              ),
                            );
                            Navigator.pop(context);

                            _formKey.currentState!.reset();
                          }).catchError(
                            (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Error al agregar receta: $error')),
                              );
                              // Navigator.pop(context);
                            },
                          );
                        }
                      },
                      child: Text(
                        'Agregar Receta',
                        style: TextStyle(
                          fontFamily: 'StardewValley',
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
