import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertry/pages/agregar_page.dart';
import 'package:fluttertry/tabs/mis_recetas_tab.dart';
import 'package:fluttertry/tabs/recetas_tab.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFF7BA20),
          foregroundColor: Colors.white,
          onPressed: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => AgregarPage(),
            );
            Navigator.push(context, route).then((value) {
              setState(() {});
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(left: 47),
            child: Text(
              'Stardew Valley Recipes',
              style: TextStyle(
                color: Color(0xFFF7BA20),
                fontFamily: 'StardewValley',
                fontSize: 28,
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
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/FondoAppbar1.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Color(0xFFB52121),
            labelStyle: TextStyle(
              fontFamily: 'StardewValley',
              fontSize: 20,
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
            labelColor: Color(0xFFF7BA20),
            unselectedLabelColor: Color(0xFFF7BA20),
            tabs: [
              Tab(
                text: 'Recetas',
              ),
              Tab(
                text: 'Mis Recetas',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [RecetasTab(), MisRecetasTab()],
        ),
      ),
    );
  }
}
