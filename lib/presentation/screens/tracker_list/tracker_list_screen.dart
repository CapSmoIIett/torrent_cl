import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TrackerListScreen extends StatelessWidget {
  const TrackerListScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return buildChild(index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10, );
          },
          itemCount: 10,
        ); 
  }
  
  buildChild(int i){
    return Container(
      decoration: BoxDecoration (
        color:  Colors.deepPurple,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: [
          Icon(Icons.file_download_done, size:25),
          SizedBox(width: 25,),
          Text('Item $i',),
        ],
      ),
    );
  }
}