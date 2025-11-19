import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';

class Favoritespage extends StatelessWidget {
  const Favoritespage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          'My Favorites (${favoriteController.favoriteShows.length})',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
        backgroundColor: AppColors.primaryRed,
        elevation: 0,
        centerTitle: true,
        actions: [
          Obx(() => favoriteController.favoriteShows.isNotEmpty
            ? IconButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Row(
                        children: [
                          Icon(Icons.delete_forever, color: AppColors.primaryRed),
                          SizedBox(width: 10),
                          Text(
                            'Clear All Favorites?',
                            style: TextStyle(color: AppColors.primaryRed),
                          ),
                        ],
                      ),
                      content: Text(
                        'This will remove all ${favoriteController.favoriteShows.length} shows from your favorites list.',
                        style: TextStyle(color: AppColors.warmBrownDark),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: AppColors.warmBrown),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                            favoriteController.clearAllFavorites();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryRed,
                          ),
                          child: Text(
                            'Clear All',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.clear_all, color: Colors.white),
                tooltip: 'Clear All Favorites',
              )
            : SizedBox.shrink(),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryRed.withOpacity(0.1),
              AppColors.softCreamLight,
            ],
          ),
        ),
        child: Obx(() {
          print('🔄 Favorites page rebuilding with ${favoriteController.favoriteShows.length} items');
          
          if (favoriteController.favoriteShows.isEmpty) {
            return _buildEmptyState();
          }

          return RefreshIndicator(
            onRefresh: () async {
              await favoriteController.loadFavorites();
            },
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: favoriteController.favoriteShows.length,
              itemBuilder: (context, index) {
                final show = favoriteController.favoriteShows[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          AppColors.softCreamLight.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Hero(
                          tag: 'favorite_${show.id}',
                          child: Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                show.image.medium,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          AppColors.goldBrownLight,
                                          AppColors.goldBrown,
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.tv,
                                      color: AppColors.primaryRed,
                                      size: 30,
                                    ),
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.goldBrownLight,
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        
                        // Content
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Text(
                                  show.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.warmBrownDark,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                
                                SizedBox(height: 8),
                                
                                // Language
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.goldBrown.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    show.language.name.toLowerCase().replaceAll('_', ' '),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.warmBrownDark,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                
                                SizedBox(height: 8),
                                
                                // Genres
                                if (show.genres.isNotEmpty)
                                  Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: show.genres.take(3).map((genre) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: AppColors.softCream.withOpacity(0.7),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          genre.name.replaceAll('_', ' ').toLowerCase(),
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.warmBrown,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                
                                SizedBox(height: 12),
                                
                                // Rating and Remove Button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Rating
                                    if (show.rating.average != null)
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.goldBrown.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: AppColors.goldBrown,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              show.rating.average!.toStringAsFixed(1),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.warmBrownDark,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    
                                    // Remove Button
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          print('🗑️ Removing ${show.name} from favorites');
                                          favoriteController.removeFavorite(show);
                                        },
                                        borderRadius: BorderRadius.circular(25),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryRed.withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: AppColors.primaryRed,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.warmBrown.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                size: 64,
                color: AppColors.warmBrown,
              ),
            ),
            
            SizedBox(height: 24),
            
            Text(
              'No Favorites Yet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.warmBrownDark,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 12),
            
            Text(
              'Start adding your favorite TV shows by tapping the ❤️ button on any show card!',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.warmBrown,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 32),
            
            ElevatedButton.icon(
              onPressed: () {
                // Navigate back to shows tab
                final dashboardController = Get.find<DashboardController>();
                dashboardController.selectedIndex.value = 0;
              },
              icon: Icon(Icons.tv),
              label: Text('Browse TV Shows'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryRed,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}