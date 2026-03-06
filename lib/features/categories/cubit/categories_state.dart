<<<<<<< HEAD
// sealed class CategoriesState {}

// final class CategoriesInitial extends CategoriesState {}

// final class CategoriesLoaded extends CategoriesState {
//   final List<Map<String, String>> categories;

//   CategoriesLoaded(this.categories);
// }

// class CategoriesState {
//   final List<Map<String, String>> categories;
//   final String categoryName;
//   final String selectedIcon;
//   final bool isLoading;

//   const CategoriesState({
//     this.categories = const [],
//     this.categoryName = '',
//     this.selectedIcon = '🍔',
//     this.isLoading = false,
//   });

//   CategoriesState copyWith({
//     List<Map<String, String>>? categories,
//     String? categoryName,
//     String? selectedIcon,
//     bool? isLoading,
//   }) {
//     return CategoriesState(
//       categories: categories ?? this.categories,
//       categoryName: categoryName ?? this.categoryName,
//       selectedIcon: selectedIcon ?? this.selectedIcon,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }

// lib/features/categories/cubit/categories_state.dart

// sealed class CategoriesState {}

// final class CategoriesInitial extends CategoriesState {}

// final class CategoriesLoaded extends CategoriesState {
//   final List<Map<String, String>> categories;
//   final String currentName;
//   final String selectedIcon;

//   CategoriesLoaded({
//     required this.categories,
//     this.currentName = '',
//     this.selectedIcon = '🍔',
//   });

//   CategoriesLoaded copyWith({
//     List<Map<String, String>>? categories,
//     String? currentName,
//     String? selectedIcon,
//   }) {
//     return CategoriesLoaded(
//       categories: categories ?? this.categories,
//       currentName: currentName ?? this.currentName,
//       selectedIcon: selectedIcon ?? this.selectedIcon,
//     );
//   }
// }

=======
>>>>>>> budget_states
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<Map<String, String>> categories;

  CategoriesLoaded(this.categories);
<<<<<<< HEAD
}
=======
}
>>>>>>> budget_states
