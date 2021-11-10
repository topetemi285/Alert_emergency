import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/models/details.dart';
import 'package:flutter/material.dart';
import 'package:new_app/services/firestore_services.dart';
// import 'package:uuid/uuid.dart';

class DetailedProvider with ChangeNotifier {
  final firestoreservices = FirestoreServices();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String _subject;
  String _address;
  String _description;
  String _currentLocation;
  DateTime _doi;
  String _longi;
  String _latitude;
  //  String _detailId;
  //  var uuid = Uuid();

  //getter of the parameters
  String get subject => _subject;
  String get address => _address;
  String get description => _description;
  String get longitude => longitude;
  String get latitude => latitude;
  DateTime get doi => _doi;
  String get longi => _longi;
  String get lati => _latitude;
  //String get detailedId=>_detailId;

  //setters of the parameter
  changeSubject(String value) {
    _subject = value;
    notifyListeners();
  }

  changeaAddress(String value) {
    _address = value;
    notifyListeners();
  }

  changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  changeCurrentLocation(String value) {
    _currentLocation = value;
    notifyListeners();
  }

  changeCurrentLongitude(String value) {
    _longi = value;
    notifyListeners();
  }

  changeCurrentLatitude(String value) {
    _latitude = value;
    notifyListeners();
  }

  changeDoi() {
    _doi = DateTime.now();
    notifyListeners();
  }

  saveDetail({String subject, address, description, longitude, latitude, doi}) {
    var newDetail = Detail(
      subject: subject,
      address: address,
      description: description,
      longitude: longitude,
      latitude: latitude,
      senderId: auth.currentUser.uid,
      doi: doi,
    );

    firestoreservices.saveDetail(newDetail);
  }
}
