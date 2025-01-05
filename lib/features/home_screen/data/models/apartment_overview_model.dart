
import 'package:equatable/equatable.dart';

import '../../domain/entities/apartment_overview_entity.dart';

class ApartmentOverviewModel extends Equatable {

  final String apartmentName;
  final String imagePath;
  final String location;
  final String rentalAmount;
  final bool? isVerified;
  final bool? isSold;
  final bool? isLiked;
  final int? bedrooms;
  final int? bathrooms;
  final int? sizeInSqft;
  final DateTime? launchDate;


  const ApartmentOverviewModel({
    required this.apartmentName,
    required this.imagePath,
    required this.location,
    required this.rentalAmount,
    this.isVerified,
    this.isSold,
    this.isLiked,
    this.bedrooms,
    this.bathrooms,
    this.sizeInSqft,
    this.launchDate,
  });

  toEntity() => ApartmentOverviewEntity(
    apartmentName: apartmentName,
    imagePath: imagePath,
    location: location,
    rentalAmount: rentalAmount,
    isVerified: isVerified,
    isSold: isSold,
    isLiked: isLiked,
    bedrooms: bedrooms,
    bathrooms: bathrooms,
    sizeInSqft: sizeInSqft,
    launchDate: launchDate,
  );

  @override
  List<Object?> get props => [
    apartmentName,
    imagePath,
    location,
    rentalAmount,
    isVerified,
    isSold,
    isLiked,
    bedrooms,
    bathrooms,
    sizeInSqft,
    launchDate,
  ];

}