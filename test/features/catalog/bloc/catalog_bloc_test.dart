import 'package:flutter_coffee_shop_cleanarch/features/catalog/bloc/catalog_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/bloc/catalog_event.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/bloc/catalog_state.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/repository/coffee_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeeRepository extends Mock implements CoffeeRepository {}

void main() {
  late CatalogBloc bloc;
  late MockCoffeeRepository mockRepo;

  setUp(() {
    mockRepo = MockCoffeeRepository();
    bloc = CatalogBloc(mockRepo);
  });

  // Always close the bloc after the test to prevent memory leaks
  tearDown(() => bloc.close());

  test('emits [Loading, Loaded] when FetchCatalogStarted is added', () async {
    // 1. Arrange
    when(() => mockRepo.getCoffees()).thenAnswer((_) async => []);

    // 2. Act - Listen to the stream of states
    // We expect a list of states: [Loading, Loaded]
    final expectedStates = [isA<CatalogLoading>(), isA<CatalogLoaded>()];

    // This checks that the stream emits the exact sequence we expect
    expectLater(bloc.stream, emitsInOrder(expectedStates));

    // 3. Trigger the event
    bloc.add(FetchCatalogStarted());
  });
}
