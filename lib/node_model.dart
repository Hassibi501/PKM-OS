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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "content": content,
      'x': x,
      'y': y,
      "nodeType": nodeType.name,
    };
  }

  factory CanvasNode.fromJson(Map<String, dynamic> json) {
    return CanvasNode(
      id: json["id"],
      content: json["content"],
      x: json['x'],
      y: json['y'],
      nodeType: NodeType.values.byName(json["nodeType"]),
    );
  }
}
