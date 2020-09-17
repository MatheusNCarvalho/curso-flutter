import 'package:shop_arch/app/modules/product/models/product_model.dart';

abstract class IProductRepository {

  Future<List<ProductModel>> get();

  Future<void> add(Map<String, dynamic> json);

  Future<void> update(Map<String, dynamic> json);
  
  Future<void> delete(String id);
}
