import 'package:dlaundry_mobile/config/failure.dart';
import 'package:dlaundry_mobile/datasources/promo_datasource.dart';
import 'package:dlaundry_mobile/datasources/shop_datasource.dart';
import 'package:dlaundry_mobile/models/laundry_model.dart';
import 'package:dlaundry_mobile/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  getPromo() {
    PromoDatasource.readLimit().then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              // setHomePromoStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              // setHomePromoStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              // setHomePromoStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              // setHomePromoStatus(ref, 'Bad Request');
              break;
            case UnauthorisedFailure:
              // setHomePromoStatus(ref, 'Unauthorised');
              break;
            default:
              // setHomePromoStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          List data = result['data'];
          List<PromoModel> promos =
              data.map((e) => PromoModel.fromJson(e)).toList();
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
              // setHomePromoStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              // setHomePromoStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              // setHomePromoStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              // setHomePromoStatus(ref, 'Bad Request');
              break;
            case UnauthorisedFailure:
              // setHomePromoStatus(ref, 'Unauthorised');
              break;
            default:
              // setHomePromoStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          List data = result['data'];
          List<ShopModel> shops =
              data.map((e) => ShopModel.fromJson(e)).toList();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
