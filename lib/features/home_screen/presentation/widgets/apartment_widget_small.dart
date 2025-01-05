
import 'package:flutter/material.dart';
import '../../domain/entities/apartment_overview_entity.dart';

class ApartmentCardSmall extends StatefulWidget {
  final ApartmentOverviewEntity apartment;

  const ApartmentCardSmall({super.key, required this.apartment});

  @override
  State<ApartmentCardSmall> createState() => _ApartmentCardSmallState();
}

class _ApartmentCardSmallState extends State<ApartmentCardSmall> {
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
          width: 180,
          height: 300,
          // constraints: BoxConstraints(maxHeight: ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/image.png"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(apartment.apartmentName, style: const TextStyle(
                  color: Colors.white,overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold, fontSize: 16),),
              const SizedBox(height: 6,),
              // benefit.supportingImage,
              Row(
                children: [
                  const ImageIcon(AssetImage("assets/icons/Group.png")),
                  Text(apartment.location, style: const TextStyle(
                      color: Colors.white,overflow: TextOverflow.ellipsis,
                      fontSize: 12),),
                ],
              ),
              const SizedBox(height: 6,),
              Row(
                children: [
                  Text(apartment.rentalAmount, style: const TextStyle(
                      color: Colors.white,overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold, fontSize: 12),),
                  const Spacer(),
                  if(apartment.isVerified != null && apartment.isVerified == true)
                  const ImageIcon(AssetImage("assets/icons/badge-check-24.png")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
