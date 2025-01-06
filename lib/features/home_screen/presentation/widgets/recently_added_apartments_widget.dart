import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../../domain/entities/apartment_overview_entity.dart';
import 'apartment_widget_small.dart';

class RecentlyAddedApartmentSection extends StatefulWidget {
  final List<ApartmentOverviewEntity> recentlyAddedApartments;

  const RecentlyAddedApartmentSection(
      {super.key, required this.recentlyAddedApartments});

  @override
  State<RecentlyAddedApartmentSection> createState() =>
      _RecentlyAddedApartmentSectionState();
}

class _RecentlyAddedApartmentSectionState
    extends State<RecentlyAddedApartmentSection> {
  @override
  Widget build(BuildContext context) {
    final apartments = widget.recentlyAddedApartments;

    debugPrint("recentlyAddedApartmentsLength: ${apartments.length}");

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Text(
              "Recently Added",
              style: TextStyle(
                  color: AppTheme.headingColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                SnackBarMessage.showSnackBar(
                    message: "View all", context: context);
              },
              child: Text(
                "View all",
                style: TextStyle(color: AppTheme.primaryColor, fontSize: 16),
              ),
            )
          ],
        ),
        Flexible(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ApartmentCardSmall(apartment: apartments[index]);
            },
            itemCount: apartments.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
