
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