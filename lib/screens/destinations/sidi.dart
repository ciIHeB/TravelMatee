import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azer/favorites_provider.dart';

class sidipage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFavorite = favoritesProvider.isFavorite("sidi");
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Text(
              "Detail Destination",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              favoritesProvider.toggleFavorite(
                Destination(
                  name: "sidi",
                  imagePath: 'assets/Sidi.jpg',
                  description: "Luxurious stays in the heart of Sidi.",
                  route: '/sidi',
                ),
              );
            },
            icon: Icon(
              favoritesProvider.isFavorite("sidi")
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoritesProvider.isFavorite("sidi")
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Sidi.jpg',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Blue and White Haven",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "\$299 /night",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                      Text("Sidi Bou Said, Tunis"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(" 4.8 • 2,145 reviews"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.wifi, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Free WiFi"),
                      SizedBox(width: 20),
                      Icon(Icons.pool, color: Colors.blue),
                      SizedBox(width: 10),
                      Text("Pool"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Experience the magic of Sidi Bou Said with charming accommodations, stunning Mediterranean views, and authentic local cuisine. Unwind in serene surroundings or explore the village’s vibrant culture—your ideal getaway awaits.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/booking');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4F58FD), Color(0xFF149BF3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "Book Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}