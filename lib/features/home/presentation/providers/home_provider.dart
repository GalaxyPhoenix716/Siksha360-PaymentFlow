import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siksha360_task/features/home/data/datasources/home_remote_datasource.dart';
import 'package:siksha360_task/features/home/data/repositories/home_repository_impl.dart';
import 'package:siksha360_task/features/home/domain/entities/parent.dart';
import 'package:siksha360_task/features/home/domain/repositories/home_repository.dart';
import 'package:siksha360_task/features/home/domain/usecases/fetch_user.dart';

part 'home_provider.g.dart';

@riverpod
HomeRemoteDataSource homeRemoteDataSource(HomeRemoteDataSourceRef ref) {
  return HomeRemoteDataSourceImpl();
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final dataSource = ref.watch(homeRemoteDataSourceProvider);
  return HomeRepositoryImpl(remoteDatasource: dataSource);
}

@riverpod
FetchUserUseCase fetchUserUseCase(FetchUserUseCaseRef ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return FetchUserUseCase(repository);
}

@riverpod
class Home extends _$Home {
  @override
  FutureOr<Parent> build() async {
    final fetchUser = ref.watch(fetchUserUseCaseProvider);
    return fetchUser.execute();
  }

  Future<void> loadUser() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(fetchUserUseCaseProvider).execute();
    });
  }
}
