
import '../../../../core/usecase/usecase.dart';
import '../entities/residential_properties_overview_entity.dart';
import '../repositories/home_screen_repository.dart';

class GetResidentialDataUseCase extends Usecase<ResidentialPropertiesOverviewEntity, NoParams> {

  final HomeScreenRepository repository;

  GetResidentialDataUseCase(this.repository);

  @override
  ResidentialPropertiesOverviewEntity call(NoParams params) {

    return repository.getResidentialData();
  }

}