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
                child: NodeWidget(
                  node: node,
                  onDragUpdate: (details) =>
                      _onNodeDragUpdate(node.id, details),
                  onDoubleTap: () => _editNodeContent(node.id),
                ),
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

  void _onNodeDragUpdate(String nodeId, DragUpdateDetails details) {
    setState(() {
      final index = _nodes.indexWhere((node) => node.id == nodeId);

      final oldNode = _nodes[index];

      final newNode = CanvasNode(
        id: oldNode.id,
        content: oldNode.content,
        x: oldNode.x + details.delta.dx,
        y: oldNode.y + details.delta.dy,
        nodeType: oldNode.nodeType,
      );

      _nodes[index] = newNode;
    });
  }

  Future<void> _editNodeContent(String nodeId) async {
    print("Double-tapped node: $nodeId");

    final index = _nodes.indexWhere((node) => node.id == nodeId);
    final oldNode = _nodes[index];

    final newContent = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: oldNode.content);
        return AlertDialog(
          title: Text("Edit Content"),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, controller.text),
              child: Text("Save"),
            ),
          ],
        );
      },
    );

    setState(() {
      if (newContent != null) {
        final newNode = CanvasNode(
          id: oldNode.id,
          content: newContent,
          x: oldNode.x,
          y: oldNode.y,
          nodeType: oldNode.nodeType,
        );

        _nodes[index] = newNode;
      }
    });
  }
}
