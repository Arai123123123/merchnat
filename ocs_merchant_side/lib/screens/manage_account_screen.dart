

import 'dart:async';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Global.dart';
import '../models/Merchant.dart';
import 'login_page.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({Key? key}) : super(key: key);

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {

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

  TextEditingController UserController=TextEditingController(text: currentusername);

  TextEditingController CompanyNameController=TextEditingController(text: currentcompanyname);

  TextEditingController PwController = TextEditingController(text: currentpassword);

  TextEditingController PhoneController=TextEditingController(text: currentphonenumber);

  TextEditingController EmailController=TextEditingController(text: currentuseremail);

  TextEditingController AddressController=TextEditingController(text: currentaddress);

  TextEditingController PostalAddressController=TextEditingController(text: currentpostaladdress);

  TextEditingController PermissionController=TextEditingController(text: currentpermission);

  TextEditingController AbnNumController=TextEditingController(text: currentabnnumber.toString());

  TextEditingController AbnStatusController=TextEditingController(text: currentabnstatus);

  TextEditingController AddressLatitudeController = TextEditingController(text: currentaddresslatitude);

  TextEditingController AddressLongtitudeController = TextEditingController(text: currentaddresslongtitude);

  TextEditingController StartTimeController = TextEditingController(text: currentstarttime);

  TextEditingController RePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(icon:Icon(Icons.arrow_back_rounded,color: Colors.black,size: 30,),onPressed: (){
                          Navigator.pop(context);
                        },),
                        IconButton(onPressed: (){
                          Amplify.Auth.signOut();
                          isSignedin=false;
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        }, icon: Icon(Icons.logout))
                      ],
                    ),
                    Text('Manage the Account',style: TextStyle(fontSize: 20),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('User Name: ', style: TextStyle(fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 40,

                        decoration: BoxDecoration(color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: UserController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:10,bottom: 10),
                              border: InputBorder.none
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('password: ', style: TextStyle(fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 40,

                        decoration: BoxDecoration(color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: PwController ,

                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:10,bottom: 10),
                              border: InputBorder.none
                          ),

                        ),
                      )
                    ],
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Confirm password: ', style: TextStyle(fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 40,

                        decoration: BoxDecoration(color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: RePasswordController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:10,bottom: 10),
                              border: InputBorder.none
                          ),

                        ),
                      )
                    ],
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Phone No: ', style: TextStyle(fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 40,

                        decoration: BoxDecoration(color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          readOnly: true,
                          controller: PhoneController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:10,bottom: 10),
                              border: InputBorder.none
                          ),

                        ),
                      )
                    ],
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Post Code: ', style: TextStyle(fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 40,

                        decoration: BoxDecoration(color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: PostalAddressController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:10,bottom: 10),
                              border: InputBorder.none
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Email: ', style: TextStyle(fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 40,

                        decoration: BoxDecoration(color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: EmailController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:10,bottom: 10),
                              border: InputBorder.none
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('ABN: ', style: TextStyle(fontSize: 18)),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 40,

                        decoration: BoxDecoration(color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: AbnNumController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left:10,bottom: 10),
                              border: InputBorder.none
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: ()async  {
                    List<Merchant> regavailable = merchants.where((o) => o.email ==EmailController.text).toList();
                    print(regavailable.length);

                    final updatedItem = regavailable.elementAt(0).copyWith(
                      username: UserController.text,
                      password: PwController.text,
                      email: EmailController.text,
                      companyname: CompanyNameController.text,
                      address: AddressController.text,
                      postalAddress: PostalAddressController.text,
                      ABNnumber: int.parse(AbnNumController.text),
                      ABNstatus: AbnStatusController.text,
                    );
                    await Amplify.DataStore.save(updatedItem);
                    currentusername=UserController.text;
                    currentpassword=PwController.text;
                    currentphonenumber=PhoneController.text;
                    currentuseremail=EmailController.text;
                    currentaddress=AddressController.text;
                    currentpostaladdress=PostalAddressController.text;
                    currentabnnumber=int.parse(AbnNumController.text);
                    currentabnstatus=AbnStatusController.text;
                    currentaddresslongtitude=AddressLongtitudeController.text;
                    currentaddresslatitude=AddressLatitudeController.text;
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height/12,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.amber,

                    ),

                    child: Center(child: Text('SAVE',style: TextStyle(
                        color: Colors.white
                    ),)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}