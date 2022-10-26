

import 'package:flutter/material.dart';
import 'package:my_tasker/entities/subject_data.dart';
import 'package:my_tasker/pages/subjects/subject_tile.dart';
import 'package:provider/provider.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({Key? key}) : super(key: key);

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {

    final subjects = Provider.of<List<SubjectData>?>(context) ?? [];


    return ListView.builder(
      itemBuilder: (context,index){
        return SubjectTile(subjectData: subjects[index]);
      },
      itemCount: subjects.length,);
  }
}
