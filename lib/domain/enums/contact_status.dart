enum ContactStatus {
  lead,
  cancelled,
  customer;

  @override
  String toString() {
    // final name = this.name;
    return name[0].toUpperCase() + name.substring(1);
  }

  static ContactStatus fromString(String status) {
    return switch (status.toLowerCase()) {
      'lead' => ContactStatus.lead,
      'cancelled' => ContactStatus.cancelled,
      'customer' => ContactStatus.customer,
      _ => ContactStatus.lead,
    };
  }
}
