import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/coffee_repository.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CoffeeRepository _repository;

  CatalogBloc(this._repository) : super(CatalogInitial()) {
    on<FetchCatalogStarted>(_onFetchCatalogStarted);
  }

  Future<void> _onFetchCatalogStarted(
    FetchCatalogStarted event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading()); // Tell UI to spin

    try {
      // Direct call to repository
      final coffees = await _repository.getCoffees();
      emit(CatalogLoaded(coffees)); // Tell UI to show data
    } catch (e) {
      emit(CatalogError(e.toString()));
    }
  }
}
