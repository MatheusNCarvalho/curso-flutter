abstract class ISharedRepository {
  setInstance();
  dynamic getValue<T>(String key);
  Future<bool> setValue<T>(
    String key,
    dynamic value,
  );
}
