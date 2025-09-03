// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasources/photo_remote_data_source.dart' as _i4;
import '../../data/repositories/photo_repository_impl.dart' as _i6;
import '../../domain/repositories/photo_repository.dart' as _i5;
import '../../domain/usecases/get_photos_usecase.dart' as _i7;
import '../../presentation/blocs/photo/photo_bloc.dart' as _i8;
import '../network/api_client.dart' as _i3;

_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.ApiClient>(_i3.ApiClient());
  gh.factory<_i4.PhotoRemoteDataSource>(
      () => _i4.PhotoRemoteDataSourceImpl(gh<_i3.ApiClient>()));
  gh.factory<_i5.PhotoRepository>(
      () => _i6.PhotoRepositoryImpl(gh<_i4.PhotoRemoteDataSource>()));
  gh.factory<_i7.GetPhotosUseCase>(
      () => _i7.GetPhotosUseCase(gh<_i5.PhotoRepository>()));
  gh.factory<_i8.PhotoBloc>(() => _i8.PhotoBloc(gh<_i7.GetPhotosUseCase>()));
  return getIt;
}
