/// Central place for all API endpoint paths.
class ApiEndpoints {
  ApiEndpoints._(); // Create a private constructor so this utility class cannot normally be instantiated from outside this Dart library.
                    // The purpose is to stop other files from creating an instance
  // Auth
  static const String register = '/register';
  static const String login = '/login';
  static const String logout = '/logout';

  // Categories
  static const String categories = '/categories';
  static String category(int id) => '/category/$id';

  // Products
  static const String products = '/products';
  static String product(int id) => '/product/$id';
  static const String featuredProducts = '/featured-products';

  // Cart
  static const String carts = '/carts';
  static const String cart = '/cart';
  static String cartItem(int id) => '/cart/$id';

  // Orders
  static const String orders = '/orders';
  static const String order = '/order';
  static String orderById(int id) => '/order/$id';

}
