import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class settp extends StatelessWidget {
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Settings Section
            
            
            
            // Notifications Settings Section
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification Settings"),
              subtitle: Text("Manage your notification preferences."),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to notification settings
              },
            ),
            Divider(),
            
            // Language Settings Section
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Language Settings"),
              subtitle: Text("Change your app's language."),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Action for language settings
              },
            ),
            
            
            
            Divider(),
            
            // Logout Section
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              subtitle: Text("Sign out of your account."),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
               Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}