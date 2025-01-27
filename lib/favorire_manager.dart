class FavoriteManager {
  static final List<Map<String, String>> _favorites = [];

  static void addToFavorites(String name, String imageUrl) {
    _favorites.add({'name': name, 'imageUrl': imageUrl});
  }

  static List<Map<String, String>> getFavorites() {
    return _favorites;
  }
}
