import "package:flutter/material.dart";

class StreamLoader extends StatelessWidget {
  final Widget loader;
  final AsyncSnapshot snapShot;
  final Widget child;
  
  StreamLoader(this.snapShot, {
    this.loader: const CircularProgressIndicator(),
    this.child: const Text(""),
  });
  
  @override
  Widget build(BuildContext build) {
    switch (snapShot.connectionState) {
      case ConnectionState.active:
      case ConnectionState.done:
        return child;
      case ConnectionState.waiting:
      case ConnectionState.none:
      default:
        return loader;
    }
  }
}