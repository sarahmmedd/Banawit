// import 'dart:convert';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'categories_state.dart';

// class CategoriesCubit extends Cubit<CategoriesState> {
//   CategoriesCubit() : super(const CategoriesState()) {
//     loadCategories();
//   }

//   final List<Map<String, String>> _categories = [
//     {"title": "Food", "emoji": "🍔"},
//     {"title": "Transport", "emoji": "🚗"},
//     {"title": "Shopping", "emoji": "🛍️"},
//     {"title": "Entertainment", "emoji": "🎬"},
//     {"title": "Health", "emoji": "🏥"},
//     {"title": "Bills", "emoji": "💰"},
//   ];

//   Future<void> loadCategories() async {
//     emit(state.copyWith(isLoading: true));

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? savedCategories = prefs.getStringList('categories');

//     if (savedCategories != null && savedCategories.isNotEmpty) {
//       _categories.clear();
//       _categories.addAll(savedCategories.map((catJson) {
//         Map<String, dynamic> map = jsonDecode(catJson);
//         return {
//           "title": map['title'].toString(),
//           "emoji": map['emoji'].toString(),
//         };
//       }).toList());
//     }

//     emit(state.copyWith(
//       categories: List.from(_categories),
//       isLoading: false,
//     ));
//   }

//   void onNameChanged(String name) {
//     emit(state.copyWith(categoryName: name));
//   }

//   void onIconSelected(String icon) {
//     emit(state.copyWith(selectedIcon: icon));
//   }

//   Future<void> addCategory() async {
//     if (state.categoryName.trim().isEmpty) return;

//     final newCategory = {
//       "title": state.categoryName,
//       "emoji": state.selectedIcon,
//     };

//     _categories.add(newCategory);

//     emit(state.copyWith(
//       categories: List.from(_categories),
//       categoryName: '',
//       selectedIcon: '🍔',
//     ));

//     await saveCategories();
//   }

//   Future<void> saveCategories() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> categoriesJson =
//         _categories.map((cat) => jsonEncode(cat)).toList();
//     await prefs.setStringList('categories', categoriesJson);
//   }

//   void deleteCategory(int index) {
//     _categories.removeAt(index);
//     emit(state.copyWith(categories: List.from(_categories)));
//     saveCategories();
//   }
// }

// lib/features/categories/cubit/categories_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'categories_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial()) {
    loadCategories();
  }

  final List<Map<String, String>> _categories = [
    {"title": "Food", "emoji": "🍔"},
    {"title": "Transport", "emoji": "🚗"},
    {"title": "Shopping", "emoji": "🛍"},
    {"title": "Entertainment", "emoji": "🎬"},
    {"title": "Health", "emoji": "🏥"},
    {"title": "Bills", "emoji": "💰"},
  ];

  /// LOAD FROM STORAGE
  Future<void> loadCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCategories = prefs.getStringList('categories');

    if (savedCategories != null && savedCategories.isNotEmpty) {
      _categories.clear();

      _categories.addAll(savedCategories.map((catJson) {
        Map<String, dynamic> map = jsonDecode(catJson);

        return {
          "title": map['title'].toString(),
          "emoji": map['emoji'].toString(),
        };
      }).toList());
    }

    emit(CategoriesLoaded(List.from(_categories)));
  }

  /// SAVE TO STORAGE
  Future<void> saveCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> categoriesJson =
        _categories.map((cat) => jsonEncode(cat)).toList();

    await prefs.setStringList('categories', categoriesJson);
  }

  /// ADD
  void addCategory(Map<String, String> category) {
    _categories.add(category);
    emit(CategoriesLoaded(List.from(_categories)));
    saveCategories();
  }

  /// DELETE
  void deleteCategory(int index) {
    _categories.removeAt(index);
    emit(CategoriesLoaded(List.from(_categories)));
    saveCategories();
  }
}