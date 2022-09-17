

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingClientScreen extends StatefulWidget {
  const BookingClientScreen({Key? key}) : super(key: key);

  @override
  State<BookingClientScreen> createState() => _BookingClientScreenState();
}

class _BookingClientScreenState extends State<BookingClientScreen> {
  var totalClient = 0;
  var arrivedClient = 0;
  var confirmedClient = 0;

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}