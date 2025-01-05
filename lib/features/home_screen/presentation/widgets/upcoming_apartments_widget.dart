import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../../domain/entities/apartment_overview_entity.dart';
import 'upcoming_apartment_widget.dart';

class UpcomingApartmentSection extends StatefulWidget {
  final List<ApartmentOverviewEntity> upcomingApartments;

  const UpcomingApartmentSection({super.key, required this.upcomingApartments});

  @override
  State<UpcomingApartmentSection> createState() =>
      _UpcomingApartmentSectionState();
}

class _UpcomingApartmentSectionState extends State<UpcomingApartmentSection> {
  @override
  Widget build(BuildContext context) {
    final apartments = widget.upcomingApartments;

    debugPrint("upcomingApartmentsLength: ${apartments.length}");

    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Upcoming",
              style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
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
                style: TextStyle(color: AppTheme.primaryColor),
              ),
            )
          ],
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: apartments.length,
            itemBuilder: (context, index) => UpcomingApartmentCard(
                  apartment: apartments[index],
                )),
      ],
    );
  }
}
