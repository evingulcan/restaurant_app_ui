import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/reservation_page/viewModel/reservation_view_model.dart';

class PersonDateTimeWidget extends StatefulWidget {
  const PersonDateTimeWidget({Key? key}) : super(key: key);

  @override
  State<PersonDateTimeWidget> createState() => _PersonDateTimeWidgetState();
}

class _PersonDateTimeWidgetState extends State<PersonDateTimeWidget> {
  void _showBottomSheet(BuildContext context) {
    var toTimeList = context.read<ReservationViewModel>().toTimeList;
    var toTimeListSelect =
        context.read<ReservationViewModel>().toTimeListSelect;
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: context.dynamicHeight(0.40),
        child: Column(
          children: <Widget>[
            //Person Container
            Expanded(
              child: Consumer(
                builder: ((context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: toTimeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: context.cardPadding,
                        child: GestureDetector(
                          child: Container(
                            height: context.dynamicHeight(0.15),
                            width: context.dynamicWidth(0.15),
                            padding: context.personPadding,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: toTimeListSelect[index]
                                    ? AppColors.poppypower
                                    : AppColors.black,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              toTimeList[index],
                              style: TextStyle(
                                  color: toTimeListSelect[index]
                                      ? AppColors.poppypower
                                      : AppColors.black,
                                  fontSize: 16),
                            )),
                          ),
                          onTap: () {
                            context.read<ReservationViewModel>().selectedToTime;
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
            //DateTime
            Center(
              child: SizedBox(
                  height: context.dynamicHeight(0.15),
                  child: Consumer(
                    builder: ((context, value, child) {
                      return CupertinoDatePicker(
                        minimumDate:
                            DateTime.now().subtract(const Duration(days: 1)),
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        onDateTimeChanged: (DateTime dateTime) {
                          context.read<ReservationViewModel>().formattedDate;
                        },
                      );
                    }),
                  )),
            ),
            SizedBox(height: context.dynamicHeight(0.04)),
            Center(
              child: SizedBox(
                width: context.dynamicWidth(0.70),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  child: const Text(StringConstant.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePadding,
      child: Container(
        height: context.dynamicHeight(0.05),
        width: context.dynamicWidth(0.65),
        decoration: context.colormiddelDecoraiton,
        child: Center(
          child: Row(children: [
            Padding(
              padding: context.cardPadding,
              child: const Icon(Icons.person_outline, color: AppColors.black),
            ),
            TextButton(
                onPressed: () => _showBottomSheet(context),
                child: Consumer(
                  builder: ((context, value, child) {
                    return Text(
                      '${context.read<ReservationViewModel>().selectedToTime} ${context.read<ReservationViewModel>().formattedDate} ',
                      style: const TextStyle(
                        color: AppColors.black,
                      ),
                    );
                  }),
                )),
          ]),
        ),
      ),
    );
  }
}
