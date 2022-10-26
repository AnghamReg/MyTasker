import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_tasker/services/auth.dart';
import 'package:my_tasker/theme/colors.dart';
import 'package:my_tasker/theme/txt_field.dart';

class SignIn extends StatefulWidget {
  final Function() toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  final AuthService _auth = AuthService();
  //to identify our form
  final _formKey = GlobalKey<FormState>();

  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: ColorTheme.txtlightblue,
          elevation: 0.0,
          title: Container(
            height: 50,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter ,
              child: Text('My Tasker',
                  style: TextStyle(
                    letterSpacing: 1.5,
                  ),),
            ),
          ),
          centerTitle: true,
        ),
      ) ,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[



              Container(
                child:Align(
                  alignment: Alignment.topLeft,
                  child: Text('Sign into your account',
                    style: TextStyle(
                        color: ColorTheme.txtlightblue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),),
                ),
              ),


              SizedBox(
                height: 30.0,
              ),

              TextFormField(
                //Email Text Field
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val)=> val!.isEmpty? 'enter mail': null ,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                //Password Text Field
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val)=> val!.length<6? 'Password must have at least 6 characters': null ,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),

              Text(error,
                style: TextStyle(color: Colors.red,
                    fontSize: 14.0),
              ),


              RaisedButton(onPressed:() async{
                if(_formKey.currentState!.validate()) {

                  // setState(() {
                  //   loading=true;
                  // });

                  dynamic result =
                  await _auth.signInWithEmailAndPassword(email, password);

                  if (result == null) {
                    setState(() {
                      error = 'Could not sign in';
                      // loading=false;
                    });
                  }
                }},

                color: Colors.green[400],
                child: Text('Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(
                height: 5.0,
              ),

              Divider(thickness: 0.5,
                color: Colors.grey[600],
                endIndent: 20,
                indent: 20,),

              SizedBox(
                height: 5.0,
              ),

              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: 'Create new account',
                      style: TextStyle(
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
        ),
      ),
    );
  }
}
