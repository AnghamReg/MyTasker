import 'package:flutter/material.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/entities/subject_data.dart';
import 'package:my_tasker/services/database.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:my_tasker/theme/txt_field.dart';
import 'package:provider/provider.dart';

class UpdateSubject extends StatefulWidget {

  const UpdateSubject({super.key, required this.subjectData});
  final SubjectData subjectData;

  @override
  State<UpdateSubject> createState() => _UpdateSubjectState();
}

class _UpdateSubjectState extends State<UpdateSubject> {

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserApp?>(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('Update Subject',
                style: TextStyle(
                  fontSize:25,
                ),),
              centerTitle: true,
              backgroundColor: ColorTheme.yellow,
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('Subject Name',
                                style: TextStyle(
                                    color: ColorTheme.txtlightblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: TextFormField(
                            initialValue: this.widget.subjectData.subjectName,
                            decoration: textInputDecoration,
                            validator: (val)=> val!.isEmpty? 'Enter subject name': null ,
                            onChanged: (val) {
                              setState(() {
                                subjectName = val;
                              });
                            },

                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('Teacher`s name ',
                                style: TextStyle(
                                    color: ColorTheme.txtlightblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: TextFormField(
                            initialValue: this.widget.subjectData.teacherName,
                            onChanged: (val){
                              setState(() {
                                teacherName = val;
                              });
                            },
                            decoration: textInputDecoration,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('*This Field is optional ',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 15
                                ),),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('Teacher`s email ',
                                style: TextStyle(
                                    color: ColorTheme.txtlightblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: TextFormField(
                            initialValue: this.widget.subjectData.teacherEmail,
                            onChanged: (val){
                              setState(() {
                                teacherEmail = val;
                              });
                            },
                            decoration: textInputDecoration,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('*This Field is optional ',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 15
                                ),),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('Description ',
                                style: TextStyle(
                                    color: ColorTheme.txtlightblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child :TextFormField(
                            initialValue: this.widget.subjectData.description,
                            onChanged: (val){
                              setState(() {
                                description = val;
                              });
                            },
                            decoration: textInputDecoration,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('*This Field is optional ',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 15
                                ),),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('Coefficient ',
                                style: TextStyle(
                                    color: ColorTheme.txtlightblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child :TextFormField(
                            initialValue: this.widget.subjectData.coefficient,
                            validator: (String? val){

                              if(!(val!.isEmpty))
                              {
                                double? coef = double.tryParse(val);
                                if(coef==null)
                                {
                                  return 'Coefficient is a number';
                                }
                                else if(coef<0){
                                  return 'Coefficient cant be negative';
                                }
                              }

                            },
                            onChanged: (val){
                              setState(() {
                                subjectCoeff = val;
                              });
                            },

                            decoration: textInputDecoration,
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 20),
                          child: Container(
                            child:Align(
                              alignment: Alignment.topLeft,
                              child: Text('*This Field is optional ',
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 15
                                ),),
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),
                ],
              ),
            ) ,
            backgroundColor: Colors.grey[100],
            floatingActionButton: FloatingActionButton(
              onPressed: () async{
                //TODO : to UPDATE subject
                if(_formKey.currentState!.validate()){

                  await  DatabaseService(uid: user?.uid)
                      .updateSubject(this.widget.subjectData.id,
                      subjectName,
                      teacherName,
                      teacherEmail,
                      description,
                      subjectCoeff);
                  Navigator.pop(context);
                }
              },
              child: Icon(Icons.done),
              backgroundColor: ColorTheme.green,
            ),

          );

  }
}
