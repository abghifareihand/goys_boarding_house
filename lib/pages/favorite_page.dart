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
              final data = provider.favorite;
              if (provider.state == ResultState.loading) {
                return const Center(
                  child: CircularProgressIndicator(color: purpleColor),
                );
              } else if (provider.state == ResultState.error) {
                return const Center(
                  child: Text('Empty Data Favorite'),
                );
              } else {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return RestaurantFavoriteCard(restaurant: data[index]);
                  },
                );
              }
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
