import 'package:aqar/core/responsive/dimension.dart';
import 'package:aqar/core/utilts/colors.dart';
import 'package:aqar/core/widget/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppBarWithTabs extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget icon;
  final String? title;
  final bool? withTaps;
  final double size;
  final bool? defaultBackButton;
  final bool? isTransparnce;

  CustomAppBarWithTabs({
    super.key,
    required this.icon,
    this.title,
    this.withTaps,
    required this.size,
    this.defaultBackButton = true,
    this.isTransparnce = false,
  });

  List<String> tapsLabels = [
    'all'.tr(),
    'villasForSale'.tr(),
    'landsForSale'.tr(),
  ];

  @override
  Size get preferredSize =>
      Size.fromHeight(size); // Adjust height to fit design

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: defaultBackButton!,
      backgroundColor:
          isTransparnce! ? Colors.transparent : white, // manage background color
      elevation: 0, // No shadow or elevation
      title: CustomText(
        text: title ?? '',
        textColor: blackColor,
        fontSizes: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        IconButton(
          icon: icon, // Favorite icon in black
          onPressed: () {
            // Handle favorite icon action
          },
        ),
      ],
      bottom: withTaps == true
          ? PreferredSize(
              preferredSize: Size.fromHeight(60), // Height for the TabBar area
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      // height: 50, // Height for the icon tab
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              mainGreenColor, // Green border for the icon tab
                        ),
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.filter_list,
                              size: 15, color: blackColor), // Black filter icon
                          SizedBox(width: 4),
                          CustomText(
                            text: 'filter'.tr(),
                            textColor: blackColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        // width: 300.w,
                        height: 40.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 12,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: tapsLabels.length,
                          itemBuilder: (context, index) {
                            return Tab(
                              child: GestureDetector(
                                onTap: () {
                                  print('index $index');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  height: 40.h, // Height to match the design
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          mainGreenColor, // Green border for unselected tabs
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        10), // Rounded corners
                                  ),
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    text: tapsLabels[index],
                                    textColor: blackColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
