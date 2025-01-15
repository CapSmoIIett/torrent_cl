import 'package:flutter/material.dart';

class TrackerListItem extends StatelessWidget{
  final int i;

  const TrackerListItem ({required  this.i, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration (
        color:  Colors.deepPurple,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: [
          Icon(Icons.file_download_done, size:25),
          SizedBox(width: 25),
          Text('Item $i'),
        ],
      ),
    );
  }
}