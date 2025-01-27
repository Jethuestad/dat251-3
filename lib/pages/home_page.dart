import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utstyr/classes/listings.dart';
import 'package:utstyr/pages/detailedListing_page.dart';
import 'package:utstyr/pages/listing_page.dart';
import 'package:utstyr/pages/login_page.dart';
import 'package:utstyr/services/firestore_services.dart';
import 'package:utstyr/pages/messages_page.dart';
import 'package:utstyr/widgets.dart';
import 'package:utstyr/widgets/bottombar.dart';

import '../services/auth_services.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  static const String id = 'HomePage'; //Page identifier for navigation

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var allListings = Provider.of<List<Listings>>(context); //Listings provider
    var user = Provider.of<User?>(context); //User provider
    return Material(
        child: utstyrScaffold(
            //Top bar widget
            context,
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            'assets/images/boxwater.png',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                width: 300,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      )),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 15, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () => standardNavigator(
                                  context, ListingPage(category: 'topptur')),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      height: 70,
                                      child: Icon(
                                        Icons.nordic_walking,
                                        size: 35,
                                        color: Color(0xff2C4C16),
                                      ),
                                    ),
                                  ),
                                  Text("Topptur")
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                standardNavigator(
                                    context,
                                    ListingPage(
                                      category: 'alpint',
                                    ));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      height: 70,
                                      child: Icon(
                                        Icons.downhill_skiing,
                                        size: 35,
                                        color: Color(0xff2C4C16),
                                      ),
                                    ),
                                  ),
                                  Text("Alpint")
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                standardNavigator(
                                    context,
                                    ListingPage(
                                      category: 'snowboard',
                                    ));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      height: 70,
                                      child: Icon(
                                        Icons.snowboarding,
                                        size: 35,
                                        color: Color(0xff2C4C16),
                                      ),
                                    ),
                                  ),
                                  Text("Snowboard")
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                standardNavigator(
                                    context,
                                    ListingPage(
                                      category: 'sykkel',
                                    ));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      height: 70,
                                      child: Icon(
                                        Icons.pedal_bike,
                                        size: 35,
                                        color: Color(0xff2C4C16),
                                      ),
                                    ),
                                  ),
                                  Text("Sykkel")
                                ],
                              )),
                          InkWell(
                              onTap: () {
                                standardNavigator(
                                    context,
                                    ListingPage(
                                      category: 'camping',
                                    ));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      width: 80,
                                      height: 70,
                                      child: Icon(
                                        Icons.map,
                                        size: 35,
                                        color: Color(0xff2C4C16),
                                      ),
                                    ),
                                  ),
                                  Text("Camping")
                                ],
                              )),
                          InkWell(
                              child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  width: 80,
                                  height: 70,
                                  child: Icon(
                                    Icons.format_list_bulleted,
                                    size: 35,
                                    color: Color(0xff2C4C16),
                                  ),
                                ),
                              ),
                              Text("Alle kategorier")
                            ],
                          )),
                        ],
                      ),
                    ),
                    Text(
                      'Annonser du kanskje liker',
                      style: TextStyle(fontSize: 24),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 40),
                        child: Wrap(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                              child: GestureDetector(
                                onTap: () => {
                                  standardNavigator(
                                      context,
                                      SingleListingPage(
                                        listingId: 'Dp2K3VwY9ag1E0JrwVAs',
                                      ))
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  width: 275,
                                  height: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FirestoreServices()
                                                      .listingByID(allListings,
                                                          'Dp2K3VwY9ag1E0JrwVAs')
                                                      .title,
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                                Text(
                                                  'Størrelse: ' +
                                                      testList[0]['størrelse'],
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                )
                                              ],
                                            ),
                                            Text(
                                              FirestoreServices()
                                                      .listingByID(allListings,
                                                          'Dp2K3VwY9ag1E0JrwVAs')
                                                      .price
                                                      .toString() +
                                                  ' kr',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                            child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/dat251-3.appspot.com/o/Dp2K3VwY9ag1E0JrwVAs%2Fsplitboard1.png?alt=media&token=e12700ed-a5e6-46b0-beae-6cd5dcfa54b0',
                                          filterQuality: FilterQuality.medium,
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 25, 25, 25),
                              child: GestureDetector(
                                onTap: () => {
                                  standardNavigator(
                                      context,
                                      SingleListingPage(
                                        listingId:
                                            'e06a0bdd-2fee-4232-810c-26746bcaa163',
                                      ))
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  width: 275,
                                  height: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FirestoreServices()
                                                      .listingByID(allListings,
                                                          'e06a0bdd-2fee-4232-810c-26746bcaa163')
                                                      .title,
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                                Text(
                                                  'Størrelse: ' +
                                                      testList[1]['størrelse'],
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                )
                                              ],
                                            ),
                                            Text(
                                              FirestoreServices()
                                                      .listingByID(allListings,
                                                          'e06a0bdd-2fee-4232-810c-26746bcaa163')
                                                      .price
                                                      .toString() +
                                                  ' kr',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                            child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/dat251-3.appspot.com/o/e06a0bdd-2fee-4232-810c-26746bcaa16%2Fsykkel2.jpg?alt=media&token=28c364cf-37c6-4d35-adcd-871af977ef71',
                                          filterQuality: FilterQuality.medium,
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 25, 25, 25),
                              child: GestureDetector(
                                onTap: () => {
                                  standardNavigator(
                                      context,
                                      SingleListingPage(
                                        listingId: 'lB81f4rWaDheK4jsJZn6',
                                      ))
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  width: 275,
                                  height: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FirestoreServices()
                                                      .listingByID(allListings,
                                                          'lB81f4rWaDheK4jsJZn6')
                                                      .title,
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                                Text(
                                                  'Størrelse: ' +
                                                      testList[2]['størrelse'],
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                )
                                              ],
                                            ),
                                            Text(
                                              FirestoreServices()
                                                      .listingByID(allListings,
                                                          'lB81f4rWaDheK4jsJZn6')
                                                      .price
                                                      .toString() +
                                                  ' kr',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                            child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/dat251-3.appspot.com/o/lB81f4rWaDheK4jsJZn6%2Frandonee1.jpg?alt=media&token=5d4eaef9-84e6-43ac-9830-5a9353adb1b3',
                                          filterQuality: FilterQuality.medium,
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                    bottombar() //
                  ],
                ),
              ),
            )));
  }

  //List to mock database objects for "Listings near you" on home page.
  List testList = [
    {
      'title': 'Splitboard utstyr',
      'price': '100kr - 400kr',
      'størrelse': 'EU 44 - 160cm',
      'image': 'assets/images/splitboard1.png'
    },
    {
      'title': 'Kajakk',
      'price': '400kr',
      'størrelse': '18"',
      'image': 'assets/images/kajakk.png'
    },
    {
      'title': 'Randoneeski',
      'price': '200kr - 500kr',
      'størrelse': 'EU 45 - 168cm',
      'image': 'assets/images/randoneeski.png'
    }
  ];
}
