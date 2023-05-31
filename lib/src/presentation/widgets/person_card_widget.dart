import 'package:flutter/material.dart';

import '../../domain/person.dart';
import '../config/colors.dart';

class PersonCardWidget extends StatelessWidget {
  const PersonCardWidget({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152,
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.network(
                person.imageUrl.getOrCrash(),
              ),
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${person.name.getOrCrash()} ${person.surname.getOrCrash()}',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(width: 4),
                  Row(
                    children: [
                      Text(
                        person.rating.getOrCrash().toInt().toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 12),
                      ),
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: AppColors.starColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                person.description.getOrCrash(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 8),
              ),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}
