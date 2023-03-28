import 'package:cubing_timer/components/graph_components/no_graph_widget.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: const NoGraphDisplay(),
          ),
          const SizedBox(height: 50),

          /// TODO:
          /// Replace below with Listview.builder -> display individual solves with slidable widget
          /// slide on side to delete
          const Text('No Solve Times Yet'),
        ],
      ),
    );
  }
}
