import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';
import 'package:goys_boarding_house/models/tips.dart';
import 'package:goys_boarding_house/providers/space_provider.dart';
import 'package:goys_boarding_house/widgets/city_card.dart';
import 'package:goys_boarding_house/widgets/space_card.dart';
import 'package:goys_boarding_house/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SpaceProvider>(context, listen: false)
      ..getAllSpaces()
      ..getAllRestos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        // TODO : TITLE HEADER
        children: [
          SizedBox(
            height: edge,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Explore Now',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Mencari kosan yang cozy',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          // TODO : POPULAR CITY
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Popular Restaurant',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(
              top: 16,
              left: 24,
            ),
            height: 150,
            child: Consumer<SpaceProvider>(
              builder: (context, provider, child) {
                final data = provider.resto;
                if (provider.state == ResultState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: purpleColor),
                  );
                } else if (provider.state == ResultState.error) {
                  return const Center(
                    child: Text('Data gagal di ambil'),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return CityCard(resto: data[index]);
                    },
                  );
                }
              },
            ),
          ),

          const SizedBox(
            height: 30.0,
          ),
          // TODO : recomend space
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Recommended Space',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: edge,
            ),
            child: Consumer<SpaceProvider>(
              builder: (context, provider, child) {
                final data = provider.space;
                if (provider.state == ResultState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: purpleColor),
                  );
                } else if (provider.state == ResultState.error) {
                  return const Center(
                    child: Text('Error Bray'),
                  );
                } else {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return SpaceCard(space: data[index]);
                    },
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Tips & Guidance',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: edge,
            ),
            child: Column(
              children: [
                TipsCard(
                  tips: Tips(
                    id: 1,
                    title: 'City Guidelines',
                    imageUrl: 'assets/tips1.png',
                    updatedAt: 'Updated 20 Apr',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TipsCard(
                  tips: Tips(
                    id: 2,
                    title: 'Jakarta Fairship',
                    imageUrl: 'assets/tips2.png',
                    updatedAt: 'Updated 11 Dec',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100 + edge,
          ),
        ],
      ),
    );
  }
}
