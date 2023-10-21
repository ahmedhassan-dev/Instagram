import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/firebase_options.dart';
import 'package:instagram/provider/user_provider.dart';
import 'package:instagram/responsive/mobile.dart';
import 'package:instagram/responsive/responsive.dart';
import 'package:instagram/responsive/web.dart';
import 'package:instagram/screens/sign_in.dart';
import 'package:instagram/shared/snackbar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA7Me4AKZPEkgNMzQzGZLHsuoTfvqf0FoY",
            authDomain: "insta-9f751.firebaseapp.com",
            projectId: "insta-9f751",
            storageBucket: "insta-9f751.appspot.com",
            messagingSenderId: "389537202400",
            appId: "1:389537202400:web:8f223a2299b9420fd39085"));
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return UserProvider();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              } else if (snapshot.hasData) {
                return const Responsive(
                  myMobileScreen: MobileScreen(),
                  myWebScreen: WebScreen(),
                );
              } else {
                return const Login();
              }
            },
          ),
          // Responsive(
          //   myMobileScreen: MobileScreen(),
          //   myWebScreen: WebScreen(),
          // ),
        ));
  }
}
