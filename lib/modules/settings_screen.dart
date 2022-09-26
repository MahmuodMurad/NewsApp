import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'ae',
      'ar',
      'at',
      'au',
      'be',
      'bg',
      'br',
      'ca',
      'ch',
      'cn',
      'co',
      'cu',
      'cz',
      'de',
      'eg',
      'fr',
      'gb',
      'gr',
      'hk',
      'hu',
      'id',
      'ie',
      'il',
      'in',
      'it',
      'jp',
      'kr',
      'lt',
      'lv',
      'ma',
      'mx',
      'my',
      'ng',
      'nl',
      'no',
      'nz',
      'ph',
      'pl',
      'pt',
      'ro',
      'rs',
      'ru',
      'sa',
      'se',
      'sg',
      'si',
      'sk',
      'th',
      'tr',
      'tw',
      'ua',
      'us',
      've',
      'za',
    ];

    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 42),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          'Change Country:',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select Country',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              NewsCubit()
                                  .changeCountry(cent: value, context: context);
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.amber,
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 50,
                            buttonWidth: 160,
                            buttonPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.amber,
                                width: 2,
                              ),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            buttonElevation: 2,
                            itemHeight: 40,
                            itemPadding: const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 200,
                            dropdownWidth: 200,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-20, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          'Change Mood:',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 140,
                        ),
                        FlutterSwitch(
                          width: 100.0,
                          height: 55.0,
                          toggleSize: 45.0,
                          toggleColor: Theme.of(context).primaryColor,
                          value: NewsCubit.get(context).isDark,
                          borderRadius: 30.0,
                          padding: 2.0,
                          activeSwitchBorder: Border.all(
                            color: Colors.amber,
                            width: 6.0,
                          ),
                          inactiveSwitchBorder: Border.all(
                            color: Colors.amber,
                            width: 6.0,
                          ),
                          activeColor: Colors.amber,
                          inactiveColor: Colors.amber,
                          activeIcon: const Icon(
                            Icons.sunny,
                            color: Colors.black,
                            size: 24,
                          ),
                          inactiveIcon: const Icon(
                            Icons.dark_mode,
                            color: Colors.white,
                            size: 24,
                          ),
                          onToggle: (val) {
                            NewsCubit.get(context).changeAppMode();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
