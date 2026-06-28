import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:siksha360_task/features/home/data/models/parent_model.dart';

abstract class HomeRemoteDataSource {
  Future<ParentModel> fetchUser();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<ParentModel> fetchUser() async {
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      final String response = await rootBundle.loadString(
        'assets/mockData.json',
      );
      final Map<String, dynamic> data =
          json.decode(response) as Map<String, dynamic>;

      return ParentModel.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
