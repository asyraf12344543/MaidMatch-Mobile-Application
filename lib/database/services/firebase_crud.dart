import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maidapps2/database/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Book');
class FirebaseCrud {

  //create
  static Future<Response> addBook({
    required String date,
    required String time,
    required String address,
    required String specialrequest,

  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "date": date,
      "time": time,
      "address" : address,
      "specialrequest" : specialrequest,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //read
  static Stream<QuerySnapshot> readBook() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  //update
  static Future<Response> updateBook({
    required String date,
    required String time,
    required String address,
    required String specialrequest,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "date": date,
      "time": time,
      "address" : address,
      "specialrequest" : specialrequest,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Order";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //delete
  static Future<Response> deleteBook({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
      response.code = 200;
      response.message = "Sucessfully Deleted Order";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}


