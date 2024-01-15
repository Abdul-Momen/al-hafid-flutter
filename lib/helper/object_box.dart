import 'dart:io';

import 'package:alhafidh/objectbox.g.dart';
import 'package:alhafidh/states/models/wishlist_model.dart';
import 'package:objectbox/objectbox.dart';


class ObjectBox {
  late final Store _store;
  late final Box<WishlistModel> _wishlistBox;

  ObjectBox._init(this._store) {
    _wishlistBox = Box<WishlistModel>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();

    if (Sync.isAvailable()) {
      /// Or use the ip address of your server
      //final ipSyncServer = '123.456.789.012';
      final ipSyncServer = Platform.isAndroid ? '10.0.2.2' : '127.0.0.1';
      final syncClient = Sync.client(
        store,
        'ws://$ipSyncServer:9999',
        SyncCredentials.none(),
      );
      syncClient.connectionEvents.listen(print);
      syncClient.start();
    }

    return ObjectBox._init(store);
  }

  WishlistModel? getWishlist(int id) => _wishlistBox.get(id);

  Stream<List<WishlistModel>> getWishlists() => _wishlistBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int insertWishlist(WishlistModel wishlistModel) =>
      _wishlistBox.put(wishlistModel);

  bool deleteWishlist(int id) => _wishlistBox.remove(id);
}
