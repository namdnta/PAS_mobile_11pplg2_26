import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/show_controller.dart';

class Showpage extends StatelessWidget {
  Showpage({super.key});
  final ShowController showController = Get.put(ShowController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Obx(() {
            if (showController.isLoading.value && showController.Tableshows.isEmpty) {
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
              itemCount: showController.Tableshows.length,
              itemBuilder: (context, index) {
                final shows = showController.Tableshows[index];
                return Card(
                  child: ListTile(
                    title: Text(shows.),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(shows.image as String), 
                      radius: 25
                    ),
                    subtitle: Text(
                      "Language: ${shows.language} | Genre: ${shows.genres} | Country: ${shows.dvdCountry}"
                    ),
                    trailing: Text(shows.rating as String),
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
