class UserView {
  int id = 0;
  String userName = '';
  double height = 0;
  double weight = 0;

  UserView(this.id, this.userName, this.height, this.weight);
}

class RequestUser {
  String userName;
  double height;
  double weight;

  RequestUser({
    this.userName = '',
    this.height = 0,
    this.weight = 0,
  });
}
