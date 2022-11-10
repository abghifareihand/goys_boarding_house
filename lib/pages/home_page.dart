import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';
import 'package:goys_boarding_house/models/city.dart';
import 'package:goys_boarding_house/models/space.dart';
import 'package:goys_boarding_house/models/tips.dart';
import 'package:goys_boarding_house/widgets/bottom_navbar_item.dart';
import 'package:goys_boarding_house/widgets/city_card.dart';
import 'package:goys_boarding_house/widgets/space_card.dart';
import 'package:goys_boarding_house/widgets/tips_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
                'Popular Cities',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24.0,
                  ),
                  CityCard(
                    city: City(
                      id: 1,
                      imageUrl: 'assets/city1.png',
                      name: 'Jakarta',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CityCard(
                    city: City(
                      id: 2,
                      imageUrl: 'assets/city2.png',
                      name: 'Bandung',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  CityCard(
                    city: City(
                      id: 3,
                      imageUrl: 'assets/city3.png',
                      name: 'Surabaya',
                    ),
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                ],
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
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  SpaceCard(
                    space: Space(
                      id: 1,
                      name: 'Kuretakeso Hott',
                      imageUrl: 'assets/space1.png',
                      price: 52,
                      city: 'Bandung',
                      country: 'Germany',
                      rating: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SpaceCard(
                    space: Space(
                        id: 2,
                        name: 'Roemah Nenek',
                        imageUrl: 'assets/space2.png',
                        price: 11,
                        city: 'Seattle',
                        country: 'Bogor',
                        rating: 5),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SpaceCard(
                    space: Space(
                        id: 3,
                        name: 'Darrling How',
                        imageUrl: 'assets/space3.png',
                        price: 20,
                        city: 'Jakarta',
                        country: 'Indonesia',
                        rating: 3),
                  ),
                ],
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
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: greynavColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/ic_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/ic_favorite.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
