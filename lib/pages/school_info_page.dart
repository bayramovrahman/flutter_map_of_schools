import 'package:e_mekdep_school_maps/pages/map_widgets/single_school_widget.dart';
import 'package:e_mekdep_school_maps/utilities/toast_message.dart';
import 'package:e_mekdep_school_maps/widgets/appbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_mekdep_school_maps/models/school_model.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_mekdep_school_maps/cubits/cubit_school_info/school_info_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class SchoolInfoPage extends StatefulWidget {
  const SchoolInfoPage({super.key});

  @override
  State<SchoolInfoPage> createState() => _SchoolInfoPageState();
}

class _SchoolInfoPageState extends State<SchoolInfoPage> {
  // Just empty column

  final PageController _pageController = PageController();
  final String _defaultImage = "assets/images/emekdep_logo.png";
  late double _latitude;
  late double _longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: BlocBuilder<SchoolInfoCubit, SchoolInfoState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (schoolInfo) {
              final school = schoolInfo.first;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _tapWidget(context),
                      _schoolGalleries(context: context, school: school),
                      _infoSchool(school: school),
                    ],
                  ),
                ),
              );
            },
            error: (errMsg) => const Center(
              child: Text(
                "Näsazlyk ýüza çykdy!",
              ),
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<SchoolInfoCubit, SchoolInfoState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (schoolInfo) {
              final school = schoolInfo.first;
              return _floatingActionButton(school: school);
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _tapWidget(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 32.0,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Mekdep barada",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _schoolGalleries({required BuildContext context, required SchoolModel school}) {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: school.galleries != null && school.galleries is List
            ? Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: school.galleries.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          school.galleries[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              _defaultImage,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: school.galleries.length,
                    effect: const WormEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                      spacing: 8.0,
                    ),
                    onDotClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              )
            : SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Center(
                  child: Image.asset(
                    _defaultImage,
                  ),
                ),
              ),
      ),
    );
  }

  Widget _infoSchool({required SchoolModel school}) {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (school.name != null && school.name!.isNotEmpty)
                  Text(
                    school.name.toString(),
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                    child: Text(
                      school.level != null && school.level is String && school.level!.isNotEmpty && school.level == "special"
                          ? "Ýöriteşdirilen"
                          : "Adaty",
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: school.isDigitalized == null ||
                            school.isDigitalized == false
                        ? Colors.grey[300]
                        : Colors.green[800],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                    child: Text(
                      school.isDigitalized == null || school.isDigitalized == false
                          ? 'Sanly ulgamda elyeter däl'
                          : 'Sanly ulgamda elyeter',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: school.isDigitalized == null || school.isDigitalized == false
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                if (school.address != null && school.address!.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 35.0,
                      ),
                      const SizedBox(width: 6.0),
                      Expanded(
                        child: Text(
                          school.address.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16.0),
                if (school.phone != null && school.phone!.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 32.0,
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        "+993${school.phone}",
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16.0),
                if (school.email != null && school.email.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        size: 32.0,
                      ),
                      const SizedBox(width: 6.0),
                      Expanded(
                        child: Text(
                          school.email,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SpeedDial _floatingActionButton({required SchoolModel school}) {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.call),
          label: 'Jaň et',
          onTap: () => _checkPhoneNumber(school: school),
        ),
        SpeedDialChild(
          child: const Icon(Icons.mail),
          label: 'Hat ugrat',
          onTap: () => _checkEmailAddress(school: school),
        ),
        SpeedDialChild(
          child: const Icon(Icons.location_on),
          label: 'Kartada görkez',
          onTap: () => _checkSchoolMap(school: school),
        ),
      ],
    );
  }

  void _checkPhoneNumber({required SchoolModel school}) async {
    if (school.phone != null &&
        school.phone is String &&
        school.phone!.isNotEmpty) {
      String cleanedPhoneNumber =
          school.phone!.replaceAll('-', '').replaceAll(' ', '');
      String phoneNumber = "tel:+993$cleanedPhoneNumber";
      if (await canLaunchUrl(Uri.parse(phoneNumber))) {
        await launchUrl(Uri.parse(phoneNumber));
      } else {
        throw 'Nädogry telefon belgisi: $phoneNumber';
      }
    } else {
      ToastMessages.toastErr(errorMessage: "Telefon belgisi ýok");
    }
  }

  void _checkEmailAddress({required SchoolModel school}) {
    if (school.email != null &&
        school.email is String &&
        school.email.isNotEmpty) {
      if (school.email.contains('@')) {
        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: school.email.toString(),
        );
        launchUrl(emailLaunchUri);
      } else {
        ToastMessages.toastErr(errorMessage: "Nädogry e-poçta adresi");
      }
    } else {
      ToastMessages.toastErr(errorMessage: "E-poçta adresi ýok");
    }
  }

  void _checkSchoolMap({required SchoolModel school}) {
    if ((school.latitude != null) &&
        (school.latitude is String) &&
        (school.latitude!.isNotEmpty)) {
      if ((school.longitude != null) &&
          (school.longitude is String) &&
          (school.longitude!.isNotEmpty)) {
        _latitude = double.parse(school.latitude.toString());
        _longitude = double.parse(school.longitude.toString());
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return SingleSchoolMapWidget(
                schoolName: school.name.toString(),
                latitude: _latitude,
                longitude: _longitude,
              );
            },
          ),
        );
      } else {
        ToastMessages.toastErr(errorMessage: "Ýerleşyän ýeri görkezilmedik");
      }
    } else {
      ToastMessages.toastErr(errorMessage: "Ýerleşyän ýeri görkezilmedik");
    }
  }

  // Just empty column
}
