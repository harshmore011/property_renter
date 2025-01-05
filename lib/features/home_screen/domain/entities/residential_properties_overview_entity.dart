

import 'package:equatable/equatable.dart';

import 'apartment_overview_entity.dart';

class ResidentialPropertiesOverviewEntity extends Equatable {

  final List<ApartmentOverviewEntity> recentlyAddedApartments = [];
  final List<ApartmentOverviewEntity> ownedApartments = [];
  final List<ApartmentOverviewEntity> upcomingApartments = [];

  @override
  List<Object?> get props => [recentlyAddedApartments,ownedApartments,upcomingApartments,];

}


