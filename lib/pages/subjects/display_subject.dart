import 'package:flutter/material.dart';
import 'package:my_tasker/entities/subject_data.dart';
import 'package:my_tasker/pages/subjects/subject_file.dart';
import 'package:my_tasker/theme/colors.dart';

class DisplaySubject extends StatefulWidget {

  const DisplaySubject({super.key, required this.subjectData});
  final SubjectData subjectData;

  @override
  State<DisplaySubject> createState() => _DisplaySubjectState();
}

class _DisplaySubjectState extends State<DisplaySubject> {

  String? subjectName='';
  String? teacherName='';
  String? teacherEmail='';
  String? description='';
  String? subjectCoeff='';

  @override
  void initState() {
    subjectName= this.widget.subjectData.subjectName;
    teacherName=this.widget.subjectData.teacherName;
    teacherEmail=this.widget.subjectData.teacherEmail;
    description=this.widget.subjectData.description;
    subjectCoeff=this.widget.subjectData.coefficient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subjectName',
          style: TextStyle(
            fontSize:25,
          ),),
        centerTitle: true,
        backgroundColor: ColorTheme.yellow,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.fromLTRB(20,50, 0, 10),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Subject's informations",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ),
            ),

            Divider(thickness: 0.5,
              color: Colors.grey,
              endIndent: 60,
              indent: 60,),

            Padding(
            padding: const EdgeInsets.fromLTRB(0,20, 0, 10),
            child: Container(
            child: Text("$subjectName    - ($subjectCoeff)",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20,0, 0, 10),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("$teacherName - $teacherEmail",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),



            Padding(
              padding: const EdgeInsets.fromLTRB(20,20, 0, 10),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Text("Description : ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    Text("$description ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      ),


                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Divider(thickness: 0.5,
              color: Colors.grey,
              endIndent: 60,
              indent: 60,),

            SizedBox(
              height: 20,
            ),

          SubjectFile(subjectID : this.widget.subjectData.id),

          ],
        ),
      ),
    );
  }
}
