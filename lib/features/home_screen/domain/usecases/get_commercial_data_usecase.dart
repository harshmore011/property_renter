
import '../../../../core/usecase/usecase.dart';
import '../entities/commercial_properties_overview_entity.dart';
import '../repositories/home_screen_repository.dart';

class GetCommercialDataUseCase extends Usecase<CommercialPropertiesOverviewEntity, NoParams> {

  final HomeScreenRepository repository;

  GetCommercialDataUseCase(this.repository);

  @override
  CommercialPropertiesOverviewEntity call(NoParams params) {

    return repository.getCommercialData();
  }

}