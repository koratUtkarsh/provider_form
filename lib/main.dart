import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form/screen/counter/provider/logic_provider.dart';
import 'package:provider_form/screen/counter/view/home_screen.dart';

void main()
{
   runApp(
     ChangeNotifierProvider(
       create: (context) => liProvider(),
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         routes: {
           '/':(context) => Home(),
         },
       ),
     ),
   );
}