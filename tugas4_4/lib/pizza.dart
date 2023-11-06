const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

class Pizza{
  late int id;
  late String pizzaName;
  late String description;
  double? price;
  late String imageUrl;

  Pizza();
  factory Pizza.fromJsonOrNull(Map<String, dynamic> json) {
    Pizza pizza = Pizza();
    pizza.id = ((json[keyId] != null) ?
    int.tryParse(json[keyId].toString()) : 0)!;
    pizza.pizzaName = (json[keyName] != null) ?
    json[keyName].toString() : '';
    pizza.description = (json[keyDescription] != null) ?
    json[keyDescription].toString() : '';
    pizza.price = (json[keyPrice] != null &&
        double.tryParse(json[keyPrice].toString()) != null) ?
    json[keyPrice] : 0.0;
    pizza.imageUrl =(json[keyImage] != null) ?
    json[keyImage].toString() : '';
    //This doesn't work now
    /*
    if (pizza.id == 0 || pizza.pizzaName.trim() == '') {
      return null;
    }
     */
    return pizza;
  }

  Pizza.fromJson(Map<String, dynamic> json){
    this.id = ((json[keyId] != null) ?
      int.tryParse(json['id'].toString()) : 0)!;
    this.pizzaName = (json[keyName] != null) ?
      json[keyName].toString() : '';
    this.description =(json[keyDescription] != null) ?
      json[keyDescription].toString() : '';
    this.price =
    (json[keyPrice] != null && double.tryParse(json[keyPrice].toString()) != null) ? json[keyPrice] : 0.0;
    this.imageUrl =(json[keyImage] != null) ?
      json[keyImage].toString() : '';
    /*
    this.id = int.tryParse(json['id'].toString());
    this.pizzaName = json['pizzaName'].toString();
    this.description = json['description'].toString();
    this.price = double.tryParse(json['price'].toString());
    this.imageUrl = json['imageUrl'].toString();
     */
  }

  Map<String, dynamic> toJson(){
    return{
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}