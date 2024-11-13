import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/presentation/presentation_chest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catbreeds',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: _HomeView(),
        ),
      ),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

TextEditingController _searchController = TextEditingController();
String _searchQuery = '';

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(breedsCatsProvider.notifier).loadBreedsCats();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final breedsCats = ref.watch(breedsCatsProvider);
    final filteredCats = breedsCats.where((cat) {
      return cat.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return (breedsCats.isEmpty)
        ? const FullScreenLoader()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomSearchWidget(
                    searchController: _searchController,
                    label: 'Filter by breed'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCats.length,
                  itemBuilder: (context, index) {
                    final breedCat = filteredCats[index];
                    return FadeInRight(
                        child: CustomCardCatWidget(breedCat: breedCat));
                  },
                ),
              ),
            ],
          );
  }
}
