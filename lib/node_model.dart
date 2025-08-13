enum NodeType { thought, source }

class CanvasNode {
  final String id;
  final String content;
  final double x;
  final double y;
  final NodeType nodeType;

  CanvasNode({
    required this.id,
    required this.content,
    required this.x,
    required this.y,
    required this.nodeType,
  });
}
