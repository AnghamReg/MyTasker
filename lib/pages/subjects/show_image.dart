import 'package:flutter/material.dart';
import 'package:my_tasker/services/storage.dart';

class ShowImage extends StatelessWidget {
  String? fileName;
  String? userID;
  String? subjectID;
  ShowImage({required this.fileName,
  required this.userID,
  required this.subjectID});

  @override
  Widget build(BuildContext context) {
    final Storage storage =Storage();

    return Container(
      child: Scaffold(
        body: FutureBuilder(
            future: storage.downloadURL(userID!,subjectID!,fileName!),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if(snapshot.hasData)
              {
                return Center(
                  child: Container(

                    child: Image.network(snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              } else
              {
                return CircularProgressIndicator();
              }
            }
        ),
      ),
    );
  }
}
