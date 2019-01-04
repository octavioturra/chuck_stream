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
  Widget build() {
    if (snapShot.hasError) {
      return Text("deu ruim...${snapShot.error}");
    }

    switch (snapShot.connectionState) {
      case ConnectionState.waiting:
        return Text("preparando...");
      case ConnectionState.active:
      case ConnectionState.done:
        return (snapShot.hasData)
            ? child
            : Text("miou...");
      case ConnectionState.none:
        return Text("vazio...");
    }
  }
}