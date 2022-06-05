import 'package:flutter/material.dart';
import 'package:know_your_state/modal/state_model.dart';
import 'package:know_your_state/utils/app_colors.dart';
// import 'package:url_launcher/url_launcher.dart';

class StateDetails extends StatefulWidget {
  static const String routeName = '/stateDetails';

  const StateDetails({Key? key}) : super(key: key);

  @override
  State<StateDetails> createState() => _StateDetailsState();
}

class _StateDetailsState extends State<StateDetails> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final StatesOfIndia stateInfo =
        ModalRoute.of(context)!.settings.arguments as StatesOfIndia;

    return Scaffold(
      backgroundColor: isTap ? blackColor : whiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isTap ? cardColor : whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: IconButton(
          ///handling the back button by myself;
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: isTap ? whiteColor : blackColor,
          ),
        ),
        title: Text(
          stateInfo.stateName,
          style: TextStyle(
            color: isTap ? whiteColor : blackColor,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          stateCapitalOfWebsite(stateInfo),
          districtsBlockVillage(stateInfo),
          areaDensityPopulationLiteracy(
              stateInfo), // area, density, population, literacy
          noOfMaleFemales(stateInfo),
          aboutState(stateInfo),
        ],
      ),
    );
  }

  Widget stateCapitalOfWebsite(StatesOfIndia stateInfo) {
    return Card(
      color: isTap ? cardColor : whiteColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      // verticalDirection:
                      //     VerticalDirection.up, // <-- reverse direction
                      children: [
                        Text(
                          stateInfo.stateName,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: isTap ? whiteColor : Colors.black87,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '( ${stateInfo.dateOfFormation} )',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  stateInfo.captial,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2.0,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'Official link',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget districtsBlockVillage(StatesOfIndia stateInfo) {
    return Card(
      color: isTap ? cardColor : whiteColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'No. Of District',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.districts}',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'No. Of Block',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.blocks}',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'No. Of Village',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.villages}',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget areaDensityPopulationLiteracy(StatesOfIndia stateInfo) {
    return Card(
      color: isTap ? cardColor : whiteColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Area',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.area} sq km',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Density',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.density} Km2',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Population',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.population}',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Literacy Rate',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.literacyRate}%',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noOfMaleFemales(StatesOfIndia stateInfo) {
    return Card(
      color: isTap ? cardColor : whiteColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Males Population',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.males}',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Females Population ',
                    style: TextStyle(
                      color: isTap ? whiteColor : Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${stateInfo.females}',
                    style: TextStyle(
                      fontSize: 13,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutState(StatesOfIndia stateInfo) {
    return Card(
      color: isTap ? cardColor : whiteColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isTap ? whiteColor : Colors.black,
                          letterSpacing: 1.0)),
                  const SizedBox(height: 7),
                  Text(
                    stateInfo.about,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    maxLines: isExpanded ? 500 : 6,
                    style: TextStyle(
                      fontSize: 16,
                      color: isTap ? Colors.white60 : Colors.black54,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = isExpanded ? false : true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isExpanded
                            ? const Text(
                                "Show Less",
                                style: TextStyle(color: Colors.blue),
                              )
                            : const Text("Show More",
                                style: TextStyle(color: Colors.blue))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
