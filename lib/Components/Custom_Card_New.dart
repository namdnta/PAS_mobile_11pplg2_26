import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';

class ShowCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String language;
  final List<dynamic> genres;
  final double? rating;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback? onTap;

  const ShowCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.language,
    required this.genres,
    this.rating,
    required this.isFavorite,
    required this.onFavoritePressed,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
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
                // Image Section
                Hero(
                  tag: 'show_image_$title',
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
                        imageUrl,
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
                
                SizedBox(width: 16),
                
                // Content Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
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
                          language,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.warmBrownDark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 8),
                      
                      // Genres
                      if (genres.isNotEmpty)
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: genres.take(3).map((genre) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.softCream.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: AppColors.goldBrown.withOpacity(0.3),
                                  width: 0.5,
                                ),
                              ),
                              child: Text(
                                genre.toString().split('.').last,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.warmBrown,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      
                      SizedBox(height: 12),
                      
                      // Rating and Favorite
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Rating
                          if (rating != null)
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
                                    rating.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.warmBrownDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          
                          // Favorite Button
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onFavoritePressed,
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isFavorite 
                                    ? AppColors.primaryRed.withOpacity(0.1)
                                    : AppColors.warmBrown.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? AppColors.primaryRed : AppColors.warmBrown,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyStateWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                icon,
                size: 64,
                color: AppColors.warmBrown,
              ),
            ),
            
            SizedBox(height: 24),
            
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.warmBrownDark,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 12),
            
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.warmBrown,
              ),
              textAlign: TextAlign.center,
            ),
            
            if (buttonText != null && onButtonPressed != null) ...[
              SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onButtonPressed,
                icon: Icon(Icons.refresh),
                label: Text(buttonText!),
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
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  final String message;
  
  const LoadingWidget({
    Key? key,
    this.message = 'Loading...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
            strokeWidth: 3,
          ),
          SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              color: AppColors.warmBrownDark,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}