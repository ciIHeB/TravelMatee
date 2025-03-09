import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:TravelMate/favorites_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class sidipage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFavorite = favoritesProvider.isFavorite("sidi");
    double screenWidth = MediaQuery.of(context).size.width;
    final List<String> imageList = [
      'assets/Sidi.jpg',
      'assets/sidi2.jpeg',
      'assets/sidi3.jpg',
    ];

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
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: imageList.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
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
                        "\90dt /night",
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
                      SizedBox(width: 5),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("destinations")
                            .doc("sidi")
                            .collection("reviews")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading reviews...");
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Text("No reviews yet.");
                          }

                          // Calculate average rating and total reviews
                          double totalRating = 0;
                          int totalReviews = snapshot.data!.docs.length;

                          for (var doc in snapshot.data!.docs) {
                            final review = doc.data() as Map<String, dynamic>;
                            final rating =
                                review["rating"] ?? 0; // Handle null values
                            totalRating +=
                                rating.toDouble(); // Ensure numeric type
                          }

                          double averageRating = totalReviews > 0
                              ? totalRating / totalReviews
                              : 0; // Prevent division by zero

                          return Text(
                            "${averageRating.toStringAsFixed(1)} • $totalReviews reviews",
                            style: TextStyle(fontSize: 16),
                          );
                        },
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          _showReviewsDialog(context);
                        },
                        child: Text(
                          "View Reviews",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
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
                  Navigator.pushNamed(context, '/booking', arguments: {'basePrice': 90.0}, );
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

  // Method to show reviews dialog
  void _showReviewsDialog(BuildContext context) {
    TextEditingController _reviewController = TextEditingController();
    int _rating = 0;
    String? _existingReviewId;
    String? _existingComment;
    int? _existingRating;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Reviews"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Display existing reviews
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("destinations")
                      .doc("sidi")
                      .collection("reviews")
                      .orderBy("timestamp", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Text("No reviews yet.");
                    }
                    return Column(
                      children: snapshot.data!.docs.map((doc) {
                        final review = doc.data() as Map<String, dynamic>;
                        return _buildReviewItem(
                          review["userName"],
                          review["rating"],
                          review["comment"],
                          onEdit: () {
                            // Pre-fill the form with existing review
                            _existingReviewId = doc.id;
                            _existingComment = review["comment"];
                            _existingRating = review["rating"];
                            _reviewController.text = _existingComment!;
                            _rating = _existingRating!;
                          },
                          onDelete: () async {
                            await FirebaseFirestore.instance
                                .collection("destinations")
                                .doc("sidi")
                                .collection("reviews")
                                .doc(doc.id)
                                .delete();
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
                Divider(),
                // Add/edit review
                FutureBuilder<bool>(
                  future: _hasUserReviewed(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Column(
                      children: [
                        if (_existingReviewId != null)
                          Text("Editing your existing review"),
                        Text("Add your review:"),
                        SizedBox(height: 10),
                        TextField(
                          controller: _reviewController,
                          decoration: InputDecoration(
                            hintText: "Write your review...",
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                        SizedBox(height: 10),
                        Text("Rate your experience:"),
                        StarRating(
                          initialRating: _existingRating ?? 0,
                          onRatingChanged: (rating) {
                            _rating = rating;
                          },
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            final User? user =
                                FirebaseAuth.instance.currentUser;
                            if (user == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("You must be logged in!")),
                              );
                              return;
                            }

                            // Delete old review if editing
                            if (_existingReviewId != null) {
                              await FirebaseFirestore.instance
                                  .collection("destinations")
                                  .doc("sidi")
                                  .collection("reviews")
                                  .doc(_existingReviewId)
                                  .delete();
                            }

                            // Submit new review
                            DocumentSnapshot userDoc = await FirebaseFirestore
                                .instance
                                .collection("profile")
                                .doc(user.uid)
                                .get();

                            String userName =
                                userDoc.get("name") ?? "Anonymous";

                            await FirebaseFirestore.instance
                                .collection("destinations")
                                .doc("sidi")
                                .collection("reviews")
                                .doc(user.uid)
                                .set({
                              "userId": user.uid,
                              "userName": userName,
                              "rating": _rating,
                              "comment": _reviewController.text,
                              "timestamp": DateTime.now(),
                            });

                            Navigator.pop(context);
                          },
                          child: Text(_existingReviewId != null
                              ? "Update Review"
                              : "Submit Review"),
                        ),
                        if (_existingReviewId != null)
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel"),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper method to check if the user has already reviewed
  Future<bool> _hasUserReviewed() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    DocumentSnapshot reviewDoc = await FirebaseFirestore.instance
        .collection("destinations")
        .doc("sidi")
        .collection("reviews")
        .doc(user.uid)
        .get();

    return reviewDoc.exists;
  }

  // Helper method to build a review item
  Widget _buildReviewItem(
    String userName,
    int rating,
    String comment, {
    VoidCallback? onEdit,
    VoidCallback? onDelete,
  }) {
    final User? user = FirebaseAuth.instance.currentUser;
    final bool isCurrentUserReview =
        user != null && userName == (user.displayName ?? "Anonymous");

    return ListTile(
      leading: CircleAvatar(child: Text(userName[0])),
      title: Text(userName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
                5,
                (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    )),
          ),
          Text(comment),
        ],
      ),
      trailing: isCurrentUserReview
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            )
          : null,
    );
  }
}

// StarRating widget
class StarRating extends StatefulWidget {
  final Function(int) onRatingChanged;
  final int initialRating;

  StarRating({
    required this.onRatingChanged,
    this.initialRating = 0,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() => _rating = index + 1);
            widget.onRatingChanged(_rating);
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30,
          ),
        );
      }),
    );
  }
}
