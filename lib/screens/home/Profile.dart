import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home'); // Navigate to /home route
              },
              child: Image.asset(
                'assets/llogo.png',
                width: screenWidth * 0.1, // Adjust logo size
                height: screenWidth * 0.1,
              ),
            ),
            SizedBox(width: 10), // Space between logo and text
            // "Profile" Text
            Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50, // Adjust the size of the circle
                    backgroundImage: AssetImage('assets/avv.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Chaaouri iheb',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'chaaouriiheb@Gmail.com',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 51, 50, 50),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/edit');
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4F58FD), Color(0xFF149BF3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit, // Icon for the button
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8), // Space between icon and text
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                
                        
                      
                    
                
                ],
              ),
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
              onTap: () {
                Navigator.pushNamed(context, '/sidi');
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners
                child: Image.asset(
                  'assets/Sidi.jpg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Sidi bousaid, Tunis'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Visited March 2024'),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(
                            4,
                            (index) => Icon(Icons.star,
                                color: Colors.amber, size: 16)) +
                        List.generate(
                            1,
                            (index) => Icon(Icons.star_border,
                                color: Colors.grey, size: 16)),
                  ),
                ],
              ),
            ),
            Divider(),
             ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/isatnbul');
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners
                child: Image.asset(
                  'assets/istunbul.jpg',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text('Istanbul, Turkey'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Visited March 2024'),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(
                            4,
                            (index) => Icon(Icons.star,
                                color: Colors.amber, size: 16)) +
                        List.generate(
                            1,
                            (index) => Icon(Icons.star_border,
                                color: Colors.grey, size: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 52, 27, 97),
        unselectedItemColor: Colors.grey,
        currentIndex: 3, // Set "Profile" as active
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, "/home");
          } else if (index == 1) {
            Navigator.pushNamed(context, '/search');
          } else if (index == 2) {
            Navigator.pushNamed(context, "/fav");
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Fav"),
          BottomNavigationBarItem(
            icon: Image.asset('assets/avv.png', width: 24, height: 24),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
