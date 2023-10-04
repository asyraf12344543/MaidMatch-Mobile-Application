import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final roomsController = TextEditingController();
  final requestsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('MaidMatch'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Create a form for user input
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      labelText: 'Date (MM/DD/YYYY)',
                    ),
                  ),
                  TextFormField(
                    controller: timeController,
                    decoration: InputDecoration(
                      labelText: 'Time (HH:MM)',
                    ),
                  ),
                  TextFormField(
                    controller: roomsController,
                    decoration: InputDecoration(
                      labelText: 'Number of Rooms',
                    ),
                  ),
                  TextFormField(
                    controller: requestsController,
                    decoration: InputDecoration(
                      labelText: 'Special Requests',
                    ),
                  ),
                ],
              ),
            ),
            // Add a submit button
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                // Validate user input
                // Send booking information to database or API
                // Show confirmation message
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}