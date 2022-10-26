
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/services/database.dart';

class AuthService {


  final FirebaseAuth _auth =  FirebaseAuth.instance;

//TODO : IF PASSWORD DIDN'T CHANGE YOU HAVE TO FIND A SOLUTION
  // Create and Update password
  // Future updatePassword(String password) async{
  //   return await _auth.currentUser?.updatePassword(password)
  //       .then((value) {
  //     print("Update password successfully");
  //   }) ;
  // }


//TODO : IF EMAIL DIDN'T CHANGE YOU HAVE TO FIND A SOLUTION
  // // Create and Update email
  // Future updateEmail(String email) async{
  //   return await _auth.currentUser?.updateEmail(email)
  //       .then((value) {
  //     print("Update email successfully");
  //   }) ;
  // }



  //CREATE USER OBJECT BASED ON USER (FIREBASEUSER) ghalta lina add ? in front of User
  UserApp? _userFromFireBaseUser(User? user){
    return user != null ? UserApp(uid: user.uid) : null;
  }

  //AUTH CHANGE USER STREAM
  Stream<UserApp?> get user{
    return _auth.authStateChanges().map(_userFromFireBaseUser);
  }



  //sing in with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }}



  //register with email and password
  Future registerWithEmailAndPassword(String email,String password,String lastName,String firstName) async{
      try{
        UserCredential result = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        User? user = result.user;

        //create a new document for the user with uid
        await DatabaseService(uid: user!.uid).updateUserData(lastName, firstName);


        return _userFromFireBaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
      }
    }

  //sing out

    Future signOut() async{
      try{
        return await _auth.signOut();
      }
      catch(e){
        print('ERROR ${e.toString()}');
        return null;
      }
    }



}
