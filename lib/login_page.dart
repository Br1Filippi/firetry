import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertry/services/fbauth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/FondoLogin.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/PisoMadera2.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color(0xFF6B3710), width: 5),
            ),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Stardew Valley Recipes',
                      style: TextStyle(
                        fontFamily: 'StardewValley',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF7BA20),
                        shadows: [
                          Shadow(
                              offset: Offset(-1, -1), color: Color(0xFF6B3710)),
                          Shadow(
                              offset: Offset(1, -1), color: Color(0xFF6B3710)),
                          Shadow(
                              offset: Offset(-1, 1), color: Color(0xFF6B3710)),
                          Shadow(
                              offset: Offset(1, 1), color: Color(0xFF6B3710)),
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'The (unofficial) Cookbook',
                      style: TextStyle(
                        fontFamily: 'StardewValley',
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFF5DEB3),
                        shadows: [
                          Shadow(
                              offset: Offset(-1, -1), color: Color(0xFF6B3710)),
                          Shadow(
                              offset: Offset(1, -1), color: Color(0xFF6B3710)),
                          Shadow(
                              offset: Offset(-1, 1), color: Color(0xFF6B3710)),
                          Shadow(
                              offset: Offset(1, 1), color: Color(0xFF6B3710)),
                          Shadow(
                            offset: Offset(1.5, 1.5),
                            blurRadius: 2.0,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          FbAuthService().singInWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://www.google.com/favicon.ico',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Iniciar sesión con Google',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
