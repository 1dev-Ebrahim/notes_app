class SearchState {}

class InitialSearchState extends SearchState {}

class SearchTextChangedState extends SearchState {
  SearchTextChangedState({required this.searchText});
  String searchText = '';
}
