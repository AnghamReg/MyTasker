import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_tasker/pages/subjects/show_image.dart';
import 'package:my_tasker/pages/subjects/show_pdf.dart';
import 'package:my_tasker/services/storage.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class SubjectFile extends StatefulWidget {
  String? subjectID;
  SubjectFile({required this.subjectID});

  @override
  State<SubjectFile> createState() => _SubjectFileState();
}

class _SubjectFileState extends State<SubjectFile> {
  final Storage storage= Storage();
  String? name;
  String? userID;
  String? subjectID;

  final FirebaseAuth user =  FirebaseAuth.instance as FirebaseAuth;

  @override
  void initState() {
    name='';
    //TODO: Init ID
    userID=this.user.currentUser!.uid;
    subjectID=this.widget.subjectID;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20, 200, 10),
                  child: Container(
                    child: Text('Files :',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                Container(
                  // color: ColorTheme.lightyellow,
                  child: Align(
                    alignment: Alignment.center,
                    child: IconButton(
                      //TODO : ADD FILES ABOUT SUBJECTS
                      onPressed: ()async{

                        final results = await FilePicker.platform.pickFiles(allowMultiple: false,
                            type : FileType.custom,
                            allowedExtensions : ['png','jpg','pdf']);

                        if(results== null)
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text(('No file selected'))));
                          return null;
                        }
                        final path=results.files.single.path;
                        final fileName= results.files.single.name;

                        await storage.uploadFile(path!, fileName, userID! ,subjectID!)
                            .then((value) => print('Done'));

                        setState(() {});
                      },

                      icon: Icon(Icons.add,
                        color: ColorTheme.txtlightblue,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),



           FutureBuilder(
               future: storage.listFiles(userID! , subjectID!),
               builder:(BuildContext? context, AsyncSnapshot<firebase_storage.ListResult> snapshot)
               {
                 if(snapshot.connectionState == ConnectionState.done && snapshot.hasData)
                 {
                   return Container(
                     padding: EdgeInsets.symmetric(horizontal:20),
                     child: ListView.builder(
                       scrollDirection: Axis.vertical,
                       shrinkWrap: true,
                       itemCount: snapshot.data!.items.length,
                       itemBuilder: (BuildContext context,int index ){
                         return Padding(
                           padding: const EdgeInsets.all(8.0),

                           child: Card(
                             color: Colors.yellow[100],
                             elevation: 0,
                             shape: RoundedRectangleBorder(
                               side: BorderSide(
                                 color: Theme.of(context).colorScheme.outline,
                               ),
                               borderRadius: const BorderRadius.all(Radius.circular(12)),
                             ),
                             child: ListTile(
                               onTap: () async{
                                 //TODO: View FILE
                                 final dataName=snapshot.data!.items[index].name;
                                 if(dataName.contains('.png')|| dataName.contains('.jpg'))
                                 {
                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (context)
                                       =>ShowImage(fileName: dataName,
                                         userID: userID,
                                         subjectID: subjectID,)
                                       )
                                   );
                                 }
                                 else if (dataName.contains('.pdf'))
                                   {
                                     // print('${snapshot.data!.items[index]}');
                                     // Navigator.push(context,
                                     //     MaterialPageRoute(builder: (context)
                                     // =>ShowPDF(fileName: dataName,
                                     //   userID: userID,
                                     //   subjectID: subjectID,)
                                     //     )
                                     // );

                                   }
                               },
                               title: Text(snapshot.data!.items[index].name),
                               leading: Icon(Icons.insert_drive_file_sharp),
                             ),
                             ),

                         );
                       },
                     ),
                   );
                 }
                 if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData)
                 {
                   return CircularProgressIndicator(color: ColorTheme.yellow,);
                 }
                 return Container();
               }),




         ],
       ),

    );
  }
}
