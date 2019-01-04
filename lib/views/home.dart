import 'package:flutter/material.dart';
import 'package:points_rx/managers/categories.dart';
import 'package:points_rx/models/categories.dart';
import 'package:points_rx/views/router.dart';

class HomeView extends StatelessWidget {
  Widget buildContent(List<String> categories) => ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) => 
              ListTile(
                title: Text(categories[index]),
                onTap: () => goToDetail(context, categories[index]),
              ),
          );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Jokes')
      ),
      body: StreamBuilder(
        stream: CategoriesManager().categories,
        builder: (BuildContext context, AsyncSnapshot<Categories> snapShot) {
          if (snapShot.hasError) {
            return Text("deu ruim...${snapShot.error}");
          }
          switch(snapShot.connectionState) {
            case ConnectionState.waiting: return Text("preparando...");
            case ConnectionState.active:
            case ConnectionState.done: return (snapShot.hasData) ? buildContent(snapShot.data.categories) : Text("miou...");
            case ConnectionState.none: return Text("vazio...");
          }
        }
      )
    );
  }
}