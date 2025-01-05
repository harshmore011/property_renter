
import 'package:equatable/equatable.dart';

class ApartmentOverviewEntity extends Equatable {

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


  const ApartmentOverviewEntity({
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