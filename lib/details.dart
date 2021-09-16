final List<Model> info = [
  Model(21.5222, 70.4579, 'Junagadh', 7016156637, "www.junagadh.com"),
  Model(21.4544, 21.4544, 'Bhavnath', 7895645325, "www.sasan.com"),
  Model(21.5645, 70.4465, 'Rajkot', 4587956535, "www.google.com"),
  Model(21.4255, 70.5645, 'Ahmedabad', 4584586252, "www.youtube.com"),
  Model(25.4255, 70.5645, 'Dubai', 4587858595, "www.dell.com"),
];

class Model {
  Model(this.latitude, this.longitude, this.place, this.phone, this.web);

  final double latitude;
  final String place;
  final double longitude;
  final num phone;
  final String web;
}
