import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_tasker/theme/colors.dart';

class ViewBar extends StatefulWidget {
  const ViewBar({Key? key}) : super(key: key);

  @override
  State<ViewBar> createState() => _ViewBarState();
}

class _ViewBarState extends State<ViewBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Change View',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 3,
              ),
            ),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              backgroundColor: ColorTheme.red,
              child: ClipOval(
                child: Icon(Icons.calendar_month, size: 40,
                color: Colors.white,),
              ),
            ),
            decoration: BoxDecoration(
              color: ColorTheme.lightred,
            ),
          ),


          ListTile(
            leading: Icon(Icons.arrow_circle_right_rounded,
              color: ColorTheme.red,),
            title: Text('Month',
              style: TextStyle(
                  fontSize:18,
                  color: ColorTheme.txtblue
              ),
            ),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/calendarMonth');
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_circle_right_rounded,
              color: ColorTheme.red,),
            title: Text('Week',
              style: TextStyle(
                  fontSize:18,
                  color: ColorTheme.txtblue
              ),
            ),
            onTap: (){
              Navigator.pushReplacementNamed(context, '/calendarWeek');
            },
          ),

          ListTile(
            leading: Icon(Icons.arrow_circle_right_rounded,
              color: ColorTheme.red,),
            title: Text('Day',
              style: TextStyle(
                  fontSize:18,
                  color: ColorTheme.txtblue
              ),
            ),
            onTap: (){
               Navigator.pushReplacementNamed(context, '/calendarDay');
            },
          ),
          Divider(thickness: 0.5,
            color: Colors.grey,
            endIndent: 20,
            indent: 20,),


        ],
      ),
    );
  }
}
