import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_tasker/entities/subject_data.dart';
import 'package:my_tasker/pages/subjects/subject_list.dart';
import 'package:my_tasker/services/auth.dart';
import 'package:my_tasker/services/database.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:my_tasker/theme/nav_bar.dart';
import 'package:provider/provider.dart';


class ShowSubjects extends StatefulWidget {
  const ShowSubjects({Key? key}) : super(key: key);

  @override
  State<ShowSubjects> createState() => _ShowSubjectsState();
}

class _ShowSubjectsState extends State<ShowSubjects> {

  final AuthService _auth =  AuthService();
  User? fromFirebaseUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<SubjectData>?>.value(
      initialData: null,
      value: DatabaseService(uid:fromFirebaseUser!.uid).subjects,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: ColorTheme.yellow,
          centerTitle: true,
          title: Text('Subjects',
          style: TextStyle(
              fontSize:25,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, '/addSubject');
        },
        backgroundColor: ColorTheme.yellow,
        child: Icon(Icons.add),),
        // floatingActionButton: FloatingActionButtonLocation.centerDocked,
        body: SubjectList() ,
      ),
    );
  }
}
