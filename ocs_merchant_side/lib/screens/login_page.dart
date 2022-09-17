import 'dart:async';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Merchant.dart';
import 'package:ocs_merchant_side/main.dart';
import 'package:ocs_merchant_side/Global.dart';
import 'package:ocs_merchant_side/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Merchant> merchants=[];
  late StreamSubscription<QuerySnapshot<Merchant>> _subscription;
  initState(){

    _subscription = Amplify.DataStore.observeQuery(Merchant.classType)
        .listen((QuerySnapshot<Merchant> snapshot) {
      setState(() {
        merchants = snapshot.items;

      });
    });

    super.initState();
  }
  bool _passwordVisible = false;
  bool _registered = false;
  bool _loggedIn = false;
  TextEditingController UsernameController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Column(
              children: [
                const Text("Welcome!",
                    style: TextStyle(
                        color: Color(0xff445376),
                        fontWeight: FontWeight.w400,
                        fontSize: 22)),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/loginImageOCI.png"),
                ),

                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      const Text("Please enter your account info here",
                          style: TextStyle(color: Color(0xffaaafca))),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        controller: EmailController,
                        cursorColor: const Color(0xff445376),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline_rounded,
                              color: Color(0xff445376)),
                          hintStyle: TextStyle(color: Color(0xffaaafca)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: Color(0xffF1F6FB),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: PasswordController,
                        cursorColor: const Color(0xff445376),
                        obscureText: !_passwordVisible,
                        //This will obscure text dynamically
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded,
                              color: Color(0xff445376)),
                          prefixIconColor: Colors.grey,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xff445376),
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          hintStyle: const TextStyle(color: Color(0xffaaafca)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          fillColor: const Color(0xffF1F6FB),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 55,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFBF22),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                            onPressed: () {
                              //  _login();
                              contentlogin();
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color(0xff445376),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );                  },
                  child: const Text("Sign up for client",
                      style: TextStyle(
                        color: Color(0xffFFBF22),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  contentlogin(){
    List<Merchant> regavailable = merchants.where((o) => o.username ==EmailController.text).toList();

    if(regavailable.isEmpty||  regavailable.first.password!=PasswordController.text) {
      showAlertDialogError(context,"Username or password is incorrect");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    }
    else{
      currentuseremail=regavailable.first.email.toString();
      currentusername=regavailable.first.username.toString();
      currentcompanyname=regavailable.first.companyname.toString();
      currentaddress=regavailable.first.address.toString();
      currentpostaladdress=regavailable.first.postalAddress.toString();
      currentpermission=regavailable.first.permission.toString();
      currentabnstatus=regavailable.first.ABNstatus.toString();
      currentabnnumber=regavailable.first.ABNnumber!.toInt();
      currentaddresslatitude=regavailable.first.addressLatitude.toString();
      currentaddresslongtitude=regavailable.first.addressLongtitude.toString();
      currentstarttime=regavailable.first.startTime.toString();
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingTabScreen()));

    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text('Please Enter Valid Email or Password'),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}