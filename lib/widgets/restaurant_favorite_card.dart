import 'package:flutter/material.dart';
import 'package:goys_boarding_house/constant/theme.dart';
import 'package:goys_boarding_house/models/restaurant_model.dart';
import 'package:goys_boarding_house/pages/detail_page_restaurant.dart';

class RestaurantFavoriteCard extends StatelessWidget {
  final RestaurantModel restaurant;
  const RestaurantFavoriteCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPageRestaurant(
              resto: restaurant,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: edge,
        ),
        child: Container(
          //padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: whiteColor,
            // boxShadow: const [
            //   BoxShadow(
            //     color: Colors.black87,
            //     blurRadius: 1,
            //   ),
            // ],
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: 130,
                  height: 110,
                  color: whiteColor,
                  child: Stack(
                    children: [
                      Hero(
                        tag: restaurant.name,
                        child: Image.network(
                          restaurant.getMediumPicture(),
                          width: 130,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
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
                                  '${restaurant.rating}',
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
                    restaurant.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '\$${restaurant.rating}',
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
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.red,
                      ),
                      Text(
                        restaurant.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
