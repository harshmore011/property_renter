import 'package:equatable/equatable.dart';
import 'package:property_renter/features/home_screen/domain/entities/residential_properties_overview_entity.dart';

import 'apartment_overview_model.dart';

class ResidentialPropertiesOverviewModel extends Equatable {
  final List<ApartmentOverviewModel> recentlyAddedApartments = [];
  final List<ApartmentOverviewModel> ownedApartments = [];
  final List<ApartmentOverviewModel> upcomingApartments = [];

  @override
  List<Object?> get props => [
        recentlyAddedApartments,
        ownedApartments,
        upcomingApartments,
      ];

  ResidentialPropertiesOverviewEntity toEntity() {
    ResidentialPropertiesOverviewEntity entity = ResidentialPropertiesOverviewEntity();

    entity.recentlyAddedApartments.addAll(recentlyAddedApartments.map((e) => e.toEntity()));
    entity.ownedApartments.addAll(ownedApartments.map((e) => e.toEntity()));
    entity.upcomingApartments.addAll(upcomingApartments.map((e) => e.toEntity()));

    return entity;
  }
}
