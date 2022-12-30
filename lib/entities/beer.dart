class BeerView {
  int id = 0;
  String beerName = '';
  int beerStyle = 0;
  double alcoholDegree = 0.0;
  int calorie = 0;
  String image = '';
  String registryDateTime = '';

  BeerView(this.id, this.beerName, this.beerStyle, this.alcoholDegree,
      this.calorie, this.image, this.registryDateTime);
}

class RequestBeer {
  String beerName;
  int? beerStyle;
  double alcoholDegree;
  int calorie;
  String image;
  String registryDateTime;

  RequestBeer(
      {this.beerName = '',
      this.beerStyle,
      this.alcoholDegree = 0.0,
      this.calorie = 0,
      this.image = '',
      this.registryDateTime = ''});
}
