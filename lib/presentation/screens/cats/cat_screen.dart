import 'package:catbreeds/domain/domains_chest.dart';
import 'package:catbreeds/presentation/presentation_chest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatScreen extends StatelessWidget {
  static const name = 'cat-screen';
  final String catId;
  const CatScreen({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final Cat breedCat =
          ref.watch(breedsCatsProvider).firstWhere((cat) => cat.id == catId);
      return Scaffold(
        appBar: AppBar(
          title: Text(
            breedCat.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: _CatView(breedCat: breedCat),
      );
    });
  }
}

class _CatView extends StatelessWidget {
  final Cat breedCat;
  const _CatView({required this.breedCat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network(
              breedCat.urlImg,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  label: 'Description: ',
                  message: '${breedCat.description} -- ${breedCat.description} ',
                ),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                  label: 'Country: ',
                  message: breedCat.origin,
                ),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                  label: 'Intelligence: ',
                  message: '${breedCat.intelligence}',
                ),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                  label: 'Adaptability: ',
                  message: '${breedCat.adaptability}',
                ),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                  label: 'Energy Level: ',
                  message: '${breedCat.energyLevel}',
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
