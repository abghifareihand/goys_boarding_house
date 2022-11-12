import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';
import 'package:goys_boarding_house/providers/database_provider.dart';
import 'package:goys_boarding_house/widgets/restaurant_card.dart';
import 'package:goys_boarding_house/widgets/restaurant_favorite_card.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: edge,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Restaurant Favorite',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'List restaurant favorite',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Consumer<DatabaseProvider>(
            builder: (context, provider, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.favorite.length,
                itemBuilder: (context, index) {
                  return RestaurantFavoriteCard(
                      restaurant: provider.favorite[index]);
                },
              );
            },
          ),
          SizedBox(
            height: 100 + edge,
          ),
        ],
      ),
    );
  }
}
