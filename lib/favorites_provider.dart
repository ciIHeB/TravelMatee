import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Destination {
  final String name;
  final String imagePath;
  final String description;
  final String route;

  Destination({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.route,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imagePath': imagePath,
      'description': description,
      'route': route,
    };
  }

  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
      description: map['description'] ?? '',
      route: map['route'] ?? '',
    );
  }
}

class FavoritesProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Destination> _favorites = [];
  StreamSubscription<QuerySnapshot>? _subscription;
  StreamSubscription<User?>? _authSubscription;

  FavoritesProvider() {
    // Listen for authentication state changes
    _authSubscription = _auth.authStateChanges().listen((user) {
      _setupFirestoreListener();
    });
  }

  List<Destination> get favorites => List.unmodifiable(_favorites);

  String get userId => _auth.currentUser?.uid ?? "guest";

  void _setupFirestoreListener() {
    // Cancel the previous subscription if it exists
    _subscription?.cancel();

    if (_auth.currentUser != null) {
      _subscription = _firestore
          .collection('profile')
          .doc(userId)
          .collection('favorites')
          .snapshots()
          .listen((snapshot) {
        _favorites = snapshot.docs
            .map((doc) => Destination.fromMap(doc.data()))
            .toList();
        notifyListeners();
      }, onError: (error) {
        print("❌ Firestore Listener Error: $error");
      });
    }
  }

  Future<void> toggleFavorite(Destination destination) async {
    try {
      var favRef = _firestore
          .collection('profile')
          .doc(userId)
          .collection('favorites')
          .doc(destination.name);

      if (isFavorite(destination.name)) {
        await favRef.delete();
      } else {
        await favRef.set(destination.toMap());
      }
    } catch (e) {
      print("❌ Error toggling favorite: $e");
    }
  }

  bool isFavorite(String name) {
    return _favorites.any((dest) => dest.name == name);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _authSubscription?.cancel();
    super.dispose();
  }
}
