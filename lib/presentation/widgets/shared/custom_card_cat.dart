import 'package:catbreeds/domain/domains_chest.dart';
import 'package:catbreeds/presentation/presentation_chest.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCardCatWidget extends StatelessWidget {
  final Cat breedCat;
  const CustomCardCatWidget({
    super.key,
    required this.breedCat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => context.push('/${CatScreen.name}/${breedCat.id}'),
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
                    CustomTextButtomRouteWidget(
                        routeName: CatScreen.name,
                        label: 'Más',
                        icondata: Icons.arrow_forward_ios_rounded,
                        idCat: breedCat.id),
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
      ),
    );
  }
}
