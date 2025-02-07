import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azer/favorites_provider.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var favoritesProvider = Provider.of<FavoritesProvider>(context);

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
              "Favorites",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: favoritesProvider.favorites.isEmpty
            ? Center(
                child: Text(
                  'No favorites added yet!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              )
            : ListView.builder(
                itemCount: favoritesProvider.favorites.length,
                itemBuilder: (context, index) {
                  final destination = favoritesProvider.favorites[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, destination.route);
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            destination.imagePath,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.image_not_supported, size: 70, color: Colors.grey),
                          ),
                        ),
                        title: Text(
                          destination.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () async {
                            await favoritesProvider.toggleFavorite(destination);
                          },
                        ),
                      ),
                      Divider(thickness: 1),
                    ],
                  );
                },
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 52, 27, 97),
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/search');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
          BottomNavigationBarItem(
            icon: Image.asset('assets/avv.png', width: 24, height: 24),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}