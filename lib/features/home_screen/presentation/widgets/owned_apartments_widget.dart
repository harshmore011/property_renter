import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../../domain/entities/apartment_overview_entity.dart';
import 'apartment_widget.dart';

class OwnedApartmentsSection extends StatefulWidget {
  final List<ApartmentOverviewEntity> ownedApartments;

  const OwnedApartmentsSection(
      {super.key, required this.ownedApartments});

  @override
  State<OwnedApartmentsSection> createState() =>
      _OwnedApartmentsSectionState();
}

class _OwnedApartmentsSectionState
    extends State<OwnedApartmentsSection> {
  @override
  Widget build(BuildContext context) {
    final apartments = widget.ownedApartments;

    debugPrint("ownedApartmentsLength: ${apartments.length}");

    return Column(
      children: [
        Row(
          children: [
            const Text(
              "My Properties",
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
          // controller: ScrollController().,
          // shrinkWrap: true,
          itemBuilder: (context, index) {
            return ApartmentCard(apartment: apartments[index]);

            // return _getBenefitCards(apartments)[index];
          },
          itemCount: apartments.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}
