import 'dart:convert';

import 'package:dogfydiet/app/constants/app_mocks.dart';
import 'package:dogfydiet/shared/data/models/dog_breed_model.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class DogBreedRemoteDataSource {
  Future<List<DogBreedModel>> getDogBreeds();
}

class DogBreedRemoteDataSourceImpl implements DogBreedRemoteDataSource {
  @override
  Future<List<DogBreedModel>> getDogBreeds() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final jsonString = await rootBundle.loadString(AppMocks.dogBreed);
    final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;

    return jsonList
        .map((json) => DogBreedModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
