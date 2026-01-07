import 'package:flutter/material.dart';
import 'package:gastosappg14/models/gasto_model.dart';
import 'package:gastosappg14/utils/data_general.dart';

class CustomCardItem extends StatelessWidget {
  GastoModel gastoModel;
  CustomCardItem({required this.gastoModel});

  @override
  Widget build(BuildContext context) {
    // buscamos la imagen asociada al tipo en data_general (si no hay, usamos 'otros')
    final tipo = gastoModel.type ?? '';
    final found = types.firstWhere(
      (e) => (e['name'] as String).toLowerCase() == tipo.toLowerCase(),
      orElse: () => {'image': 'otros'},
    );
    final imageName = (found['image'] ?? 'otros').toString();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "assets/icons/$imageName.webp",
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gastoModel.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  gastoModel.datetime,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            gastoModel.price.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}