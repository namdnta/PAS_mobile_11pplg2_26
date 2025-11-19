import 'dart:convert';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Models/table_shows_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  var favoriteShows = <Tableshows>[].obs;
  final String _favoritesKey = 'favorite_shows';

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  // Load favorites from SharedPreferences
  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];
      
      final List<Tableshows> loadedFavorites = favoritesJson
          .map((json) => Tableshows.fromJson(jsonDecode(json)))
          .toList();
      
      favoriteShows.assignAll(loadedFavorites);
      print('✅ Loaded ${loadedFavorites.length} favorites');
    } catch (e) {
      print('❌ Error loading favorites: $e');
    }
  }

  // Save favorites to SharedPreferences
  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = favoriteShows
          .map((show) => jsonEncode(show.toJson()))
          .toList();
      
      await prefs.setStringList(_favoritesKey, favoritesJson);
    } catch (e) {
      print('❌ Error saving favorites: $e');
    }
  }

  // Check if a show is favorited
  bool isFavorite(Tableshows show) {
    return favoriteShows.any((favorite) => favorite.id == show.id);
  }

  // Toggle favorite status
  void toggleFavorite(Tableshows show) {
    if (isFavorite(show)) {
      removeFavorite(show);
    } else {
      addFavorite(show);
    }
  }

  // Add show to favorites
  void addFavorite(Tableshows show) {
    if (!isFavorite(show)) {
      favoriteShows.add(show);
      _saveFavorites();
      print('❤️ Added ${show.name} to favorites');
    }
  }

  // Remove show from favorites
  void removeFavorite(Tableshows show) {
    favoriteShows.removeWhere((favorite) => favorite.id == show.id);
    _saveFavorites();
    Get.snackbar(
      'Removed ♥',
      '${show.name} removed from favorites',
      duration: Duration(seconds: 2),
    );
    print('💔 Removed ${show.name} from favorites');
  }

  // Clear all favorites
  void clearAllFavorites() {
    favoriteShows.clear();
    _saveFavorites();
    Get.snackbar(
      'Cleared',
      'All favorites have been removed',
      duration: Duration(seconds: 2),
    );
    print('🗑️ Cleared all favorites');
  }
}