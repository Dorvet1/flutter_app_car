class ResultSearchCar {
  String urlVideo;
  String latitude;
  String longitude;
  String nome;
  String urlFoto;
  

  ResultSearchCar(this.urlVideo, this.latitude, this.longitude, this.nome);
  ResultSearchCar.fromJson(Map<String, dynamic> json) {
    this.urlFoto = json['urlFoto'];
    this.urlVideo = json['urlVideo'];
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
    this.nome = json['nome'];
  }
}
