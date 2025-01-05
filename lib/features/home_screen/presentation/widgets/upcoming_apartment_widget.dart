import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../../domain/entities/apartment_overview_entity.dart';

class UpcomingApartmentCard extends StatefulWidget {
  final ApartmentOverviewEntity apartment;

  const UpcomingApartmentCard({super.key, required this.apartment});

  @override
  State<UpcomingApartmentCard> createState() => _UpcomingApartmentCardState();
}

class _UpcomingApartmentCardState extends State<UpcomingApartmentCard> {
  @override
  Widget build(BuildContext context) {
    final apartment = widget.apartment;

    return Card(
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(apartment.rentalAmount, style: const TextStyle(
                      color: AppTheme.headingColor,
                      fontSize: 22),),
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      const ImageIcon(AssetImage("assets/icons/launch_date.png")),
                      Text(apartment.launchDate!.toIso8601String().split("T")[0], style: const TextStyle(
                          color: AppTheme.paragraphColor,
                          fontSize: 16),),
                    ],
                  ),
                ]),
                MaterialButton(onPressed: () {
                  SnackBarMessage.showSnackBar(message: "See details", context: context);
                },
                  color: AppTheme.primaryColor, child: const Text("See Details",
                  style: TextStyle(color: Colors.white, fontSize: 18),),)
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text("${DateTime.now().difference(apartment.launchDate!).inDays} days left", style: const TextStyle(
                    color: AppTheme.paragraphColor,
                    fontSize: 16),),
                ],
            ),
            LinearProgressIndicator(value: 0.7,),
            const SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
