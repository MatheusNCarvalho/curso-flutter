import 'package:shop_arch/app/modules/product/models/product_model.dart';
import 'package:shop_arch/app/modules/product/repositories/interfaces/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  @override
  Future<void> add(ProductModel model) {
      // TODO: implement add
      throw UnimplementedError();
    }
  
    @override
    Future<void> delete(String id) {
      // TODO: implement delete
      throw UnimplementedError();
    }
  
    @override
    Future<List<ProductModel>> getAll() {
      // TODO: implement getAll
      throw UnimplementedError();
    }
  
    @override
    Future<void> update(ProductModel model) {
    // TODO: implement update
    throw UnimplementedError();
  }

}
