import 'package:flutter/material.dart';
import 'event.dart';

void main() {
  runApp(EventsApp());
}

class EventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Event> events = [
    Event(
      title: 'Event 1',
      description: 'Description 1',
      date: DateTime(2023, 7, 1),
    ),
    Event(
      title: 'Event 2',
      description: 'Description 2',
      date: DateTime(2023, 7, 5),
    ),
    Event(
      title: 'Event 3',
      description: 'Description 3',
      date: DateTime(2023, 7, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = events[index];
          return ListTile(
            title: Text(event.title),
            subtitle: Text(event.description),
            trailing: Text(event.date.toString()),
          );
        },
      ),
    );
  }
}
