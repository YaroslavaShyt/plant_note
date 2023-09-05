class User{
  final String username;
  final String password;

  const User({required this.password, required this.username});

  factory User.fromSQFLite(Map<String, String> data){
    return User(
        username: data['username'] ?? 'username',
        password: data['password'] ?? 'password'
    );
  }
}