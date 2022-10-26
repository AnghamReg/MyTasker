import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/pages/account/account.dart';
import 'package:my_tasker/pages/authentification/authentificate.dart';
import 'package:my_tasker/pages/authentification/sign_in.dart';
import 'package:my_tasker/pages/calendar/calendar_day.dart';
import 'package:my_tasker/pages/calendar/calendar_week.dart';
import 'package:my_tasker/pages/loading.dart';
import 'package:my_tasker/pages/home/home.dart';
import 'package:my_tasker/pages/subjects/add_subject.dart';
import 'package:my_tasker/pages/subjects/show_pdf.dart';
import 'package:my_tasker/pages/subjects/subjects.dart';
import 'package:my_tasker/pages/calendar/calendar_month.dart';
import 'package:my_tasker/pages/subjects/update_subject.dart';
import 'package:my_tasker/pages/wrapper.dart';
import 'package:my_tasker/services/auth.dart';
import 'package:provider/provider.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  //initilization of Firebase app
  await Firebase.initializeApp();

  runApp(
  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamProvider<UserApp?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        //to remove the demo thing
        debugShowCheckedModeBanner: false,
        initialRoute:'/' ,
        routes: {
          '/': (context) => Loading(),
          '/account': (context) => MyAccount(),
          '/authenticate': (context) => Authenticate(),
          '/wrapper' : (context) => Wrapper(),
          '/home': (context) => Home(),
          '/subjects': (context) => ShowSubjects(),
          '/calendarMonth' : (context) => CalendarMonth(),
          '/calendarWeek' : (context) => CalendarWeek(),
          '/calendarDay' : (context) => CalendarDay(),
          '/addSubject' : (context) => addSubject(),
          // '/showPDF' : (context) => ShowPDF(),
        },
      ),
    );
  }
}





