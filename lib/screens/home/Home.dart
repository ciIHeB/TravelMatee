import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageStatefulState createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  @override
  void initState() 
  {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() 
  {
    try 
    {
      final user = _auth.currentUser;
      if (user != null) 
      {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/llogo.png',
              width: screenWidth * 0.1,
              height: screenWidth * 0.1,
            ),
            SizedBox(width: 10),
            Text(
              "travelmate ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.pushNamed(context, '/notp');
            },
          ),
        ],
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Popular Destinations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildDestinationCard(
                  context,
                  "Bali, Indonesia",
                  'assets/bali.jpg',
                  "/bali",
                  "Experience the perfect blend of beaches, culture, and spirituality in this tropical paradise."),
              buildDestinationCard(
                  context,
                  "Sidi Bou Said, Tunis",
                  'assets/Sidi.jpg',
                  "/sidi",
                  "Discover Sidi Bou Said with stunning views, local charm, and authentic cuisine. Relax or explore—the perfect escape awaits."),
              buildDestinationCard(
                  context,
                  "Paris, France",
                  'assets/paris.jpg',
                  "/paris",
                  "Experience Paris with elegant stays, iconic views, and exquisite cuisine. Relax or explore—the city of lights awaits."),
              buildDestinationCard(
                  context,
                  "Istanbul, Turkey",
                  'assets/istunbul.jpg',
                  "/destination_details",
                  "Experience Istanbul with luxurious stays, breathtaking views, and rich culture. Relax or explore—an unforgettable adventure awaits."),
                   buildDestinationCard(
                  context,
                  "Barcelone, Spain",
                  'assets/spain.jpg',
                  "/spain",
                  "Relax in a stunning seaside resort in Barcelona. Enjoy sun-soaked beaches, vibrant nightlife, and world-class cuisine in the heart of Spain."),
            
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 52, 27, 97),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/fav');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/search');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
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

  Widget buildDestinationCard(BuildContext context, String title,
      String imagePath, String route, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
          arguments: {
            "title": title,
            "image": imagePath,
            "description": description
          },
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Image.asset(imagePath,
                width: double.infinity, height: 150, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
