import 'package:flutter/material.dart';

import 'package:chuck_streams/views/home.dart';
import 'package:chuck_streams/views/detail.dart';

void goToHome(BuildContext context) => Navigator
  .push(context,
    MaterialPageRoute(
      builder: (context) => HomeView()
    )
  );

void goToDetail(BuildContext context, String route) => Navigator
  .push(context,
    MaterialPageRoute(
      builder: (context) => DetailView(route)
    )
  );

class Router extends StatelessWidget{
  @override
  Widget build(BuildContext context) => HomeView();
}