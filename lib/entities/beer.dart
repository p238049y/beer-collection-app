class BeerView {
  int id;
  String beerName;
  int beerStyle;
  double alcoholDegree;
  int calorie;
  String image;
  String registryDateTime;

  BeerView({
    this.id = 0,
    this.beerName = '',
    this.beerStyle = 0,
    this.alcoholDegree = 0.0,
    this.calorie = 0,
    this.image = '',
    this.registryDateTime = ''
  });
}

class RequestBeer {
  String beerName;
  int? beerStyle;
  double alcoholDegree;
  int calorie;
  String image;
  String registryDateTime;

  RequestBeer({
    this.beerName = '',
    this.beerStyle,
    this.alcoholDegree = 0.0,
    this.calorie = 0,
    this.image = '',
    this.registryDateTime = ''
  });
}
