import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuple/tuple.dart';

class Listings {
  final String listingID;
  final String title;
  final String description;
  final DateTime availableFrom;
  final DateTime availableTo;
  final String category;
  final int price;
  final List gear;
  final Tuple2<double, double> location;

  Listings(
      {required this.listingID,
      required this.title,
      required this.description,
      required this.availableFrom,
      required this.availableTo,
      required this.category,
      required this.price,
      required this.gear,
      required this.location});

  factory Listings.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data()! as Map;
    return Listings(
        listingID: doc.id,
        title: data['title'] ?? 'Title',
        description: data['description'] ?? 'Description',
        availableFrom: data['availableFrom'].toDate() ?? DateTime.now(),
        availableTo: data['availableTo'].toDate() ?? DateTime.now(),
        category: data['category'] ?? 'Category',
        price: data['price'] ?? 'Price',
        gear: data['gear'] ?? 'Gear',
        location: data['location'] ?? 'Location');
  }

  String getLisitngID() {
    return listingID;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }

  int getPrice() {
    return price;
  }
}
