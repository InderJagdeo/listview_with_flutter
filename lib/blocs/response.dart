enum Status { loading, completed, error }

class Response<T> {
  Status status;
  T? data;
  String message = "";

  Response.loading(this.message)
      : status = Status.loading,
        data = null; // Initialize 'data' to null for loading status.
  Response.completed(this.data) : status = Status.completed;

  Response.error(this.message)
      : status = Status.error,
        data = null; // Initialize 'data' to null for error status.

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
