import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/util/content_cards.dart';
import 'package:pick_my_parcel_customer/util/order_confirmed_details.dart';

class ConfirmationDetailsCard extends StatelessWidget {
  final String courierName;
  final String imageAddress;
  final String deliveryDuration;
  final String charges;
  final String packageWeight;
  final String packageValue;
  final String shipmentType;
  final bool delivered;

  const ConfirmationDetailsCard(
      {   required this.courierName,
          required this.imageAddress,
          required this.deliveryDuration,
          required this.charges,
          required this.packageWeight,
          required this.packageValue,
          required this.shipmentType,
          required this.delivered});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ContentCards(
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.0225,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imageAddress),
                radius: screenWidth * 0.081,
              ),
              SizedBox(
                width: screenWidth * 0.044,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courierName,
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: screenHeight * 0.02,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.0056,
                  ),
                  Row(
                    children: [
                      Text(
                        'Charges: ',
                        style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.0158,
                            color: const Color(0xffB3B3B3)),
                      ),
                      Text(
                        charges,
                        style: TextStyle(
                          fontFamily: 'Prompt',
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0158,
                          color: delivered == true
                            ? const Color(0xffB3B3B3) : Colors.black
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.0056,
                  ),
                  Row(
                    children: [
                      Text(
                        'Estimated Delivery Day: ',
                        style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.0158,
                            color: const Color(0xffB3B3B3)),
                      ),
                      Text(
                        deliveryDuration,
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0158,
                            color: delivered == true
                                ? const Color(0xffB3B3B3) : Colors.black
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.0225,
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              const CategoryContentDisplay(
                  categoryName: 'Pickup Address', categoryContent: 'Delhi'),
              const CategoryContentDisplay(
                  categoryName: 'Delivery Address', categoryContent: 'Bangalore'),
              CategoryContentDisplay(
                  categoryName: 'Order Value', categoryContent: packageValue),
              CategoryContentDisplay(
                  categoryName: 'Applicable Weight', categoryContent: packageWeight),
              CategoryContentDisplay(
                  categoryName: 'Type of Shipment', categoryContent: shipmentType),
            ],
          )
        ],
      ),
    );
  }
}
