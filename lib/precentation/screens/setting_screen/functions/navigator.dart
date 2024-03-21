import 'package:flutter/material.dart';

void navigator(BuildContext context, Widget page){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
}