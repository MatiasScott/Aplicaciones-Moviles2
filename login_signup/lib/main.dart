import 'package:flutter/material.dart';
import 'package:login_singup/config/provider.dart';
import 'package:login_singup/screen/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginSignupUI());
}

class LoginSignupUI extends StatelessWidget {
  const LoginSignupUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => DatosProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Login Signup UI",
          home: LoginSignupScreen2(),
        ));
  }
}
