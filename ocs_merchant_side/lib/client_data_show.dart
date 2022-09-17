import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocs_merchant_side/screens/Booking_tab_screen.dart';
import 'client_detail.dart';
import 'package:ocs_merchant_side/screens/Booking_tab_screen.dart';

import 'controled.dart';

class ClientDataShow extends StatefulWidget {
  const ClientDataShow({Key? key}) : super(key: key);

  @override
  State<ClientDataShow> createState() => _ClientDataShowState();
}

class _ClientDataShowState extends State<ClientDataShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => (Controled())..getClients()..observeClient(),
          child: const BookingTabScreen(),
        ),
      ),
    );
  }
}