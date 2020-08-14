abstract class ILocalStorage {
  Future get(String key);
  Future delete(String key);
  Future insert(String key, dynamic value);
}
