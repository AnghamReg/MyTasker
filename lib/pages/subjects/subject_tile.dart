import 'package:flutter/material.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/entities/subject_data.dart';
import 'package:my_tasker/pages/subjects/display_subject.dart';
import 'package:my_tasker/pages/subjects/update_subject.dart';
import 'package:my_tasker/services/database.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:provider/provider.dart';

class SubjectTile extends StatelessWidget {

  final SubjectData subjectData;
  SubjectTile({required this.subjectData});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserApp?>(context);


    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            color: Colors.yellow[100],
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 10.0),
              child: ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context) =>
                          DisplaySubject(subjectData: subjectData)
                      )
                  );
                },
                title: Text('${subjectData.subjectName}'),
                subtitle: Text('Description : ${subjectData.description}'),
                trailing: Wrap(
                  // space between two icons
                  children: <Widget>[

                    IconButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => UpdateSubject(subjectData: subjectData),
                      ));
                    },
                        icon: Icon(Icons.mode_edit_outlined,
                          color: Colors.amber,)),
                    IconButton(onPressed: () async{
                      await DatabaseService(uid: user?.uid)
                          .deleteSubject(subjectData.id);
                    },
                        icon: Icon(Icons.delete_rounded),
                    color: ColorTheme.red,),

                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
