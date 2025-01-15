import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:torrent_cl/presentation/screens/tracker_list/list_item.dart';

@RoutePage()
class TrackerListScreen extends StatelessWidget {
  const TrackerListScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          itemBuilder: (context, index) =>
            TrackerListItem(i: index),
          separatorBuilder: (context, index) =>
            SizedBox(height: 1),
          itemCount: 10,
        ); 
  }
  
}