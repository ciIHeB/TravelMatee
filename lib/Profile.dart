import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false, // Rem
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo
            Image.asset(
              'assets/llogo.png',
              width: screenWidth * 0.09, // Adjust logo size
              height: screenWidth * 0.1,
            ),
            SizedBox(width: 10), // Space between logo and text
            // "TravelMate" Text
            Text(
              " Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
         // Removes the back arrow
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/user_avatar.png'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'm y',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'm.y@email.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Travel History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Image.asset('assets/your_actual_image_name.jpg', width: 70),
              title: Text('Bali, Indonesia'),
              subtitle: Text('Visited March 2025'),
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/your_actual_image_name.jpg', width: 70),
              title: Text('Santorini, Greece'),
              subtitle: Text('Visited January 2025'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, 
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/fav');
          }
        },
        items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star_outlined), label: "Fav "),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile "),
        ],
      ),
 
    );
  }
}
