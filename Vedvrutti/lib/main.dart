import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/app/splash_screen/splash_screen.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/home_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/sign_up_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // Your web Firebase config options
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDiRO7vXGIb18QUUT_EhE_c08NCWvS-VPU",
        appId: "1:420042302788:web:7601b594df1d7a4662e311",
        messagingSenderId: "420042302788",
        projectId: "vedvrutti-harshal",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize Firestore
    FirebaseFirestore.instance.settings = Settings(
      persistenceEnabled: true,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vedvritti',
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
