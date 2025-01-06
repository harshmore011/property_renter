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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [
                  Text(
                    apartment.rentalAmount,
                    style: const TextStyle(
                        color: AppTheme.headingColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const ImageIcon(
                          AssetImage("assets/icons/launch_date.png")),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        apartment.launchDate!.toIso8601String().split("T")[0],
                        style: const TextStyle(
                            color: AppTheme.paragraphColor, fontSize: 16),
                      ),
                    ],
                  ),
                ]),
                MaterialButton(
                  height: 50,
                  // minWidth: 150,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () {
                    SnackBarMessage.showSnackBar(
                        message: "See details", context: context);
                  },
                  color: AppTheme.primaryColor,
                  child: const Text(
                    "See Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "27 days left",
                  style: const TextStyle(
                      color: AppTheme.paragraphColor, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            LinearProgressIndicator(
              value: 0.6,
              minHeight: 6,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
