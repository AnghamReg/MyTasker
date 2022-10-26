import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/services/auth.dart';
import 'package:my_tasker/services/database.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {

  final AuthService _auth =  AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserApp?>(context);
    String? firstname ='';
    String? lastname ='';


    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        UserData? userData  = snapshot.data;
        if (userData?.firstName!=null)
        {
        firstname=userData?.firstName;
        lastname=userData?.lastName;}

        return Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('${firstname} ${lastname}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 3,
                ),),
                  accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: ColorTheme.txtblue,
                child: ClipOval(
                  child: Icon(Icons.menu, size: 40,),
                ),
              ),
                decoration: BoxDecoration(
                  color: ColorTheme.txtlightblue,
                ),
              ),
              //TODO: CHANGE THE WIDGET USER ACCOUNT

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 0, 5),
                child: Text('Menu',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  color: ColorTheme.txtlightblue
                ),),
              ),

              Divider(thickness: 0.5,
                color: Colors.grey,
                endIndent: 100,
                indent: 20,),

              SizedBox(height: 20,),

              ListTile(
                leading: Icon(Icons.person,
                  color: ColorTheme.green,),
                title: Text('My account',
                  style: TextStyle(
                      fontSize:18,
                      color: ColorTheme.txtblue
                  ),),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/account');
                },
              ),



              Divider(thickness: 0.5,
                color: Colors.grey,
                endIndent: 20,
                indent: 20,),


              ListTile(
                leading: Icon(Icons.home,
                color: ColorTheme.blue,),
                title: Text('Home',
                style: TextStyle(
                  fontSize:18,
                  color: ColorTheme.txtblue
                ),),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),

              ListTile(
                leading: Icon(Icons.menu_book_outlined,
                  color: ColorTheme.yellow,),
                title: Text('Subjects',
                  style: TextStyle(
                      fontSize:18,
                      color: ColorTheme.txtblue,
                  ),
                ),
                onTap: ()async{
                  await Navigator.pushReplacementNamed(context, '/subjects');
                },
              ),

              ListTile(
                leading: Icon(Icons.calendar_month,
                  color: ColorTheme.red,),
                title: Text('Calendar',
                  style: TextStyle(
                      fontSize:18,
                      color: ColorTheme.txtblue
                  ),),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/calendarMonth');
                },
              ),



                Divider(thickness: 0.5,
                color: Colors.grey,
                endIndent: 20,
                indent: 20,),



              ListTile(
                leading: Icon(Icons.close,
                  color: ColorTheme.red,),
                title: Text('Exit',
                  style: TextStyle(
                      fontSize:18,
                      color: ColorTheme.txtblue
                  ),),
                onTap: (){
                  SystemNavigator.pop();
                      //TO CLOSE APP Hopefully
                },
              ),

              SizedBox(
                height: 130.0,
              ),

              ListTile(
                leading: Icon(Icons.logout,
                  color: ColorTheme.red,),
                title: Text('Logout',
                  style: TextStyle(
                    fontSize:18,
                    color: ColorTheme.red,
                  ),
                ),
                onTap: ()async{
                  Navigator.pushReplacementNamed(context, '/');
                  await _auth.signOut();

                },
              ),


            ],
          ),
        );
      }
    );
  }
}
