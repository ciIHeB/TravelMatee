import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _allDestinations = [
    {
      'imagePath': 'assets/bali.jpg',
      'title': 'Bali, Indonesia',
      'subtitle':
          'Experience the perfect blend of beaches, culture, and spirituality in this tropical paradise.',
      'route': '/bali',
    },
    {
      'imagePath': 'assets/Sidi.jpg',
      'title': 'Sidi Bousaid, Tunisia',
      'subtitle':
          'Discover Sidi Bou Said with stunning views, local charm, and authentic cuisine. Relax or explore—the perfect escape awaits.',
      'route': '/sidi',
    },
    {
      'imagePath': 'assets/paris.jpg',
      'title': 'Paris, France',
      'subtitle':
          'Experience Paris with elegant stays, iconic views, and exquisite cuisine. Relax or explore—the city of lights awaits.',
      'route': '/paris',
    },
    {
      'imagePath': 'assets/istunbul.jpg',
      'title': 'Istanbul, Turkey',
      'subtitle':
          'Experience Istanbul with luxurious stays, breathtaking views, and rich culture. Relax or explore—an unforgettable adventure awaits.',
      'route': '/destination_details',
    },
  ];
  List<Map<String, String>> _filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    _filteredDestinations = _allDestinations; // Initialize with all destinations
    _searchController.addListener(_onSearchChanged); // Listen for search input
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredDestinations = _allDestinations
          .where((destination) =>
              destination['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo
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
            // "Search" Text
            Text(
              "Search",
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
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for destinations, hotels, or attractions...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
            ),
            SizedBox(height: 20),
            // Search Results Section
            Expanded(
              child: ListView(
                children: _filteredDestinations
                    .map((destination) => _buildDestinationTile(
                          context,
                          imagePath: destination['imagePath']!,
                          title: destination['title']!,
                          subtitle: destination['subtitle']!,
                          route: destination['route']!,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 52, 27, 97),
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/fav');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Fav"),
          BottomNavigationBarItem(
            icon: Image.asset('assets/avv.png', width: 24, height: 24),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // Helper method to build a destination tile
  Widget _buildDestinationTile(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
    required String route,
  }) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}