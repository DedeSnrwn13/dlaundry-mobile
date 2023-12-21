import 'package:dlaundry_mobile/config/failure.dart';
import 'package:dlaundry_mobile/datasources/promo_datasource.dart';
import 'package:dlaundry_mobile/datasources/shop_datasource.dart';
import 'package:dlaundry_mobile/models/promo_model.dart';
import 'package:dlaundry_mobile/models/shop_model.dart';
import 'package:dlaundry_mobile/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:d_view/d_view.dart';
import 'package:d_button/d_button.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  static final editSearch = TextEditingController();

  gotoSearchCity() {}

  getPromo() {
    PromoDatasource.readLimit().then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              setHomePromoStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              setHomePromoStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              setHomePromoStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              setHomePromoStatus(ref, 'Bad Request');
              break;
            case UnauthorisedFailure:
              setHomePromoStatus(ref, 'Unauthorised');
              break;
            default:
              setHomePromoStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          setHomePromoStatus(ref, 'Success');

          List data = result['data'];
          List<PromoModel> promos =
              data.map((e) => PromoModel.fromJson(e)).toList();

          ref.read(homePromoListProvider.notifier).setData(promos);
        },
      );
    });
  }

  getRecommendation() {
    ShopDatasource.readRecommendationLimit().then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              setHomeRecommendationStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              setHomeRecommendationStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              setHomeRecommendationStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              setHomeRecommendationStatus(ref, 'Bad Request');
              break;
            case UnauthorisedFailure:
              setHomeRecommendationStatus(ref, 'Unauthorised');
              break;
            default:
              setHomeRecommendationStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          setHomeRecommendationStatus(ref, 'Success');

          List data = result['data'];
          List<ShopModel> shops =
              data.map((e) => ShopModel.fromJson(e)).toList();

          ref.read(homeRecommendationListProvider.notifier).setData(shops);
        },
      );
    });
  }

  @override
  void initState() {
    getPromo();
    getRecommendation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We\'re ready',
                style: GoogleFonts.ptSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DView.height(4),
              Text(
                'to clean your clothes',
                style: GoogleFonts.ptSans(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              DView.height(20),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_city,
                        color: Colors.green,
                        size: 20,
                      ),
                      DView.width(4),
                      Text(
                        'Find by city',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  ),
                  DView.height(8),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => gotoSearchCity(),
                                  icon: const Icon(Icons.search),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: editSearch,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search...',
                                    ),
                                    onSubmitted: (value) => gotoSearchCity(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        DView.width(14),
                        DButtonElevation(
                          onClick: () {},
                          mainColor: Colors.green,
                          splashColor: Colors.greenAccent,
                          width: 50,
                          radius: 10,
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}