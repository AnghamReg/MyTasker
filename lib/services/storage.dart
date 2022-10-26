import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;


class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future uploadFile(
      String filePath,
      String fileName,
      String userID,
      String subjectID)async{

    File file =File(filePath);
    try{
      //test is a folder which exists in storage in firebase
      await storage.ref('$userID/$subjectID/$fileName').putFile(file);

    } on firebase_core.FirebaseException catch(e)
    {
      print(e);
    }
  }


  Future<firebase_storage.ListResult> listFiles(String userID, String subjectID) async{
    firebase_storage.ListResult results= await storage.ref('$userID/$subjectID').listAll();

    // results.items.forEach((firebase_storage.Reference ref) {
    //   print('Found file : $ref');
    // });
    return results;
  }



  Future<String> downloadURL (String userID, String subjectID,String fileName) async{
    String downloadUrl= await storage.ref('$userID/$subjectID/$fileName').getDownloadURL();
    return downloadUrl;
  }


}