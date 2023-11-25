class AppConstants {
  static const appName = 'D Laundry';

  static const _host = 'http://50.50.0.204:8000';

  /// ``` baseURL = 'http://50.50.0.204:8000/api' ```
  static const baseURL = '$_host/api';

  /// ``` baseURL = 'http://50.50.0.204:8000/storage' ```
  static const baseImageURL = '$_host/storage';

  static const laundryStatusCategory = [
    'All',
    'Pickup',
    'Queue',
    'Process',
    'Washing',
    'Dried',
    'Ironed',
    'Done',
    'Delivery'
  ];
}
