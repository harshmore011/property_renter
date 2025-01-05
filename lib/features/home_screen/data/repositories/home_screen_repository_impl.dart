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

/*  @override
  Future<Either<Failure, ResidentialPropertiesOverviewEntity>> getOnboardingData() async {
    if (await networkInfo.isConnected) {
      try {
        *//*     Signed in with temporary account.
        AuthCreds: UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: true, profile: {}, providerId: null, username: null, authorizationCode: null), credential: null, user: User(displayName: null, email: null, isEmailVerified: false, isAnonymous: true, metadata: UserMetadata(creationTime: 2024-10-05 13:17:25.000Z, lastSignInTime: 2024-10-05 13:17:25.000Z), phoneNumber: null, photoURL: null, providerData, [], refreshToken: AMf-vBz7urbLn89-GxnrzxMuBvokTSh9-WMS3Iqlcpvgpfc0nwxhZhF0ce3dvJFC2Im-EYCvGTyKem_41JBzeaVRa1_OwJ0Pv9GxmBCQsQrgcPKZPqUnLTyypfqynMgZXa8OPPiIvJu4tBBwzLT7oxohfl5BCbL6xVipZmruHsOwQ6EJrMw6rRGzAJksCfz-g0xze0Wk9QtdTKYpnyUOsnNMOLo51DZvrA, tenantId: null, uid: Z7lURYdLzBesjy3D4rTpJtMB92w2))
    Onboarding model data: {businessTagline: Delve into the world of your interests!, businessName: interested!, benefits: [{benefit: Find, description: Explore the vastness of what truly matters to your heart!}, {benefit: Delve, description: Immerse into the depth and profoundness of the knowledge!}, {benefit: Share, description: Interested in sharing your knowledge/experience? Share it with interested!}]}
    Onboarding model data: OnboardingModel(interested!, Delve into the world of your interests!, [{benefit: Find, description: Explore the vastness of what truly matters to your heart!}, {benefit: Delve, description: Immerse into the depth and profoundness of the knowledge!}, {benefit: Share, description: Interested in sharing your knowledge/experience? Share it with interested!}])
*//*

        // var authCreds = await onboardingDataSource.signInAnonymously();
        //     print("AuthCreds: $authCreds");
        var onboardingData = await onboardingDataSource.getOnboardingData();

        return Right(onboardingData);
      } on DataNotFoundException {
        return Left(DataNotFoundFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      logger.log("OnboardingRepositoryImp:getOnboardingData:", "NO data. Network_Error");
      return Left(OfflineFailure());
    }
  }*/


}
