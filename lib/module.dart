import 'package:crud/data/api/contact_api.dart';
import 'package:crud/data/repository/contact_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);
  ContactApi contactApi = ContactApi(getIt.call());
  getIt.registerLazySingleton(() => contactApi);
  ContactRepository contactRepository = ContactRepository(getIt.call());
  getIt.registerLazySingleton(() => contactRepository);
  // GetContactCubit getContactCubit=GetContactCubit(getIt.call());
  // getIt.registerLazySingleton(() => getContactCubit);
  // PostContactCubit getPostContactCubit=PostContactCubit(getIt.call());
  // getIt.registerLazySingleton(() => getPostContactCubit);
  // EditCubit getEditContactCubit=EditCubit(getIt.call());
  // getIt.registerLazySingleton(() => getEditContactCubit);
}
