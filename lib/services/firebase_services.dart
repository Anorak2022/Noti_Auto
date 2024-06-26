
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getAuto() async{
List auto=[];

CollectionReference collectionReferenceauto = db.collection('auto');

QuerySnapshot queryauto = await collectionReferenceauto.get();

queryauto.docs.forEach((element) {

  auto.add(element.data());

}
);

return auto;

}


// ignore: camel_case_types
class DatabaseMethods{

  Future addauto(
    Map<String, dynamic> autoinfo, String id) async{
      return await FirebaseFirestore.instance
      .collection('auto')
      .doc(id)
      .set(autoinfo);
    }

     Future addtaller(
    Map<String, dynamic> tallerinfo, String id) async{
      return await FirebaseFirestore.instance
      .collection('taller')
      .doc(id)
      .set(tallerinfo);
    }

Future<Stream<QuerySnapshot>> getcars() async{
  FirebaseFirestore db=FirebaseFirestore.instance;
  return await db.collection('auto').snapshots();

}

Future updatecars(String id, Map<String, dynamic> updateinfo) async{
  return FirebaseFirestore.instance.collection('auto').doc(id).update(updateinfo);
}

Future updatetaller(String id, Map<String, dynamic> updateinfo) async{
  return FirebaseFirestore.instance.collection('taller').doc(id).update(updateinfo);
}
}