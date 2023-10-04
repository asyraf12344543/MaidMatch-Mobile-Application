import 'package:maidapps2/screens/home/homepage.dart';
import 'package:provider/provider.dart';
import '../screens/home/home.dart';
import 'package:flutter/material.dart';

import '../models/firebaseuser.dart';
import 'authenticate/handler.dart';
import 'package:maidapps2/screens/home/homepage.dart';

class Wrapper extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final user =  Provider.of<FirebaseUser?>(context);

    if(user == null)
    {
      return Handler();
    }else
    {
      return Homepage();
    }

  }
}