import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/show_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg2_26/Controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';

class Showpage extends StatelessWidget {
  final VoidCallback? onNavigateToFavorites;
  
  Showpage({super.key, this.onNavigateToFavorites});
  final ShowController showController = Get.put(ShowController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TV Shows',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryRed,
        elevation: 0,
        actions: [
          Obx(() => Container(
            margin: EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '${favoriteController.favoriteShows.length} ♥',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Obx(() {
            if (showController.isLoading.value && showController.tableShows.isEmpty) {
            // Show loading indicator when first loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              // Call the fetch function when user pulls to refresh
              showController.fetchTableShows();
            },
            child: ListView.builder(
              itemCount: showController.tableShows.length,
              itemBuilder: (context, index) {
                final shows = showController.tableShows[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 60,
                            height: 80,
                            child: (shows.image.medium.isNotEmpty) 
                              ? Image.network(
                                  shows.image.medium,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: AppColors.goldBrownLight,
                                      child: Icon(Icons.tv, color: AppColors.warmBrownDark),
                                    );
                                  },
                                )
                              : Container(
                                  color: AppColors.goldBrownLight,
                                  child: Icon(Icons.tv, color: AppColors.warmBrownDark),
                                ),
                          ),
                        ),
                        
                        Container(margin: EdgeInsets.only(left: 12)),
                        
                        // Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shows.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.warmBrownDark,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(margin: EdgeInsets.only(top: 4)),
                              Text(
                                "${shows.language.name.toLowerCase().replaceAll('_', ' ')}",
                                style: TextStyle(
                                  color: AppColors.warmBrown,
                                  fontSize: 12,
                                ),
                              ),
                              Container(margin: EdgeInsets.only(top: 4)),
                              Text(
                                shows.genres.map((g) => g.name.replaceAll('_', ' ').toLowerCase()).take(2).join(', '),
                                style: TextStyle(
                                  color: AppColors.goldBrown,
                                  fontSize: 11,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(margin: EdgeInsets.only(top: 8)),
                              Row(
                                children: [
                                  // Rating
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.star, size: 12, color: Colors.white),
                                        Container(margin: EdgeInsets.only(left: 2)),
                                        Text(
                                          shows.rating.average?.toStringAsFixed(1) ?? 'N/A',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        
                        // Favorite Button
                        Obx(() => Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                print('❤️ Love button tapped!');
                                favoriteController.toggleFavorite(shows);
                                
                                Get.snackbar(
                                  'Favorites',
                                  favoriteController.isFavorite(shows) 
                                    ? '${shows.name} added to favorites!' 
                                    : '${shows.name} removed from favorites',
                                  duration: Duration(seconds: 2),
                                );
                                
                                // Navigate if added
                                if (favoriteController.isFavorite(shows)) {
                                  Future.delayed(Duration(milliseconds: 1000), () {
                                    try {
                                      Get.find<DashboardController>().selectedIndex.value = 1;
                                    } catch (e) {
                                      print('Navigation error: $e');
                                    }
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: favoriteController.isFavorite(shows)
                                    ? AppColors.primaryRed.withOpacity(0.1)
                                    : AppColors.warmBrown.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  favoriteController.isFavorite(shows)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                  color: favoriteController.isFavorite(shows)
                                    ? AppColors.primaryRed
                                    : AppColors.warmBrown,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        })
      ),
    );
  }
  
}
