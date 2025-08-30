class Vendor {
  final String name;
  final String description;
  final String address;

  const Vendor({
    required this.name,
    required this.description,
    required this.address,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      name: json['name'] as String,
      description: json['description'] as String,
      address: json['address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'address': address,
    };
  }



  Vendor copyWith({
    String? name,
    String? description,
    String? address,
  }) {
    return Vendor(
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'Vendor(name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Vendor && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
