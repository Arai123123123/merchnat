import 'dart:async';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Merchant.dart';
import 'package:ocs_merchant_side/Global.dart';

import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override

  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<Merchant> merchants=[];
  late StreamSubscription<QuerySnapshot<Merchant>> _subscription;
  initState(){

    _subscription = Amplify.DataStore.observeQuery(Merchant.classType)
        .listen((QuerySnapshot<Merchant> snapshot) {
      setState(() {
        merchants = snapshot.items;
        print(snapshot.items);
      });
    });

    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController UserNameController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();
  TextEditingController RePasswordController=TextEditingController();
  TextEditingController PhoneController=TextEditingController();
  TextEditingController EmailController=TextEditingController();
  TextEditingController AddressController=TextEditingController();
  TextEditingController PostalAddressController=TextEditingController();
  TextEditingController ABNnumberController=TextEditingController();
  TextEditingController PermissionController=TextEditingController();
  bool isObsecure = true;
  bool isObsecure1 = true;
  bool _registered = false;
  bool _loggedIn = false;
  final TextEditingController confirmpassword=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Sign up the free account",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: UserNameController,
                  maxLength: 20,
                  validator: (val){
                    if (val!.isEmpty){
                      return "Please Enter Name";
                    }else{
                      return null;
                    }
                  },
                  cursorColor: const Color(0xff445376),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: PasswordController,
                  obscureText: isObsecure,
                  validator: (value)=>validateStructure(value!),
                  cursorColor: const Color(0xff445376),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: Icon(
                          isObsecure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: isObsecure
                              ? const Color(0xFF424242)
                              : Color.fromARGB(255, 30, 29, 28),
                        )),
                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "6-20 character in length. Contains at least 1 lower case letter, 1 uppercase letter, 1 number and one of following special characters ! @ # \$ %",
                    style: TextStyle(
                      color: Color(0xffADADAF),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  obscureText: isObsecure1,

                  controller: RePasswordController,
                  validator: (value){
                    if(value!.isEmpty)
                      return 'Please Enter Confirm Password';
                    if(value.compareTo(PasswordController.text)!=0)
                      return " Not Matched";


                  },
                  cursorColor: const Color(0xff445376),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure1 = !isObsecure1;
                          });
                        },
                        icon: Icon(
                          isObsecure1
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: isObsecure1
                              ? const Color(0xFF424242)
                              : Color.fromARGB(255, 30, 29, 28),
                        )),
                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Confirm Password',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: PhoneController,
                  maxLength: 15,
                  keyboardType: TextInputType.phone,


                  cursorColor: const Color(0xff445376),

                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Phone Number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(

                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Phone',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: EmailController,
                  validator: (value)=>validateEmail(value),
                  cursorColor: const Color(0xff445376),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: AddressController,
                  cursorColor: const Color(0xff445376),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Address',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: PostalAddressController,
                  cursorColor: const Color(0xff445376),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Postal Address',
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: ABNnumberController,
                  cursorColor: const Color(0xff445376),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xffADADAF)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),

                      // borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'ABN number',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 190,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Upload ABN authority document",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                          ),
                          height: 1,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  height: 55,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFBF22),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          // _registerAccount();
                          List<Merchant> regavailable = merchants.where((o) => o.email ==EmailController.text).toList();
                          List<Merchant> regavailableuser = merchants.where((o) => o.username ==UserNameController.text).toList();
                          if(regavailable.isEmpty&&regavailableuser.isEmpty) {
                            registeraccountcontent();

                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationBarScreen()));
                          }
                          else{
                            showAlertDialogError(context,"User Name or Email already registered");

                          }
                        }

                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  child: Text(
                    "By clicking Sign up you agree to the following",
                    style: TextStyle(
                      color: Color(0xff9A9A9A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: double.maxFinite,
                  child: Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: Color(0xff9A9A9A),
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    SignInResult res = await Amplify.Auth.signIn(
      username:EmailController.text,
      password: PasswordController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Logged In successful"),
    ));

    setState(() {
      _loggedIn = res.isSignedIn;
    });
  }

  _confirmSignUp() async {
    print(confirmpassword.text);
    SignUpResult res = await Amplify.Auth.confirmSignUp(
      username: EmailController.text,
      confirmationCode: confirmpassword.text,
    );
    if (res.isSignUpComplete) _login();
    //Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    isSignedin=true;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Confirmation complete"),
    ));
  }
  registeraccountcontent()async{
    currentusername=UserNameController.text;
    currentuseremail=EmailController.text;
    currentphonenumber=PhoneController.text;
    currentpermission='';
    currentcompanyname='';
    currentaddress = AddressController.text;
    currentpostaladdress = PostalAddressController.text;
    currentabnnumber = int.parse(ABNnumberController.text);
    currentabnstatus = '';
    currentaddresslatitude = '';
    currentaddresslongtitude = '';
    currentstarttime = '';

    final item = Merchant(
      username: UserNameController.text,
      password: PasswordController.text,
      email: EmailController.text,
      address: AddressController.text,
      postalAddress: PostalAddressController.text,
      ABNnumber: int.parse(ABNnumberController.text),
      permission: '',
      companyname: '',
      ABNstatus: '',
      addressLongtitude: '',
      addressLatitude: '',
      startTime: '',
    );
    await Amplify.DataStore.save(item);

  }


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        print(confirmpassword.text);
        _confirmSignUp();

      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Please Enter Confirm Code"),
      content: TextFormField(
        controller: confirmpassword,
        cursorColor: const Color(0xff445376),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Color(0xffADADAF)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Color(0xffF6F6F6),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),

            // borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Confirm Code',
        ),
      ),
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

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address ';
  else if (value.isEmpty) {
    return "Please Enter Email";
  }
  return null;
}

String? validateStructure(String value){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  if (value == null || value.isEmpty || !regExp.hasMatch(value)|| value.length<5)
    return 'Enter a valid password ';
  else if (value.isEmpty) {
    return "Please Enter Password";
  }
  return null;
}

showAlertDialogError(BuildContext context,String errortxt) {
  // set up the button

  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(

    title: Text("Error"),
    content: Text(errortxt),
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