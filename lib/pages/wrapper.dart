import 'package:my_tasker/entities/UserApp.dart';
import 'package:my_tasker/pages/authentification/authentificate.dart';
import 'package:my_tasker/pages/authentification/sign_in.dart';
import 'package:my_tasker/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final user = Provider.of<UserApp?>(context);

    if (user==null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}
