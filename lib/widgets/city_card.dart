import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';
import 'package:goys_boarding_house/models/city.dart';

class CityCard extends StatelessWidget {
  final City? city;
  const CityCard({
    super.key,
    this.city,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: greycardColor,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city!.imageUrl!,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city!.isPopular ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_star.png',
                        height: 22,
                        width: 22,
                      ),
                    ),
                  ),
                ) : Container(),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              city!.name ?? '',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
