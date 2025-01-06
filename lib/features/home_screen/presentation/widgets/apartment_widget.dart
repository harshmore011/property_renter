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

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 4,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("assets/icons/image-1.png"),
            width: 450,
            height: 250,
            fit: BoxFit.fill,
          ),
          /* const SizedBox(
            height: 20,
          ),*/
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        // textDirection:
                        apartment.apartmentName,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppTheme.headingColor,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                    if (apartment.isSold != null && apartment.isSold == true)
                      const ImageIcon(
                        AssetImage(
                          "assets/icons/sold.png",
                        ),
                        color: Color(0xffF79530),
                      ),
                    if (apartment.isVerified != null &&
                        apartment.isVerified == true &&
                        (apartment.isSold == null ||
                            apartment.isSold != true))
                      const ImageIcon(
                        AssetImage(
                          "assets/icons/badge-check-24.png",
                        ),
                        color: Color(0xffF79530),
                      )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                // benefit.supportingImage,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const ImageIcon(
                        AssetImage("assets/icons/bedroom-22.png")),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${apartment.bedrooms}",
                      style: const TextStyle(
                          color: AppTheme.paragraphColor, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const ImageIcon(
                        AssetImage("assets/icons/bathroom-22.png")),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${apartment.bathrooms}",
                      style: const TextStyle(
                          color: AppTheme.paragraphColor, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const ImageIcon(AssetImage("assets/icons/Vector-5.png")),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${apartment.sizeInSqft} sqM",
                      style: const TextStyle(
                          color: AppTheme.paragraphColor, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const ImageIcon(
                            AssetImage("assets/icons/Group-1.png")),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          apartment.location,
                          style: const TextStyle(
                              color: AppTheme.paragraphColor,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Text(
                      apartment.rentalAmount,
                      style: const TextStyle(
                          color: AppTheme.headingColor,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
