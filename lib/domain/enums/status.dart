enum Status {
  pending,
  approved,
  cancelled;

  static Status fromString(String status) {
    return switch (status.toLowerCase()) {
      'Pending' => Status.pending,
      'Approved' => Status.approved,
      'Cancelled' => Status.cancelled,
      _ => Status.pending,
    };
  }
}
