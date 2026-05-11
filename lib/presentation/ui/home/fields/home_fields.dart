import 'package:flutter/widgets.dart';

class HomeFields {
  final TextEditingController searchController;

  HomeFields() : searchController = TextEditingController();

  void dispose() {
    searchController.dispose();
  }
}
