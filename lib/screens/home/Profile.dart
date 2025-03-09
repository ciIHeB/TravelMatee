import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _name = "Loading...";
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
    _loadProfileImage();
  }

  // Fetch user profile data
  Future<void> _fetchUserProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('profile').doc(user.uid).get();
      if (userDoc.exists) {
        setState(() {
          _name = userDoc['name'] ?? 'No Name';
        });
      }
    }
  }

  // Load profile image from local storage
  Future<void> _loadProfileImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final localImagePath = '${directory.path}/profile_pic.png';
    final file = File(localImagePath);

    if (await file.exists()) {
      setState(() {
        _profileImage = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Image.asset(
                'assets/llogo.png',
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
              ),
            ),
            SizedBox(width: 10),
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
        backgroundColor: Colors.white,
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
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('assets/avv.png') as ImageProvider,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 10),
                  FutureBuilder(
                    future: _fetchUserProfile(),
                    builder: (context, snapshot) {
                      return Text(
                        _name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Text(
                    user?.email ?? 'No email found',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/edit');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('profile')
                    .doc(user?.uid)
                    .collection('travelHistory')
                    .orderBy('date', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        'No travel history yet.',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final trip = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                      return _buildTravelHistoryItem(
                        trip['imagePath'],
                        trip['destination'],
                        trip['date'],
                        trip['rating'],
                        trip['route'], // Add route to Firestore data
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 52, 27, 97),
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
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
          BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Fav"),
          BottomNavigationBarItem(
            icon: _profileImage != null
                ? CircleAvatar(backgroundImage: FileImage(_profileImage!), radius: 12)
                : Image.asset('assets/avv.png', width: 24, height: 24),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // Widget to build a travel history item
  Widget _buildTravelHistoryItem(
    String imagePath, 
    String title, 
    String subtitle, 
    int rating,
    String route, // Add route parameter
  ) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, route); // Navigate to the correct route
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle),
          SizedBox(height: 5),
          Row(
            children: List.generate(
              rating, (index) => Icon(Icons.star, color: Colors.amber, size: 16)) +
              List.generate(
                5 - rating, (index) => Icon(Icons.star_border, color: Colors.grey, size: 16)),
          ),
        ],
      ),
    );
  }
}