import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded data
    final fullName = "Nandita Meddina";
    final username = "nanditameddina";
    final email = "nandita.meddina@student.id";
    final memberSince = "November 2024";
    final favoritesCount = 12; // Hardcode
    final avatarUrl =
        "https://ui-avatars.com/api/?name=Nandita+Meddina&background=D34E4E&color=fff&size=200&font-size=0.6";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryRed,
        elevation: 0,
        centerTitle: true,
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
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                // PROFILE HEADER CARD
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          AppColors.softCreamLight.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        // AVATAR
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor:
                                    AppColors.primaryRed.withOpacity(0.2),
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundImage: NetworkImage(avatarUrl),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColors.goldBrown,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: Icon(
                                    Icons.verified,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // NAME
                        Text(
                          fullName,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.warmBrownDark,
                          ),
                        ),
                        SizedBox(height: 8),

                        // USERNAME
                        Text(
                          "@$username",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.warmBrown,
                          ),
                        ),

                        SizedBox(height: 20),

                        // STATS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatItem(
                              "Favorites",
                              "$favoritesCount",
                              Icons.favorite,
                              AppColors.primaryRed,
                            ),
                            Container(
                              height: 40,
                              width: 1,
                              color: AppColors.goldBrown.withOpacity(0.3),
                            ),
                            _buildStatItem(
                              "Member Since",
                              memberSince.split(" ")[0] + " 2024",
                              Icons.calendar_today,
                              AppColors.goldBrown,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // PERSONAL INFO CARD
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          AppColors.softCreamLight.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.warmBrownDark,
                          ),
                        ),
                        SizedBox(height: 20),

                        _buildInfoRow(Icons.person, 'Full Name', fullName),
                        _buildInfoRow(Icons.email, 'Email Address', email),
                        _buildInfoRow(Icons.account_circle, 'Username', username),
                        _buildInfoRow(
                            Icons.calendar_today, 'Member Since', memberSince),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // APP INFO CARD
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.goldBrown.withOpacity(0.1),
                          AppColors.softCreamLight.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.tv,
                          size: 40,
                          color: AppColors.primaryRed,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Next Show!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryRed,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'TV Shows Explorer App',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.warmBrown,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'XI PPLG 2 - Mobile Development\nFlutter & GetX State Management',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.warmBrown.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // LOGOUT BUTTON (dummy)
                Container(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Hardcode logout (no controller)
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Text(
                            "Logout?",
                            style: TextStyle(color: AppColors.primaryRed),
                          ),
                          content: Text("This is a hardcoded demo logout."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Logged out (hardcoded fake).")),
                                );
                              },
                              child: Text("Logout"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryRed,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    icon: Icon(Icons.logout, color: Colors.white),
                    label: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.warmBrownDark,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.warmBrown,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryRed.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primaryRed, size: 20),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.warmBrown,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.warmBrownDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
