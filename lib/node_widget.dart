import 'package:flutter/material.dart';
import 'node_model.dart';

typedef void NodeDragUpdateCallback(DragUpdateDetails details);

class NodeWidget extends StatelessWidget {
  final CanvasNode node;
  final NodeDragUpdateCallback onDragUpdate;
  final void Function() onDoubleTap;

  const NodeWidget({
    super.key,
    required this.node,
    required this.onDragUpdate,
    required this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: onDragUpdate,
      onDoubleTap: onDoubleTap,
      child: Container(
        width: 200.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(padding: EdgeInsets.all(8.0), child: Text(node.content)),
      ),
    );
  }
}
