import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/services/database.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:my_tasker/theme/nav_bar.dart';
import 'package:my_tasker/theme/update_txt.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  @override
  Widget build(BuildContext context) {

    User? fromFirebaseUser = FirebaseAuth.instance.currentUser;
    final user = Provider.of<UserApp?>(context);


    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        UserData? userData  = snapshot.data;
        return Scaffold(
          drawer: NavBar(),
          appBar: AppBar(

            backgroundColor: ColorTheme.green,
            centerTitle: true,
            title: Text('My account',
              style: TextStyle(
                fontSize:25,
              ),
            ),
          ),

          body: SingleChildScrollView(
            child: Container(
              child: Column (
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 5.0),
                    child: Text('Personal informations' ,
                    style: TextStyle(
                      color: ColorTheme.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                  ),

                  Divider(thickness: 0.5,
                    color: Colors.grey,
                    endIndent: 60,
                    indent: 60,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 20.0),
                    child: Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('Email :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                      child: UpdateTxt(text: 'Email',currentValue: '${fromFirebaseUser?.email}', parameter: 'email'),
                    ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                    child: Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('Password :',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                    //TODO: UPDATE PASSWORD
                    child: UpdateTxt(text: 'Password',currentValue: '******',parameter:'password'),
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                    child: Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('First name :',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                    child: UpdateTxt(text: 'First Name', currentValue: '${userData?.firstName}',parameter: 'firstName',),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                    child: Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text('Last name:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                    child: UpdateTxt(text: 'Last Name', currentValue: '${userData?.lastName}',parameter: 'lastName'),
                  ),

                ],
              ),

            ),
          ),
        );
      }
    );
  }
}
