import '../domain/description/description.dart';
import '../domain/name/name.dart';
import '../domain/rating/rating.dart';
import '../domain/surname/surname.dart';
import '../domain/url/url.dart';
import '../domain/person.dart';

class PersonDto {
  const PersonDto._({
    required this.imageUrl,
    required this.name,
    required this.surname,
    required this.rating,
    required this.description,
  });
  final String imageUrl;
  final String name;
  final String surname;
  final double rating;
  final String description;

  static PersonDto fromJson(Map<String, dynamic> json) {
    return PersonDto._(
      imageUrl: json['imageUrl'],
      name: json['name'],
      surname: json['surname'],
      rating: json['rating'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'surname': surname,
      'rating': rating,
      'description': description,
    };
  }

  static PersonDto fromDomain(Person domain) {
    return PersonDto._(
      imageUrl: domain.imageUrl.getOrCrash(),
      name: domain.name.getOrCrash(),
      surname: domain.surname.getOrCrash(),
      rating: domain.rating.getOrCrash(),
      description: domain.description.getOrCrash(),
    );
  }

  Person toDomain() {
    return Person(
      imageUrl: Url(imageUrl),
      name: Name(name),
      surname: Surname(surname),
      rating: Rating(rating),
      description: Description(description),
    );
  }
}
