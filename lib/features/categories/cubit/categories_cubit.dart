import 'package:banawit/features/categories/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial()) {
    loadCategories();
  }

  /// DEFAULT CATEGORIES
  final List<Map<String, String>> _defaultCategories = [
    {"title": "Food", "emoji": "🍔"},
    {"title": "Transport", "emoji": "🚗"},
    {"title": "Shopping", "emoji": "🛍"},
    {"title": "Entertainment", "emoji": "🎬"},
    {"title": "Health", "emoji": "🏥"},
    {"title": "Bills", "emoji": "💰"},
  ];

  final List<Map<String, String>> _categories = [];

  /// LOAD
  Future<void> loadCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCategories = prefs.getStringList('categories');

    if (savedCategories != null && savedCategories.isNotEmpty) {
      _categories.clear();

      _categories.addAll(
        savedCategories.map((catJson) {
          Map<String, dynamic> map = jsonDecode(catJson);

          return {
            "title": map['title'].toString(),
            "emoji": map['emoji'].toString(),
          };
        }).toList(),
      );
    } else {
      _categories.clear();
      _categories.addAll(_defaultCategories);
    }

    emit(CategoriesLoaded(List.from(_categories)));
  }

  /// SAVE
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

  /// CLEAR DATA (ترجع للديفولت)
  Future<void> clearCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('categories');

    _categories.clear();
    _categories.addAll(_defaultCategories);

    emit(CategoriesLoaded(List.from(_categories)));
  }
}