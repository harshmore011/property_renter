
import 'package:equatable/equatable.dart';
import '../../domain/entities/commercial_properties_overview_entity.dart';
import '../../domain/entities/residential_properties_overview_entity.dart';

abstract class HomeScreenState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class InitialState extends HomeScreenState{}

class LoadingState extends HomeScreenState{}

class GetResidentialDataState extends HomeScreenState {

final ResidentialPropertiesOverviewEntity residentialData;

  GetResidentialDataState({required this.residentialData});

}
class GetCommercialDataState extends HomeScreenState {

final CommercialPropertiesOverviewEntity commercialData;

  GetCommercialDataState({required this.commercialData});

}

class FailureState extends HomeScreenState{
  final String message;

  FailureState({required this.message});

  @override
  List<Object> get props {
    return [message];
  }
}

// class OnboardingCompletedState extends OnboardingState{}

