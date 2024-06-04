import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:main_project/model/addProject.dart';
import 'package:main_project/model/enterprenurmodel.dart';

class FunctionProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

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
  Future getEventproject(mainwere, subwere) async {
    final snapshot = db
        .collection('AddEvent')
        .where('eventmaincategory', isEqualTo: mainwere)
        .where('eventsubcategory', isEqualTo: subwere)
        .snapshots();

    snapshot.listen((event) {
      listevent = event.docs.map((e) {
        return EventModel.fromJsone(e.data());
      }).toList();
    });
  }

  // update
}
