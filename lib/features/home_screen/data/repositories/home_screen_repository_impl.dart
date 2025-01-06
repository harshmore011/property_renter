import '../../domain/entities/commercial_properties_overview_entity.dart';
import '../../domain/entities/residential_properties_overview_entity.dart';
import '../../domain/repositories/home_screen_repository.dart';
import '../datasources/home_screen_datasource.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  final HomeScreenDataSource dataSource;

  HomeScreenRepositoryImpl({required this.dataSource});

  @override
  CommercialPropertiesOverviewEntity getCommercialData() {
    return dataSource.getCommercialData().toEntity();
  }

  @override
  ResidentialPropertiesOverviewEntity getResidentialData() {
    return dataSource.getResidentialData().toEntity();
  }


}
