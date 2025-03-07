import 'package:favourite_app/model/item.dart';
import 'package:favourite_app/provider/favourite_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], search: '', filteredItems: []));

  void addItem() {
    List<Item> item = [
      Item(name: 'Lenovo', favourite: false, id: 1),
      Item(name: 'Apple', favourite: true, id: 2),
      Item(name: 'Samsung', favourite: false, id: 3),
      Item(name: 'HP', favourite: true, id: 4),
      Item(name: 'Acer', favourite: false, id: 5),
      Item(name: 'LG', favourite: true, id: 6),
      Item(name: 'Dell', favourite: true, id: 7),
      Item(name: 'Asus', favourite: false, id: 8),
    ];

    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItem(state.allItems, search));
  }

  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItem(state.allItems, option),
    );
  }

  List<Item> _favouriteItem(List<Item> items, String option) {
    if (option == "All") {
      return items;
    }
    return items.where((item) => item.favourite == true).toList();
  }

  List<Item> _filterItem(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
