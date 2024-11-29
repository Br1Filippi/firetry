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
          onPressed: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => AgregarPage(),
            );
            Navigator.push(context, route);
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
                color: Color(0xFFDDA059),
                fontFamily: 'StardewValley',
                fontSize: 28,
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
            labelStyle: TextStyle(fontFamily: 'StardewValley', fontSize: 20),
            labelColor: Color(0xFFDDA059),
            unselectedLabelColor: Color(0xFFDDA059),
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
