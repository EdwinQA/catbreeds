import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTextButtomRouteWidget extends StatelessWidget {
  final String routeName;
  final String label;
  final IconData icondata;
  final String idCat;
  const CustomTextButtomRouteWidget({
    super.key,
    required this.routeName,
    required this.label,
    required this.icondata,
    required this.idCat,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.push('/$routeName/$idCat');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.black, fontSize: 20)),
          const SizedBox(width: 4),
          Icon(icondata, size: 20, color: Colors.black),
        ],
      ),
    );
  }
}
