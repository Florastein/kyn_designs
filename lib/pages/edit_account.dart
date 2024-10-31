import 'package:flutter/material.dart';

class EditAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the edited details
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
