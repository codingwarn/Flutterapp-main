// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/datasources/photo_remote_data_source.dart' as _i538;
import '../../data/repositories/photo_repository_impl.dart' as _i747;
import '../../domain/repositories/photo_repository.dart' as _i236;
import '../../domain/usecases/get_photos_usecase.dart' as _i997;
import '../../presentation/blocs/photo/photo_bloc.dart' as _i1026;
import '../../presentation/viewmodels/photo_view_model.dart' as _i544;
import '../network/api_client.dart' as _i557;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i557.ApiClient>(() => _i557.ApiClient());
  gh.factory<_i538.PhotoRemoteDataSource>(
      () => _i538.PhotoRemoteDataSourceImpl(gh<_i557.ApiClient>()));
  gh.factory<_i236.PhotoRepository>(
      () => _i747.PhotoRepositoryImpl(gh<_i538.PhotoRemoteDataSource>()));
  gh.factory<_i997.GetPhotosUseCase>(
      () => _i997.GetPhotosUseCase(gh<_i236.PhotoRepository>()));
  gh.factory<_i1026.PhotoBloc>(
      () => _i1026.PhotoBloc(gh<_i997.GetPhotosUseCase>()));
  gh.factory<_i544.PhotoViewModel>(
      () => _i544.PhotoViewModel(gh<_i997.GetPhotosUseCase>()));
  return getIt;
}
