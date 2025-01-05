import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/apartment_overview_entity.dart';

class ApartmentCard extends StatefulWidget {
  final ApartmentOverviewEntity apartment;

  const ApartmentCard({super.key, required this.apartment});

  @override
  State<ApartmentCard> createState() => _ApartmentCardState();
}

class _ApartmentCardState extends State<ApartmentCard> {
  @override
  Widget build(BuildContext context) {
    final apartment = widget.apartment;

    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Colors.white,
        elevation: 4,
        child: Container(
          width: 390,
          height: 250,
          // constraints: BoxConstraints(maxHeight: ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/icons/image-1.png"),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Positioned(
                      right: 24,
                      child: apartment.isLiked != null &&
                              apartment.isLiked == true
                          ? const ImageIcon(
                              AssetImage("assets/icons/liked-40.png"))
                          : const ImageIcon(AssetImage("assets/icons/unliked-40.png")))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    apartment.apartmentName,
                    style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  if (apartment.isVerified != null &&
                      apartment.isVerified == true)
                    const ImageIcon(
                        AssetImage("assets/icons/badge-check-24.png"))
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              // benefit.supportingImage,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ImageIcon(AssetImage("assets/icons/bedroom-22.png")),
                  Text(
                    "${apartment.bedrooms}",
                    style: const TextStyle(
                        color: AppTheme.paragraphColor, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const ImageIcon(AssetImage("assets/icons/bathroom-22.png")),
                  Text(
                    "${apartment.bathrooms}",
                    style: const TextStyle(
                        color: AppTheme.paragraphColor, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const ImageIcon(AssetImage("assets/icons/Vector-5.png")),
                  Text(
                    "${apartment.sizeInSqft} sqM",
                    style: const TextStyle(
                        color: AppTheme.paragraphColor, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const ImageIcon(AssetImage("assets/icons/Group-1.png")),
                      Text(
                        apartment.location,
                        style: const TextStyle(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    apartment.rentalAmount,
                    style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
