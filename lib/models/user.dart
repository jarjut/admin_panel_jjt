import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String name;

  const User({
    required this.username,
    this.name = 'Admin',
  });

  /// Empty user which represents an unauthenticated user.
  static const empty = User(username: '');

  @override
  List<Object?> get props => [username, name];
}
