import 'package:flutter/material.dart';
import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/services/auth.dart';
import 'package:my_tasker/services/database.dart';
import 'package:my_tasker/theme/txt_field.dart';
import 'package:provider/provider.dart';

class UpdateTxt extends StatefulWidget {
  String? text;
  String? currentValue;
  String? parameter;
  UpdateTxt({required this.text,required this.currentValue,required this.parameter});

  @override
  State<UpdateTxt> createState() => _UpdateTxtState();
}

class _UpdateTxtState extends State<UpdateTxt> {

  bool updateOn = false;

  void updateAction(){
    setState(() {
      updateOn= !updateOn;
    });
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserApp?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user?.uid).userData,
    builder: (context, snapshot) {
          UserData? userData=snapshot.data;
      if(updateOn){
        //TODO : TXT FIELD TO UPDATE
        return Container(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Form(
                      child: TextFormField(
                        //Email Text Field
                        initialValue: '${widget.currentValue}',
                        decoration: textInputDecoration.copyWith(hintText: '${widget.text}'),
                        onChanged: (val){
                          setState(() {
                            widget.currentValue=val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              FlatButton.icon(onPressed: () async{


                switch (widget.text) {
                  case 'Email':
                    {
                      // await AuthService().updateEmail(widget.currentValue as String);
                      print ('Update email');
                    } break;
                  case 'Password':
                    {
                      // await AuthService().updatePassword(widget.currentValue as String);
                      print ('Update password');
                    }break;
                  case 'First Name':
                    {
                      await DatabaseService(uid: user?.uid)
                          .updateUserData(userData?.lastName as String,widget.currentValue as String);
                    }break;
                  case 'Last Name':
                    {
                      await DatabaseService(uid: user?.uid)
                          .updateUserData(widget.currentValue as String, userData?.firstName as String);
                    }break;
                  default:
                    {
                      print('THERE IS AN ERROR IN SWITCH-CASE');
                    }break;
                };
                updateAction();
              },
                icon: Icon(Icons.done),
                label: Text(''),),
            ],
          ),
        );
      } else {
        return Row(
          children: <Widget>[
            Text('${widget.currentValue}',
            style: TextStyle(
              fontSize: 17,
             ),
            ),
            FlatButton.icon(onPressed: (){
              updateAction();
            },
              icon: Icon(Icons.create),
              label: Text(''),),
          ],
        );

      }
    });


  }
}
