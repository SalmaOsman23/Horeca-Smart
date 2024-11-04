import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
          
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                
                  Text(
                    "listOfData['name']",
                    style: AppStyles.primaryColorTextW600Size14,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20)
                    ),
                child: Row(
                  children: [
                    Text("SvgPicture.asset(AppAssets.greenAlarmIconSvg),"),
                    const SizedBox(width: 4),
                    Text(
                      "listOfData['time']",
                      style: AppStyles.primaryColorTextW600Size12,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "${['description']}",
                        style: AppStyles.primaryColorTextW600Size14,
                        children: <TextSpan>[
                   //       if (listOfData['team-name'] != null)
                            TextSpan(
                              text: "listOfData['team-name']",
                              style: AppStyles.primaryColorTextW600Size16,
                            ),
                        ]),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white),
                    child: Icon(Icons.access_alarm),
                  ),
                  const SizedBox(width: 4),
                  Text("listOfData['location']",style: AppStyles.primaryColorTextW600Size12,)
                ],
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.white),
                    child: Icon(Icons.access_alarm),
                  ),
                  const SizedBox(width: 4),
                  Text("listOfData['date']",style: AppStyles.primaryColorTextW600Size16,)
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}