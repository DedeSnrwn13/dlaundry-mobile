import 'package:dlaundry_mobile/config/failure.dart';
import 'package:dlaundry_mobile/datasources/shop_datasource.dart';
import 'package:dlaundry_mobile/models/shop_model.dart';
import 'package:flutter/material.dart';

class SearchByCityPage extends StatefulWidget {
  const SearchByCityPage({super.key, required this.query});
  final String query;

  @override
  State<SearchByCityPage> createState() => _SearchByCityPageState();
}

class _SearchByCityPageState extends State<SearchByCityPage> {
  final editSearch = TextEditingController();

  execute() {
    ShopDatasource.searchByCity(editSearch.text).then((value) {
      value.fold((failure) {
        switch (failure.runtimeType) {
          case ServerFailure:
            break;
          case NotFoundFailure:
            break;
          case ForbiddenFailure:
            break;
          case BadRequestFailure:
            break;
          case UnauthorisedFailure:
            break;
          default:
            break;
        }
      }, (result) {
        List data = result['data'];
        List<ShopModel> list = data.map((e) => ShopModel.fromJson(e)).toList();
      });
    });
  }

  @override
  void initState() {
    if (widget.query != '') {
      editSearch.text = widget.query;

      execute();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
