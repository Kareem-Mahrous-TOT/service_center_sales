abstract class EndPoints {
  static const String baseUrl =
      "https://6bbc2c8a-f98c-40e7-bb12-e96e3d6917e1.mock.pstmn.io/";
  // "https://e5c9997b-4a40-4067-81b9-6e9e6bb9804d.mock.pstmn.io/";
  // "http://192.168.1.59:5252/api/";
  static const String login = "Auth/Login";
  static const String product = "Product";
  static const String searchProductsByText = "$product/search";
  static const String searchProductsByCategory =
      "$product/searchByProductCategory";
  static const String searchProductsByBrand = "$product/searchByProductBrand";
  static const String service = "Service";
  static const String searchServicesByText = "$service/search";
  static const String offer = "Offer";
  static const String serviceCategory = "ServiceCategory";
  static const String servicePackage = "ServicePackage";
  static const String appointment = "Appointment";
  static const String contact = "Contact";
}
