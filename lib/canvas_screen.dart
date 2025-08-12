import 'package:flutter/material.dart';

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Canvas Prototype")),
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: EdgeInsets.all(double.infinity),
        child: Container(width: 2000, height: 2000, color: Color(0xFFF0F0F0)),
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}
