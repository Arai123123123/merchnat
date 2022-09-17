// sucess edit and delete
import 'package:ocs_merchant_side/models/Client.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ClientAccount extends StatefulWidget {
  final List<Client> client;
  final String id;
  final String username;
  final String password;
  final String firstname;
  final String lastname;
  final String email;
  final String mobile;
  final String notice;

  const ClientAccount({
    Key? key,
    required this.username,
    required this.client,
    required this.password,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.mobile,
    required this.email,
    required this.notice,
  }) : super(key: key);

  @override
  State<ClientAccount> createState() => _ClientAccountState();
}

class _ClientAccountState extends State<ClientAccount> {
  final usernameText = TextEditingController();
  final passwordText = TextEditingController();
  final firstnameText = TextEditingController();
  final lastnameText = TextEditingController();
  final mobileText = TextEditingController();
  final emailText = TextEditingController();
  final noticeText = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameText.text = widget.username;
    passwordText.text = widget.password;
    firstnameText.text = widget.firstname.toString();
    lastnameText.text = widget.lastname.toString();
    emailText.text = widget.email;
    mobileText.text = widget.mobile.toString();
    noticeText.text = widget.notice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 50, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              accountValue(context, "username"),
              accountValue(context, "password"),
              accountValue(context, "firstname"),
              accountValue(context, "lastname"),
              accountValue(context, "mobile"),
              accountValue(context, "email"),
              accountValue(context, "notice"),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: yellowColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () async {},
                          child: const Text("EDIT",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              )),
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
    );
  }

  accountValue(BuildContext context, String s) {
    var control;
    var limit = 10;
    var inputType = TextInputType.text;
    var readed = false;

    if (s == "username") {
      control = usernameText;
    } else if (s == "password") {
      control = passwordText;
    } else if (s == "firstname") {
      control = firstnameText;
    } else if (s == "lastname") {
      control = lastnameText;
    } else if (s == "email") {
      limit = 30;
      control = emailText;
    } else if (s == "mobile") {
      control = mobileText;
      limit = 30;
    } else if (s == "notice") {
      control = noticeText;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              textStyles(s),
              const SizedBox(
                width: 10,
              ),
              Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 60,
                  padding: const EdgeInsets.only(left: 20),
                  child: readed == false ? TextField(
                    keyboardType: inputType,
                    maxLength: limit,
                    controller: control,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),                  //onChanged: (text) => {updateStaff()},
                  ) : TextField(
                    readOnly: true,
                    controller: control,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  textStyles(String s) {
    return Text(
      s.toUpperCase(),
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }

  navBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: greyColor,
      title: const Text('Client Account',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
