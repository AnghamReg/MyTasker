import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_tasker/services/auth.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:my_tasker/theme/txt_field.dart';

class Register extends StatefulWidget {
  final Function() toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  //to identify our form
  final _formKey = GlobalKey<FormState>();

  //Variables for Email and Password
  String email='';
  String password='';
  String lastName='';
  String firstName='';
  String error='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: ColorTheme.txtlightblue,
        elevation: 0.0,
        title: Text('My Tasker'),
        centerTitle: true,
      ) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Container(
                  child:Align(
                    alignment: Alignment.topLeft,
                    child: Text('Create new account',
                            style: TextStyle(
                                color: ColorTheme.txtlightblue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0
                            ),),
                  ),
                  ),

                SizedBox(
                  height: 40.0,
                ),


                Column(

                  children: [

                    TextFormField(
                      //Email Text Field
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val)=> val!.isEmpty? 'Enter mail': null ,
                      onChanged: (val){
                        setState(() {
                          email=val;
                        });
                      },
                    ),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      //Password Text Field
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (String? val){
                        if(val!.length<6){
                          return 'Password must have at least 6 characters';
                        }
                      },
                      obscureText: true,
                      onChanged: (val){
                        setState(() {
                          password=val;
                        });
                      },
                    ),

                    SizedBox(
                      height: 15.0,
                    ),

                    TextFormField(
                      //First name Text Field
                      decoration: textInputDecoration.copyWith(hintText: 'First name'),
                      validator: (val)=> val!.isEmpty? 'Enter first name': null ,
                      onChanged: (val){
                        setState(() {
                          firstName=val;
                        });
                      },
                    ),

                    SizedBox(
                      height: 15.0,
                    ),

                    TextFormField(
                      //Last Name Text Field
                      decoration: textInputDecoration.copyWith(hintText: 'Last name'),
                      validator: (val)=> val!.isEmpty? 'Enter last name': null ,
                      onChanged: (val){
                        setState(() {
                          lastName=val;
                        });
                      },
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    RaisedButton(onPressed:() async{
                      if(_formKey.currentState!.validate()){


                        dynamic result =
                        await  _auth.registerWithEmailAndPassword(email,password,lastName,firstName);

                        if(result==null){
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        }

                      }
                    },
                      color: Colors.green[400],
                      child: Text('Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    Text(error,
                      style: TextStyle(color: Colors.red,
                          fontSize: 14.0),
                    ),

                    SizedBox(height: 5.0,),

                    Divider(thickness: 0.5,
                      color: Colors.grey[600],
                      endIndent: 20,
                      indent: 20,),


                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Sign in',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorTheme.txtlightblue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                widget.toggleView();
                              }),
                      ]),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
