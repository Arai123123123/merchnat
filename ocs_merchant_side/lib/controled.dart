import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:ocs_merchant_side/util.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Merchant.dart';
import 'package:ocs_merchant_side/models/Client.dart';

abstract class ClientState {}

class LoaingClient extends ClientState {}

class ListClients extends ClientState {
  final List<Client> client;

  ListClients({required this.client});
}

class ListFailure extends ClientState {
  final Exception exception;

  ListFailure({required this.exception});
}

class Controled extends Cubit<ClientState> {
  final toRepo = ToRepository();
  Controled() : super(LoaingClient());

  void getClients() async {
    if (state is ListClients == false) {
      emit(LoaingClient());
    }

    try {
      final data = await Amplify.DataStore.query(Client.classType);
      emit(ListClients(client: data));
    } catch (e) {
      debug_print("error: $e");
    }
  }

  void createClient(String username, String password) async {
    debug_print("---------username: $username");

    final current = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

    final newClient = Client(
      username: username,
      passowrd: password,
      //
    );

    try {
      await Amplify.DataStore.save(newClient);
    } catch (e) {
      debug_print("error: $e");
    }
  }

  void observeClient() {
    final obserS = toRepo.observeClients();
    obserS.listen((_) => getClients());
  }

  void updateNow(Client m, String u, String p) async {
    await toRepo.updateData(m, u, p);
  }

  void deleteNow(Client m, String i) async {
    await toRepo.deleteTodoById(m, i);
  }
}

class ToRepository {
  Future<void> deleteTodoById(Client m, String i) async {
    final data = m.copyWith(id: i);

    try {
      await Amplify.DataStore.delete(data);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateData(Client m, String u, String p) async {
    final current = DateFormat("yyyy-MM-dd").format(DateTime.now()).toString();

    final updatedClient = m.copyWith(username: u, passowrd: p);

    try {
      await Amplify.DataStore.save(updatedClient);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Client>> getClient() async {
    try {
      final data = await Amplify.DataStore.query(Client.classType);
      return data;
    } catch (e) {
      throw e;
    }
  }

  Stream observeClients() {
    return Amplify.DataStore.observe(Client.classType);
  }
}
