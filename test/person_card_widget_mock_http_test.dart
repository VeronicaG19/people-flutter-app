import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:people_app/src/domain/name/name.dart';
import 'package:people_app/src/domain/person.dart';
import 'package:people_app/src/domain/rating/rating.dart';
import 'package:people_app/src/domain/surname/surname.dart';
import 'package:people_app/src/domain/description/description.dart' as desc;
import 'package:people_app/src/domain/url/url.dart';
import 'package:people_app/src/presentation/widgets/person_card_widget.dart';
import 'mock_http_client.dart';

const _imageUrl =
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80';

void main() {
  setUp(() async {
    registerFallbackValue(Uri());

    // Load an image from assets and transform it from bytes to List<int>
    final _imageByteData = await rootBundle.load('assets/images/image.png');
    final _imageIntList = _imageByteData.buffer.asInt8List();

    final _requestsMap = {
      Uri.parse(_imageUrl): _imageIntList,
    };

    HttpOverrides.global = MockHttpOverrides(_requestsMap);
  });

  testWidgets('Test PersonCardWidget widget mocking HTTP Client',
      (WidgetTester tester) async {
    final _person = Person(
      imageUrl: Url(_imageUrl),
      name: Name('Ana'),
      surname: Surname('Rodríguez'),
      rating: Rating(4),
      description:
          desc.Description('I will blow your mind with my superpower.'),
    );

    await tester.pumpWidget(MyWidget(person: _person));

    final _imageFinder =
        find.image(NetworkImage(_person.imageUrl.getOrCrash()));
    final _fullNameFinder = find
        .text('${_person.name.getOrCrash()} ${_person.surname.getOrCrash()}');
    final _ratingFinder =
        find.text(_person.rating.getOrCrash().toInt().toString());
    final _starIconFinder = find.byIcon(Icons.star);
    final _descriptionFinder = find.text(_person.description.getOrCrash());

    expect(_imageFinder, findsOneWidget);
    expect(_fullNameFinder, findsOneWidget);
    expect(_ratingFinder, findsOneWidget);
    expect(_starIconFinder, findsOneWidget);
    expect(_descriptionFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      home: PersonCardWidget(person: person),
    );
  }
}
