import '../models/vendor.dart';
import 'base_controller.dart';

class VendorController extends BaseController {
  List<Vendor> _vendors = [];
  List<Vendor> _filteredVendors = [];
  String _searchQuery = '';
  List<Vendor> get vendors => _filteredVendors;
  List<Vendor> get allVendors => _vendors;
  String get searchQuery => _searchQuery;

  VendorController() {
    _loadMockVendors();
  }
  void _loadMockVendors() {
    _vendors = [
      Vendor(
        name: 'Lucky Star Lottery',
        description:
            'Your trusted lottery destination with the best odds and biggest prizes.',
        address: '123 Main Street, New York, NY',
      ),
      Vendor(
        name: 'Golden Ticket Hub',
        description:
            'Premium lottery services with exclusive VIP packages and instant wins.',
        address: '456 Oak Avenue, Los Angeles, CA',
      ),
      Vendor(
        name: 'Fortune Wheel',
        description:
            'Spin your way to fortune with our innovative lottery games and daily draws.',
        address: '789 Pine Street, Chicago, IL',
      ),
      Vendor(
        name: 'Dream Numbers',
        description:
            'Where dreams come true with our carefully selected lucky numbers.',
        address: '321 Elm Street, Miami, FL',
      ),
      Vendor(
        name: 'Mega Win Center',
        description:
            'Experience the thrill of mega jackpots and life-changing wins.',
        address: '654 Maple Drive, Houston, TX',
      ),
      Vendor(
        name: 'Lucky Charm Store',
        description:
            'Your lucky charm for winning lottery numbers and good fortune.',
        address: '987 Cedar Lane, Phoenix, AZ',
      ),
    ];

    _filteredVendors = List.from(_vendors);
    notifyListeners();
  }

  void searchVendors(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void _applyFilters() {
    if (_searchQuery.isEmpty) {
      _filteredVendors = List.from(_vendors);
    } else {
      final query = _searchQuery.toLowerCase();
      _filteredVendors = _vendors.where((vendor) {
        return vendor.name.toLowerCase().contains(query) ||
            vendor.description.toLowerCase().contains(query) ||
            vendor.address.toLowerCase().contains(query);
      }).toList();
    }

    notifyListeners();
  }

  /// Refresh vendors data
  Future<void> refreshVendors() async {
    await handleAsyncOperation(() async {
      await Future.delayed(const Duration(seconds: 1));
      _loadMockVendors();
    });
  }

  /// Clear search filter
  void clearFilters() {
    _searchQuery = '';
    _filteredVendors = List.from(_vendors);
    notifyListeners();
  }
}
