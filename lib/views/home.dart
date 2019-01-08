import 'package:flutter/material.dart';
import 'package:chuck_streams/managers/categories.dart';
import 'package:chuck_streams/models/categories.dart';
import 'package:chuck_streams/views/router.dart';
import 'package:chuck_streams/models/envelope.dart';

import 'package:chuck_streams/components/streamLoader.dart';

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
        builder: (BuildContext context, AsyncSnapshot<Envelope<Categories>> snapShot) {
          if (snapShot.hasError) {
            return Text("deu ruim...${snapShot.error}");
          }

          return StreamLoader(
            snapShot,
            child: (snapShot.hasData) ? buildContent(snapShot.data.data.categories) : Text("miou...")
          );
        }
      )
    );
  }
}