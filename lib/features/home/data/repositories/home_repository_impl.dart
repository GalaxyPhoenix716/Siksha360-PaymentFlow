import 'package:siksha360_task/features/home/data/datasources/home_remote_datasource.dart';
import 'package:siksha360_task/features/home/domain/entities/parent.dart';
import 'package:siksha360_task/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDatasource;

  HomeRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Parent> fetchUser() async {
    try {
      final user = await remoteDatasource.fetchUser();
      return user;
    } catch (e) {
      throw Exception('Failed to fetch user');
    }
  }
}
