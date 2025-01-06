
import 'package:get_it/get_it.dart';
import '../../features/home_screen/data/datasources/home_screen_datasource.dart';
import '../../features/home_screen/data/repositories/home_screen_repository_impl.dart';
import '../../features/home_screen/domain/repositories/home_screen_repository.dart';
import '../../features/home_screen/domain/usecases/get_commercial_data_usecase.dart';
import '../../features/home_screen/domain/usecases/get_residential_data_usecase.dart';
import '../../features/home_screen/presentation/blocs/home_screen_bloc.dart';
import '../router/app_router.dart';
import '../theme/app_theme.dart';

final sl = GetIt.instance;

Future<void> injectDependencies() async {

  /// CORE
  // Theme
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  // Routes
  sl.registerLazySingleton<AppRouter>(() => AppRouter());

  /// HOME SCREEN
  // Bloc
  sl.registerFactory(() => HomeScreenBloc(getCommercialDataUseCase: sl(),
      getResidentialDataUseCase: sl()));
  // UseCases
  sl.registerLazySingleton(() => GetCommercialDataUseCase(sl()));
  sl.registerLazySingleton(() => GetResidentialDataUseCase(sl()));
  // Repositories
  sl.registerLazySingleton<HomeScreenRepository>(() =>
      HomeScreenRepositoryImpl( dataSource: sl()));
  // Data Source
  sl.registerLazySingleton<HomeScreenDataSource>(() =>
      HomeScreenDataSourceImpl());

}