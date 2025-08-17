import 'package:pkm_os/node_model.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class CanvasStorageService {
  Future<void> saveState(List<CanvasNode> nodes) async {
    final directory = await getApplicationDocumentsDirectory();

    final nodesAsMaps = nodes.map((node) => node.toJson()).toList();
  }

  Future<List<CanvasNode>> loadState() {}
}
