import 'package:flutter/material.dart';

class notp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Sample Notification 1
            ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              title: Text("New Offer Available!"),
              subtitle: Text("Check out our latest travel offers for this month."),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Action when tapped (e.g., view offer details)
              },
            ),
            Divider(),
            // Sample Notification 2
            ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              title: Text("New Travel Update"),
              subtitle: Text("Your flight to Bali has been rescheduled. Check the details."),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Action when tapped (e.g., view update details)
              },
            ),
            Divider(),
            // Add more notifications as needed
          ],
        ),
      ),
    );
  }
}