

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference domains = db.collection('domains');

Future<void> addDomain(id, name, domain, registrar, expiration) {
  return domains
      .add({
    'id': id,
    'name': name,
    'domain': domain,
    'registrar': registrar,
    'expiration': expiration
  })
      .then((DocumentReference doc) => {
    print('Domain Added with ID: ${doc.id}')
  })
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> getDomains() async {
  QuerySnapshot querySnapshot = await domains.get();
  for (var doc in querySnapshot.docs) {
    print("${doc.id} => ${doc.data()}");
  }
}

Future<void> updateDomain(String docId, String name, String domain, String registrar, String expiration) {
  return domains
      .doc(docId)
      .update({
    'name': name,
    'domain': domain,
    'registrar': registrar,
    'expiration': expiration
  })
      .then((value) => print("Domain Updated"))
      .catchError((error) => print("Failed to update domain: $error"));
}

Future<void> deleteDomain(String docId) {
  return domains
      .doc(docId)
      .delete()
      .then((value) => print("Domain Deleted"))
      .catchError((error) => print("Failed to delete domain: $error"));
}
