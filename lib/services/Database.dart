import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<Stream<QuerySnapshot>> getCategories() async {
    return FirebaseFirestore.instance.collection("Categories").snapshots();
  }

  Future<Stream<QuerySnapshot>> getProducts() async {
    return FirebaseFirestore.instance
        .collection("Categories")
        .doc("3mm3ldMKS1R2qa3KmHBF")
        .collection("Products")
        .snapshots();
  }
}
