// ignore_for_file: unused_field

import 'package:e_mekdep_school_maps/pages/map_widgets/single_school_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:e_mekdep_school_maps/utilities/toast_message.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SchoolInfoScreen extends StatefulWidget {
  final String schoolName;
  final dynamic schoolFullname;
  final dynamic schoolAddress;
  final dynamic schoolPhone;
  final dynamic schoolEmail;
  final dynamic schoolDigitalized;
  final dynamic schoolGallery;
  final dynamic schoolLatitude;
  final dynamic schoolLongitude;

  const SchoolInfoScreen({
    super.key,
    required this.schoolName,
    required this.schoolFullname,
    required this.schoolAddress,
    required this.schoolPhone,
    required this.schoolEmail,
    required this.schoolDigitalized,
    required this.schoolGallery,
    required this.schoolLatitude,
    required this.schoolLongitude,
  });

  @override
  State<SchoolInfoScreen> createState() => _SchoolInfoScreenState();
}

class _SchoolInfoScreenState extends State<SchoolInfoScreen> {
  // Just empty column

  final PageController _pageController = PageController();
  final String _defaultImage = "assets/images/emekdep_logo.png";
  late double _latitude;
  late double _longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text(
          "E-Mekdep",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _tapWidget(),
              _schoolGalleries(),
              _infoSchool(),
            ],
          ),
        ),
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _tapWidget() {
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

  Widget _schoolGalleries() {
    return Card(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.schoolGallery != null && widget.schoolGallery is List
            ? Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.schoolGallery.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget.schoolGallery[index],
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
                    count: widget.schoolGallery.length,
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

  Widget _infoSchool() {
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
                if (widget.schoolName.isNotEmpty)
                  Text(
                    widget.schoolName,
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: widget.schoolDigitalized == null ||
                            !widget.schoolDigitalized
                        ? Colors.grey[300]
                        : Colors.green[800],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.schoolDigitalized == null ||
                              !widget.schoolDigitalized
                          ? 'Sanly ulgamda elyeter däl'
                          : 'Sanly ulgamda elyeter',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: widget.schoolDigitalized == null ||
                                !widget.schoolDigitalized
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                if (widget.schoolAddress != null &&
                    widget.schoolAddress.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 35.0,
                      ),
                      const SizedBox(width: 6.0),
                      Expanded(
                        child: Text(
                          widget.schoolAddress,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16.0),
                if (widget.schoolPhone != null && widget.schoolPhone.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 32.0,
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        "+993${widget.schoolPhone}",
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16.0),
                if (widget.schoolEmail != null && widget.schoolEmail.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        size: 32.0,
                      ),
                      const SizedBox(width: 6.0),
                      Expanded(
                        child: Text(
                          widget.schoolEmail,
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

  SpeedDial _floatingActionButton() {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.call),
          label: 'Jaň et',
          onTap: () => _checkPhoneNumber(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.mail),
          label: 'Hat ugrat',
          onTap: () => _checkEmailAddress(),
        ),
        SpeedDialChild(
          child: const Icon(Icons.location_on),
          label: 'Kartada görkez',
          onTap: () => _checkSchoolMap(),
        ),
      ],
    );
  }

  void _checkPhoneNumber() async {
    if (widget.schoolPhone != null &&
        widget.schoolPhone is String &&
        widget.schoolPhone.isNotEmpty) {
      String cleanedPhoneNumber =
          widget.schoolPhone.replaceAll('-', '').replaceAll(' ', '');
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

  void _checkEmailAddress() {
    if (widget.schoolEmail != null &&
        widget.schoolEmail is String &&
        widget.schoolEmail.isNotEmpty) {
      if (widget.schoolEmail.contains('@')) {
        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: widget.schoolEmail.toString(),
        );
        launchUrl(emailLaunchUri);
      } else {
        ToastMessages.toastErr(errorMessage: "Nädogry e-poçta adresi");
      }
    } else {
      ToastMessages.toastErr(errorMessage: "E-poçta adresi ýok");
    }
  }

  void _checkSchoolMap() {
    if ((widget.schoolLatitude != null) &&
        (widget.schoolLatitude is String) &&
        (widget.schoolLatitude.isNotEmpty)) {
      if ((widget.schoolLongitude != null) &&
          (widget.schoolLongitude is String) &&
          (widget.schoolLongitude.isNotEmpty)) {
        _latitude = double.parse(widget.schoolLatitude.toString());
        _longitude = double.parse(widget.schoolLongitude.toString());
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return SingleSchoolMapWidget(
                schoolName: widget.schoolName,
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
