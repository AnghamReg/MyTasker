
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/entities/subject_data.dart';

class DatabaseService {

  final String? uid ;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');

  final CollectionReference subjectCollection =
  FirebaseFirestore.instance.collection('subjects');



  //Create and Update UserApp entity
  Future updateUserData(String lastName, String firstName) async{
    return await userCollection.doc(uid).set({
      'lastName': lastName,
      'firstName': firstName,
    });
  }


  //Userdata from snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(uid: uid,
        lastName: snapshot['lastName'],
        firstName: snapshot['firstName'],);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
        .map(_userDataFromSnapShot);
  }




  //Create subject entity
  Future createSubjectData(
      String sn,
      String tn,
      String te,
      String d,
      String c) async{
    return await subjectCollection.doc().set(
        { 'userID' :uid,
          'subjectName':sn,
          'teacherName':tn,
          'teacherEmail':te,
          'description':d,
          'coefficient':c,});
  }



//subject list from snapshot
  List<SubjectData> _subjectListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return SubjectData(subjectName: doc.get('subjectName'),
          userID: doc.get('userID'),
          teacherName: doc.get('teacherName'),
          teacherEmail: doc.get('teacherEmail'),
          description: doc.get('description'),
          coefficient: doc.get('coefficient'),
          id: doc.id);
    }).toList();
  }

  //get subjects stream
  Stream<List<SubjectData>> get subjects{
    return subjectCollection.where('userID', isEqualTo: uid).snapshots()
        .map(_subjectListFromSnapshot);
  }

  //Delete Subject by ID
  Future<void> deleteSubject(id) {
    //TODO: WHEN U DELETE SUBJECT U NEED TO DELETE STORAGE
    return subjectCollection
        .doc(id)
        .delete();
  }
  //Update Subject by ID
  Future<void> updateSubject(id,sn,tn,te,d,c) {
    return subjectCollection
        .doc(id).update({
      'userID' :uid,
      'subjectName':sn,
      'teacherName':tn,
      'teacherEmail':te,
      'description':d,
      'coefficient':c,
    });
  }

  }

