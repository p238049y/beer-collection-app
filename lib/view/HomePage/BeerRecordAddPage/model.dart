import 'package:beer_collection/entities/beer.dart';
import 'package:collection/collection.dart';

// trueの場合、必須項目はすべて入力されている
// falseの場合、1つ以上入力されていない項目が存在する
bool checkInputItem(RequestBeer requestBeer) {
  var deepEqual = const DeepCollectionEquality.unordered().equals;
  RequestBeer initialData = RequestBeer();

  return !deepEqual(initialData.beerName, requestBeer.beerName) &&
      !deepEqual(initialData.beerStyle, requestBeer.beerStyle) &&
      !deepEqual(initialData.alcoholDegree, requestBeer.alcoholDegree) && 
      !deepEqual(initialData.calorie, requestBeer.calorie) &&
      !deepEqual(initialData.image, requestBeer.image) &&
      !deepEqual(initialData.registryDateTime, requestBeer.registryDateTime);
}
