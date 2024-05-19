
import 'package:cloud_firestore/cloud_firestore.dart';

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

}
