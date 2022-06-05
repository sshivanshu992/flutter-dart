import 'package:drawers_application/services/speaker_service.dart';
import 'package:drawers_application/widgets/speaker_details.dart';
import 'package:flutter/material.dart';

class ListViewBuilderdDemo extends StatelessWidget {
  ListViewBuilderdDemo({Key? key}) : super(key: key);

  final speakers = SpeakerService().getSpeakers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder'),
      ),
      body: ListView.builder(
          itemCount: speakers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(speakers[index].imageUrl),
                  ),
                  title: Text(speakers[index].topic),
                  subtitle: Text(speakers[index].speakerName),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SpeakerDetails.routeName,
                      arguments: speakers[index],
                    );
                  },
                ),
              ),
            );
          },
        ),
    );
  }
}
