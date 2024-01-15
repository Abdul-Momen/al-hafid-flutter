import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class WishlistModel {
  int id;
  String title;
  String status;
  String image;
  String price;
  String stock;
  bool isFavorite;
  String adminGraphQlapiId;
  int quantity;

  WishlistModel({
    this.id = 0,
    required this.title,
    required this.status,
    required this.image,
    required this.price,
    required this.stock,
    required this.isFavorite,
    required this.adminGraphQlapiId,
     this.quantity=1,
  });
}
