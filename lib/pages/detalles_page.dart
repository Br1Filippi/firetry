import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetallesPage extends StatefulWidget {
  final String recetaId;
  const DetallesPage({super.key, required this.recetaId});

  @override
  State<DetallesPage> createState() => _DetallesPageState();
}

class _DetallesPageState extends State<DetallesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/FondoAppbar1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          'Detalles de la Receta',
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
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('recetas')
              .doc(widget.recetaId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error al cargar los detalles'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('No se encontró la receta'));
            }

            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top,
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xFF6B3710), width: 3),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              data['nombre'] ?? '',
                              style: TextStyle(
                                fontFamily: 'StardewValley',
                                fontSize: 32,
                                color: Color(0xFFF7BA20),
                                shadows: [
                                  Shadow(
                                      offset: Offset(-1, -1),
                                      color: Color(0xFF6B3710)),
                                  Shadow(
                                      offset: Offset(1, -1),
                                      color: Color(0xFF6B3710)),
                                  Shadow(
                                      offset: Offset(-1, 1),
                                      color: Color(0xFF6B3710)),
                                  Shadow(
                                      offset: Offset(1, 1),
                                      color: Color(0xFF6B3710)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Columna izquierda con la información
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildInfoRow(
                                        'Categoría:', data['categoria'] ?? ''),
                                    SizedBox(height: 10),
                                    _buildInfoRow(
                                        'Creador:', data['creador'] ?? ''),
                                  ],
                                ),
                              ),
                              // Imagen de la receta
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF6B3710),
                                    width: 3,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/${data['foto']}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Instrucciones:',
                            style: TextStyle(
                              fontFamily: 'StardewValley',
                              fontSize: 24,
                              color: Color(0xFF6B3710),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            data['instrucciones'] ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'StardewValley',
            fontSize: 20,
            color: Color(0xFF6B3710),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
