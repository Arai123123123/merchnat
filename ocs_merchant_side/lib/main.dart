// @dart=2.12
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/services.dart';
import 'package:ocs_merchant_side/amplifyconfiguration.dart';
import 'package:ocs_merchant_side/client_data_show.dart';
import 'package:ocs_merchant_side/screens/Booking_tab_screen.dart';
import 'package:ocs_merchant_side/screens/manage_account_screen.dart';
import 'models/ModelProvider.dart';
import 'models/Client.dart';

import 'package:ocs_merchant_side/screens/signup_page.dart';
import 'package:ocs_merchant_side/screens/login_page.dart';
import 'package:ocs_merchant_side/controled.dart';
import 'package:ocs_merchant_side/client_account.dart';
import 'package:ocs_merchant_side/client_data_show.dart';
import 'package:ocs_merchant_side/client_detail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _amplifyConfigured = false;

  void _configureAmplify() async {

    try {
      await Future.wait([
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance)),
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyAuthCognito())
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print("error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyAppState(),
    );
  }
}

class _MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(children: <Widget>[
              const SizedBox(height: 250),
              ElevatedButton(
                child: const Text('Log in'),
                onPressed: () =>
                {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()))
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () =>
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUp()))
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                child: const Text('Booking Tab Screen'),
                onPressed: () =>
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClientDataShow()))
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                child: const Text('Manage Account Screen'),
                onPressed: () =>
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageAccountScreen()))
                },
              ),
              /*const SizedBox(height: 50),
              ElevatedButton(
                child: const Text(''),
                onPressed: () =>
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageAccountScreen()))
                },
              ),*/
            ]),
          ),
        ));
  }
}
