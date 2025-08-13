import 'package:flutter/material.dart';
import 'package:pkm_os/node_model.dart';
import 'package:pkm_os/node_widget.dart';

class CanvasScreen extends StatefulWidget {
  const CanvasScreen({super.key});

  @override
  State<CanvasScreen> createState() => _CanvasScreenState();
}

class _CanvasScreenState extends State<CanvasScreen> {
  final List<CanvasNode> _nodes = [
    CanvasNode(
      id: "some_id",
      content: "The unexamined life is not worth living.",
      x: 0.0,
      y: 0.0,
      nodeType: NodeType.thought,
    ),
    CanvasNode(
      id: "some_id_2",
      content: "This is a content example",
      x: 5,
      y: 5,
      nodeType: NodeType.thought,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Canvas Prototype")),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNode,
        child: Icon(Icons.add),
      ),
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: EdgeInsets.all(double.infinity),
        child: Stack(
          children: [
            Container(width: 2000, height: 2000, color: Color(0xFFF0F0F0)),
            ..._nodes.map((node) {
              return Positioned(
                left: node.x,
                top: node.y,
                child: NodeWidget(node: node),
              );
            }),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
    );
  }

  void _addNode() {
    setState(() {
      _nodes.add(
        CanvasNode(
          id: DateTime.now().toIso8601String(),
          content: "New Thought",
          x: 0,
          y: 0,
          nodeType: NodeType.thought,
        ),
      );
    });
  }
}
