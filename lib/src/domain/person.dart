import 'description/description.dart';
import 'name/name.dart';
import 'rating/rating.dart';
import 'surname/surname.dart';
import 'url/url.dart';

class Person {
  final Url imageUrl;
  final Name name;
  final Surname surname;
  final Rating rating;
  final Description description;
  Person({
    required this.imageUrl,
    required this.name,
    required this.surname,
    required this.rating,
    required this.description,
  });

  Person copyWith({
    Url? imageUrl,
    Name? name,
    Surname? surname,
    Rating? rating,
    Description? description,
  }) {
    return Person(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      rating: rating ?? this.rating,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Person(imageUrl: $imageUrl, name: $name, surname: $surname, rating: $rating, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.surname == surname &&
        other.rating == rating &&
        other.description == description;
  }

  @override
  int get hashCode {
    return imageUrl.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        rating.hashCode ^
        description.hashCode;
  }
}
