import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_26/Models/table_shows_models.dart';

class ShowController extends GetxController {
  var isLoading = false.obs;
  var tableShows = <Tableshows>[].obs; 

  @override
  void onInit() {
    super.onInit();
    fetchTableShows();
  }

  Future<void> fetchTableShows() async {
    const url = 'https://api.tvmaze.com/shows';
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      print("status code: ${response.statusCode}");
      print("JSON code: ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Tableshows> loadedShows = data.map((e) => Tableshows.fromJson(e)).toList();
        tableShows.assignAll(loadedShows);
      }else {
        Get.snackbar("Error", "Failed to load shows");
      }
      
    }catch (e) {
      Get.snackbar("error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}