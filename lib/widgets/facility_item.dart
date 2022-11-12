import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';

class FacilityItem extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final int? total;

  const FacilityItem({
    super.key,
    this.name,
    this.imageUrl,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl!,
          width: 32,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text.rich(
          TextSpan(
            text: '${total!}',
            style: purpleTextStyle.copyWith(
              fontWeight: semiBold,
            ),
            children: [
              TextSpan(
                text: ' ${name!}',
                style: greyTextStyle.copyWith(
                  fontWeight: light,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
