import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';
import 'package:goys_boarding_house/models/space.dart';

class SpaceCard extends StatelessWidget {
  final Space? space;
  const SpaceCard({
    super.key,
    this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 130,
            height: 110,
            child: Stack(
              children: [
                Image.asset(
                  space!.imageUrl ?? '',
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/ic_star.png',
                            height: 22,
                            width: 22,
                          ),
                          Text(
                            '${space!.rating}/5',
                            style: whiteTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              space!.name!,
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Text.rich(
              TextSpan(
                text: '\$${space!.price}',
                style: purpleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
                children: [
                  TextSpan(
                    text: ' / month',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              '${space!.city}, ${space!.country}',
              style: greyTextStyle.copyWith(
                fontWeight: light,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
