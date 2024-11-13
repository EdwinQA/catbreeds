import 'package:catbreeds/domain/domains_chest.dart';
import 'package:catbreeds/presentation/presentation_chest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final breedsCatsProvider =
    StateNotifierProvider<CatsNotifier, List<Cat>>((ref) {
  final fetchBreedsCats = ref.watch(movieRepositoryProvider).getListBreedsCats;
  return CatsNotifier(fetchBreedsCats: fetchBreedsCats);
});

typedef CatCallBack = Future<List<Cat>> Function();

class CatsNotifier extends StateNotifier<List<Cat>> {
  CatCallBack fetchBreedsCats;

  CatsNotifier({
    required this.fetchBreedsCats,
  }) : super([]);

  Future<void> loadBreedsCats() async {
    final List<Cat> cats = await fetchBreedsCats();

    state = [...state, ...cats];
  }

  // Future<void> loadNextPage() async {}
}
