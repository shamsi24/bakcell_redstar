import 'package:flutter/widgets.dart';

class PartnersFields {
  final TextEditingController searchController;
  final ScrollController scrollController;

  PartnersFields()
      : searchController = TextEditingController(),
        scrollController = ScrollController();

  void dispose() {
    searchController.dispose();
    scrollController.dispose();
  }
}
