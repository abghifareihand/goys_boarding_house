import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';
import 'package:goys_boarding_house/models/tips.dart';

class TipsCard extends StatelessWidget {
  final Tips? tips;
  const TipsCard({
    super.key,
    this.tips,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips!.imageUrl!,
          width: 80,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips!.title!,
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Text(
              tips!.updatedAt!,
              style: greyTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_right,
            size: 24,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
