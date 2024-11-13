import 'package:catbreeds/presentation/presentation_chest.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/cat-screen/:id',
    name: CatScreen.name,
    builder: (context, state) {
      final movieId = state.pathParameters['id'] ?? 'no-id';
      return CatScreen(catId: movieId);
    },
  )
]);
