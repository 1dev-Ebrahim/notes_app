import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/search_cubit/search_State.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(InitialSearchState());
  // String searchText = '';
  changeSearchText(String chanegedText) {
    emit(SearchTextChangedState(searchText: chanegedText));
  }
}
