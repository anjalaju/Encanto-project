import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_project/model/addProject.dart';
import 'package:main_project/model/addreview.dart';
import 'package:main_project/model/complaint.dart';
import 'package:main_project/model/enterprenurmodel.dart';
import 'package:main_project/model/notificationmodel.dart';
import 'package:main_project/model/userbookingmodel.dart';

class FunctionProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  final bookingname = TextEditingController();
  final bookemail = TextEditingController();
  final bookphonenumber = TextEditingController();
  final bookdiscription = TextEditingController();

  String? bookdata;

  clear() {
    bookingname.clear();
    bookemail.clear();
    bookphonenumber.clear();
    bookdiscription.clear();
    notifyListeners();
  }

  //set

  Future addEnterprenur(EnterprenurModel enterprenurModel) async {
    final snapshot = db.collection('enterprenur').doc();

    snapshot.set(enterprenurModel.toJsone(snapshot.id));
  }

  Future setEvent(EventModel eventModel) async {
    final snapshot = db.collection('AddEvent').doc();

    snapshot.set(eventModel.toJson(snapshot.id));
  }

  //get

  List<EventModel> listevent = [];
  Stream<QuerySnapshot> getEventproject(mainwere, subwere) {
    // final snapshot = db
    //     .collection('AddEvent')
    //     .where('eventmaincategory', isEqualTo: mainwere)
    //     .where('eventsubcategory', isEqualTo: subwere)
    //     .snapshots();

    // snapshot.listen((event) {
    //   listevent = event.docs.map((e) {
    //     return EventModel.fromJsone(e.data());
    //   }).toList();
    // });
    // notifyListeners();

    return db
        .collection('AddEvent')
        .where('eventmaincategory', isEqualTo: mainwere)
        .where('eventsubcategory', isEqualTo: subwere)
        .snapshots();
  }

  // update

  Future updateevent(
      docid, eventname, eventprice, eventplace, eventdiscription, image) async {
    EventModel? eventModel;

    db.collection('AddEvent').doc(docid).update({
      'eventname': eventname,
      'startingprice': eventprice,
      'eventplace': eventplace,
      'eventdiscription': eventdiscription,
      'image': image.isEmpty ? eventModel!.Image : image,
    });

    log('this image sjdja ${eventModel!.Image}');
    // notifyListeners();
  }

  ///delete

  Future deletedoc(docid) async {
    try {
      db.collection('AddEvent').doc(docid).delete();
    } catch (e) {
      log('erro');
    }
    notifyListeners();
  }

  // booking

  Future bookingEvent(BookingModle bookingModle) async {
    final snapshot = db.collection('Boookingevent').doc();

    snapshot.set(bookingModle.tojsone(snapshot.id));
  }

  Stream<QuerySnapshot> getBookingevent(uid) {
    return db
        .collection('Boookingevent')
        .where('Userid', isEqualTo: uid)
        .snapshots();
  }

  Future addCompalint(ComplaintModel complaintModel) async {
    final snapshot = await db.collection('Alert').doc();

    snapshot.set(complaintModel.tojsone(snapshot.id));
  }

  Stream<QuerySnapshot> getAllcomplaint() {
    return db.collection('Alert').snapshots();
  }

  Future addReview(AddReview addReview) async {
    final snapshot = await db.collection('AddReview').doc();

    snapshot.set(addReview.tojsone(snapshot.id));
  }


  Stream<QuerySnapshot> getReview(){
    return db.collection('AddReview').snapshots();
  }



  Future addNotification(NotificationModel notificationModel)async{

    final snapshot = await db.collection('Notiication').doc();

    snapshot.set(notificationModel.tojsone(snapshot.id));
    
  }



  Stream getNotification(){
    return db.collection('Notiication').snapshots();
  }
}
