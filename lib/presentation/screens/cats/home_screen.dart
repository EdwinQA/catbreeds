import 'package:catbreeds/domain/entities/cat.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/presentation/presentation_chest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-creen';

  const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           // SliverAppBar que contiene el título y el campo de búsqueda
//           SliverAppBar(
//             title: const Text('Catreeds'),
//             floating:
//                 true, // Esto permite que el AppBar flote y no se oculte completamente
//             pinned: true, // Esto mantiene el AppBar visible cuando colapsa
//             expandedHeight: 150,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Buscar por nombre',
//                         prefixIcon: Icon(Icons.search),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // El contenido que sigue después del AppBar
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   child: Card(
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     elevation: 8,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 10),
//                       child: Column(
//                         children: [
//                           Text('Item $index'),
//                           // Agregar más contenido según lo necesites
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               childCount:
//                   20, // Cambia el número de elementos según lo que necesitas
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Buscar por raza',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredCats.length,
            itemBuilder: (context, index) {
              final breedCat = filteredCats[index];
              return _CardCat(breedCat: breedCat);
            },
          ),
        ),
      ],
    );
  }
}

class _CardCat extends StatelessWidget {
  const _CardCat({
    required this.breedCat,
  });

  final Cat breedCat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      breedCat.name,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Botón presionado');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Mas',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward_ios_rounded,
                            size: 20, color: Colors.black),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    breedCat.urlImg,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      breedCat.origin,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Icon(Icons.bookmark_add_sharp, size: 30),
                  Text(
                    '${breedCat.intelligence}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 15)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
