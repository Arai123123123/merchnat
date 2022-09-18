import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:ocs_merchant_side/models/Booking.dart';
import 'package:ocs_merchant_side/models/ModelProvider.dart';

/// ====================== Adding new Booking ======================

// Two separate functions to demonstrate multiple ways you can integrate this inside your application,
// either by passing in the model object or just the details (or a subset of details)

/// Flow for this function
/// 1. Input details for the booking from the user
/// 2. Make the booking model using the "Booking" model from models folder
/// 3. pass that model to this function and it will save the booking at amplify Datastore
void addBookingFromModel({required Booking newBooking}) async {

  await Amplify.DataStore.save(newBooking);
}

/// Flow for this feature
/// 1. Input details for the booking from the user
/// 2. pass that information to this function and it will make the booking model object and
/// save it at amplify Datastore
void addBookingFromDetails({required String bookingName, required String bookingTime, required String status,
required String reference, required String merchantemail, required String recieveremail,
required int priority}) async{


  final newBooking = Booking(
      bookingName: bookingName,
      bookingTime: bookingTime,
      status: status,
      reference: reference,
      merchantemail: merchantemail,
      recieveremail: recieveremail,
      priority: priority);

  await Amplify.DataStore.save(newBooking);
}
/// =======================================================================


/// ====================== Delete a Booking ======================

// Two separate functions to demonstrate multiple ways you can integrate this inside your application,
// either by passing in the model object or just the details (or a subset of details)

/// Flow for this function
/// 1. Select a booking from the UI
/// 2. It depends on your implementation, but it would be something like that you are displaying
/// bookings using the booking model stored in the models folder (fetched from the amplify)
/// OR you may be using custom models or something
/// In any case, you can make an "Booking" model yourself in the app and pass to this function
/// or just pass the information to the second function
void deleteBookingFromModel({required Booking booking}) async {

  await Amplify.DataStore.delete(booking);
}


void deleteBookingFromDetails({required String bookingName, required String bookingTime, required String status,
  required String reference, required String merchantemail, required String recieveremail,
  required int priority}) async{


  final toDeleteBooking = Booking(
      bookingName: bookingName,
      bookingTime: bookingTime,
      status: status,
      reference: reference,
      merchantemail: merchantemail,
      recieveremail: recieveremail,
      priority: priority);

  await Amplify.DataStore.delete(toDeleteBooking);
}
/// =======================================================================


/// ====================== Update a Booking ======================

// Two separate functions to demonstrate multiple ways you can integrate this inside your application,
// either by passing in the model object or just the details (or a subset of details)

/// Same concept follows here, pass in the information or a new "Booking" model
/// containing new and updated parts of the info.
void updateBookingFromModel({required Booking booking}) async {

  await Amplify.DataStore.save(booking);
}


void updateBookingFromDetails({required String bookingName, required String bookingTime, required String status,
  required String reference, required String merchantemail, required String recieveremail,
  required int priority}) async{


  final toUpdateBooking = Booking(
      bookingName: bookingName,
      bookingTime: bookingTime,
      status: status,
      reference: reference,
      merchantemail: merchantemail,
      recieveremail: recieveremail,
      priority: priority);

  await Amplify.DataStore.save(toUpdateBooking);
}
/// =======================================================================


/// ====================== Adding new Client ======================

void addClientFromModel({required Client newClient}) async {

  await Amplify.DataStore.save(newClient);
}

void addClientFromDetails({required String username, required String firstname, required String lastname,
  required String password, required String mobile, required String email,
  required String notice}) async{


  final newClient = Client(
      username: username,
      firstname: firstname,
      lastname: lastname,
      passowrd: password,
      mobile: mobile,
      email: email,
      notice: notice);
  await Amplify.DataStore.save(newClient);
}
/// =======================================================================



































