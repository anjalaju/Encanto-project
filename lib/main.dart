import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_project/Bussines_logic/firebase_options.dart';
import 'package:main_project/ENTREPRENEUR/homepage/bottomnav.dart';
import 'package:main_project/Intropage.dart/Swipe.dart';
import 'package:main_project/provider/AuthProvider.dart';
import 'package:main_project/provider/FunctionProvider.dart';
import 'package:main_project/usertype.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(create: (_) => FunctionProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserType(),
      ),
    );
  }
}
