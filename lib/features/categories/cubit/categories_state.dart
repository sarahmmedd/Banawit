sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<Map<String, String>> categories;

  CategoriesLoaded(this.categories);
}