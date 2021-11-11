import 'package:awesom/core/store.dart';
import 'package:awesom/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  /*
      //Singlaton calasses

        static final cartModel = CartModel.internal();
        CartModel.internal();

        factory CartModel() => cartModel;
*/

// CataLog Fields
  CatalogModel _catalog;

// Collections of IDS of each Items
  final List<int> _itemIds = [];

  // Get CataLog
  CatalogModel get catalog => _catalog;

  // Set Catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }
  // Get Items in the Cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
