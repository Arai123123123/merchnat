// sucess edit and delete
// sucess edit and delete

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocs_merchant_side/models/Client.dart';


import 'client_data_show.dart';
import 'constants.dart';
import 'controled.dart';


class ClientDetail extends StatefulWidget {
  final List<Client> client;
  final String id;
  final String firstname;
  final String lastname;
  final String username;
  final String password;
  final String mobile;
  final String notice;
  final String email;
  final int indext;

  const ClientDetail(
      {Key? key,
        required this.username,
        required this.client,
        required this.indext,
        required this.password,
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.mobile,
        required this.notice,
        required this.email,
      })
      : super(key: key);

  @override
  State<ClientDetail> createState() => _ClientDetailState();
}

class _ClientDetailState extends State<ClientDetail> {
  var permission = "";
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameTextController.text = widget.username.toString();
    passwordTextController.text =
        confirmTextController.text = widget.password.toString();
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
              inputValues(context, "username"),
              inputValues(context, "password"),
              inputValues(context, "confirm"),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Note: '0' is hight permissions wich used to adding/editing/deleting data. '1' is low permissions which used to adding/editing/invite of client.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: btn_edde(context, "delete"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: btn_edde(context, "edit"),
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

  btn_edde(BuildContext context, String s) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: s == "delete" ? greenColor : yellowColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: () async {
        s == "delete"
            ? BlocProvider.of<Controled>(context)
            .deleteNow(widget.client[widget.indext], widget.id)
            : BlocProvider.of<Controled>(context).updateNow(
            widget.client[widget.indext],
            usernameTextController.text,
            passwordTextController.text,
        );

        showAlert(context, s);
      },
      child: Text(s.toUpperCase(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          )),
    );
  }

  navBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white10,
      title: const Text(' Edit A Client Page',
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  showAlert(BuildContext context, String s) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return alertWindow(context, s);
        });
  }

  AlertDialog alertWindow(BuildContext context, String s) {
    var str = "";
    if (s == "delete") {
      str = "The client has sucessfully deleted.";
    } else if (s == "edit") {
      str = "A new client has sucessfully edited.";
    }

    return AlertDialog(
      title: const Text("Note:"),
      content: Text(str),
      actions: <Widget>[
        TextButton(
          onPressed: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ClientDataShow()))
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  inputValues(BuildContext context, String s) {
    var control;
    if (s == "username") {
      control = usernameTextController;
    } else if (s == "password") {
      control = passwordTextController;
    } else if (s == "confirm") {
      control = confirmTextController;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30),
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
              s == "permission"
                  ? drop()
                  : Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: control,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    //onChanged: (text) => {updateStaff()},
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

  drop() {
    return DropdownButton<String>(
      onChanged: (String? newValue) {
        setState(() {
          permission = newValue.toString();
        });
      },
      value: permission,
      icon: const Icon(Icons.arrow_downward),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      enableFeedback: true,
      items: <String>['1', '0'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16.0),
          ),
        );
      }).toList(),
    );
  }
}
