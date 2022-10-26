import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../theme/colors.dart';
import '../../theme/nav_bar.dart';
import '../../theme/view_bar.dart';

class CalendarDay extends StatefulWidget {
  const CalendarDay({Key? key}) : super(key: key);

  @override
  State<CalendarDay> createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      endDrawer: ViewBar(),
      appBar: AppBar(
        backgroundColor: ColorTheme.red,
        centerTitle: true,
        title: Text('Calendar',
          style: TextStyle(
            fontSize:25,
          ),
        ),




        leading: Builder(
          builder: (context){
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (context){
              return IconButton(
                icon: Icon(Icons.settings),
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(1, 10, 1, 10),
            child: Container(height: 500,
                child: SfCalendar(
                  showNavigationArrow: true,
                  view: CalendarView.day,
                  monthViewSettings: MonthViewSettings(showAgenda: true),
                )),
          ),
          FloatingActionButton(
              child: Icon(Icons.add,),
              backgroundColor: ColorTheme.red
              ,onPressed: (){
            //TODO :  ADD AN APPOINTMENT
          })
        ],
      ),
    );
  }
}
