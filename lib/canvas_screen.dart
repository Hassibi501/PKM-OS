import 'package:flutter/material.dart';
import 'package:pkm_os/node_model.dart';
import 'package:pkm_os/node_widget.dart';

class CanvasScreen extends StatefulWidget {
  const CanvasScreen({super.key});

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  final CanvasNode _node = CanvasNode(
    id: "some_id",
    content: "The unexamined life is not worth living.",
    x: 0.0,
    y: 0.0,
    nodeType: NodeType.thought,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Canvas Prototype")),
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: EdgeInsets.all(double.infinity),
        child: Stack(
          children: [
            Container(width: 2000, height: 2000, color: Color(0xFFF0F0F0)),
            Positioned(
              left: _node.x,
              top: _node.y,
              child: NodeWidget(node: _node),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }
}
