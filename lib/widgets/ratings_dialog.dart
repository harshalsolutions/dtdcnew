import 'package:flutter/material.dart';
import 'package:pick_my_parcel_customer/constants/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void showRatingsDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          child: SizedBox(
            width: 360.0,
            height: 233.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 15.7, right: 15.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close_rounded)),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Rate',
                            style: TextStyle(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RatingBar(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: Colors.black,
                            glow: false,
                            itemSize: 25.0,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            ratingWidget: RatingWidget(
                              empty: const Icon(
                                Icons.star_border_rounded,
                                color: Colors.black,
                              ),
                              half: const Icon(
                                Icons.star_half_rounded,
                                color: primaryColor1,
                              ),
                              full: const Icon(
                                Icons.star_rounded,
                                color: primaryColor1,
                              ),
                            ),
                            onRatingUpdate: (rating) {
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 17.0,
                      ),
                      const Text(
                        'Feedback',
                        style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 285.0,
                        ),
                        child: TextFormField(
                          maxLines: 3,
                          style: const TextStyle(
                            fontFamily: 'PT Sans',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            hintText:
                                'Please let us know your valuable feedback... ',
                            hintStyle: const TextStyle(
                              fontFamily: 'PT Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              color: Color(0xffC1C1C1),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffCDCDCD)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                color: Color(0xffCDCDCD),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
