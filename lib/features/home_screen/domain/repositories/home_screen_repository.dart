
import '../entities/commercial_properties_overview_entity.dart';
import '../entities/residential_properties_overview_entity.dart';

abstract class HomeScreenRepository {

  ResidentialPropertiesOverviewEntity getResidentialData();

  CommercialPropertiesOverviewEntity getCommercialData();

}
