// ****************Important Notes Here***************

// Creating a user model, a simple class, defining what properties the user is going to have
// When you create a new instance of the User class we can pass in the UID property.

class Users {
  final String uid;

  Users({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String coffeeShop;
  final double stars;

  UserData({this.uid, this.name, this.coffeeShop, this.stars});
}
