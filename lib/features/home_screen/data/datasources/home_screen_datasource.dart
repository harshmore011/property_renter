import '../models/apartment_overview_model.dart';
import '../models/commercial_properties_overview_model.dart';
import '../models/residential_properties_overview_model.dart';

abstract class HomeScreenDataSource {
  ResidentialPropertiesOverviewModel getResidentialData();

  CommercialPropertiesOverviewModel getCommercialData();
}

class HomeScreenDataSourceImpl implements HomeScreenDataSource {

  @override
  CommercialPropertiesOverviewModel getCommercialData() {
    return CommercialPropertiesOverviewModel();
  }

  @override
  ResidentialPropertiesOverviewModel getResidentialData() {
    ResidentialPropertiesOverviewModel model =
        ResidentialPropertiesOverviewModel();
    for (var i = 0; i < 3; i++) {
      model.recentlyAddedApartments.add(ApartmentOverviewModel(
        apartmentName: "Apartment Name",
        imagePath: "",
        location: "Al Olaya, Riyadh",
        rentalAmount: "1,45,000 SAR",
        isVerified: true,
      ));
    }
    model.upcomingApartments.add(ApartmentOverviewModel(
      apartmentName: "Apartment Name",
      imagePath: "",
      location: "Al Olaya, Riyadh",
      rentalAmount: "2,50,151 SAR",
      launchDate: DateTime.now().add(Duration(days: 23)),
    ));
    model.ownedApartments.add(ApartmentOverviewModel(
        apartmentName: "Apartment Name",
        imagePath: "",
        location: "Al Olaya, Riyadh",
        rentalAmount: "1,05,000 SAR",
        isVerified: true,
        bedrooms: 2,
        bathrooms: 2,
        isLiked: false,
        sizeInSqft: 200));
    model.ownedApartments.add(ApartmentOverviewModel(
        apartmentName: "Apartment Name will be here with two lines",
        imagePath: "",
        location: "Al Olaya, Riyadh",
        rentalAmount: "1,05,000 SAR",
        isVerified: true,
        bedrooms: 2,
        bathrooms: 2,
        isSold: true,
        isLiked: true,
        sizeInSqft: 200));

    return model;
  }
}
