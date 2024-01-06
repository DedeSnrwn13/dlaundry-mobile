import 'package:dlaundry_mobile/config/app_session.dart';
import 'package:dlaundry_mobile/config/failure.dart';
import 'package:dlaundry_mobile/datasources/laundry_datasource.dart';
import 'package:dlaundry_mobile/models/laundry_model.dart';
import 'package:dlaundry_mobile/models/user_model.dart';
import 'package:flutter/material.dart';

class MyLaundryView extends StatefulWidget {
  const MyLaundryView({super.key});

  @override
  State<MyLaundryView> createState() => _MyLaundryViewState();
}

class _MyLaundryViewState extends State<MyLaundryView> {
  late UserModel user;

  getMyLaundry() {
    LaundryDatasource.readByUser(user.id).then((value) {
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
          List<LaundryModel> laundries = data.map((e) => LaundryModel.fromJson(e)).toList();
        },
      );
    });
  }

  @override
  void initState() {
    AppSession.getUser().then((value) {
      user = value!;
      getMyLaundry();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
