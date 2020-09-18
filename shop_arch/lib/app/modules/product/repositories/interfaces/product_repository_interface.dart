import 'package:shop_arch/app/modules/product/models/product_model.dart';

abstract class IProductRepository {

  Future<List<ProductModel>> getAll();

  Future<void> add(ProductModel model);

  Future<void> update(ProductModel model);

  Future<void> delete(String id);
}
