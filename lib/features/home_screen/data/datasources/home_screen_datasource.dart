
import '../models/apartment_overview_model.dart';
import '../models/commercial_properties_overview_model.dart';
import '../models/residential_properties_overview_model.dart';

abstract class HomeScreenDataSource {

  ResidentialPropertiesOverviewModel getResidentialData();

  CommercialPropertiesOverviewModel getCommercialData();

}

class HomeScreenDataSourceImpl implements HomeScreenDataSource {

/*  @override
  Future<OnboardingModel> getOnboardingData() async {

    // supportingImage: Image.network("https://firebasestorage.googleapis.com/v0/b/interested-project-011.appspot.com/o/onboarding%2Fexplore.svg?alt=media&token=6ccddbd7-b8b9-4b5a-8efd-6aa3b15d6be0")

    try {

      var db = FirebaseFirestore.instance;

      var ref = db.collection("onboarding")
      .doc("onboarding_data")
      .withConverter(fromFirestore: OnboardingModel.fromFirestore,
          toFirestore: (OnboardingModel onboardingModel, _) => onboardingModel.toFirestore());

      final docSnap = await ref.get();
      final onboardingModel = docSnap.data(); // Convert to object
      if (onboardingModel != null) {
        logger.log("OnboardingDataSource","Onboarding model data: $onboardingModel");
        await _mapOnboardingImages(onboardingModel);

      } else {
        logger.log("OnboardingDataSource","No onboarding document found on server.");
        throw DataNotFoundException();
      }

      return onboardingModel;
        // return OnboardingModel.fromFirestore(onboardingData, null);

    } on FirebaseException catch (e) {
      logger.log("OnboardingDataSource",e.toString());
      // throw ServerException();
      // throw Exception("Failed to get onboarding data: $e");
      throw ServerException();
    }

  }

  // Now not needed here as we have allowed everyone to read/access the onboarding data
  @override
  Future<UserCredential> signInAnonymously() async {

    try {
      final userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      logger.log("OnboardingDataSource","Signed in with temporary account.");

      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          logger.log("OnboardingDataSource","Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          logger.log("OnboardingDataSource","Unknown error. $e");
      }
      throw Exception("Failed to Authenticate: $e");

    }
  }*/

  @override
  CommercialPropertiesOverviewModel getCommercialData() {

    return CommercialPropertiesOverviewModel();

  }

  @override
  ResidentialPropertiesOverviewModel getResidentialData() {

    ResidentialPropertiesOverviewModel model = ResidentialPropertiesOverviewModel();
    for (var i = 0; i < 3; i++) {
      model.recentlyAddedApartments.add(
        ApartmentOverviewModel(apartmentName: "Apartment Name",
        imagePath: "",
        location: "Al Olaya, Riyadh",
        rentalAmount: "1,45,000 SAR",
        isVerified: true,)
      );
    }
    model.recentlyAddedApartments.add(
        ApartmentOverviewModel(apartmentName: "Apartment Name",
          imagePath: "",
          location: "Al Olaya, Riyadh",
          rentalAmount: "2,50,151 SAR",
          launchDate: DateTime.now().add(Duration(days: 23)),)
    );
    model.ownedApartments.add(
        ApartmentOverviewModel(apartmentName: "Apartment Name",
            imagePath: "",
            location: "Al Olaya, Riyadh",
            rentalAmount: "1,05,000 SAR",
            isVerified: true,
            bedrooms: 2,
            bathrooms: 2,
            isLiked: false,
            sizeInSqft: 200));
    model.ownedApartments.add(
        ApartmentOverviewModel(apartmentName: "Apartment Name will be here with two lines",
            imagePath: "",
            location: "Al Olaya, Riyadh",
            rentalAmount: "1,05,000 SAR",
            isVerified: true,
            bedrooms: 2,
            bathrooms: 2,
            isSold: true,
            isLiked: true,
            sizeInSqft: 200)
    );

    return model;

  }


}