class ProductModuel {
  final String image;
   int count;
  final int price;
  int amount = 0;
   ProductModuel(
    {
      required this.image,
      required this.count,
      required this.price,
    }
    

  );
  factory ProductModuel.fromJson(Map<String, dynamic> json){
    return ProductModuel(
      image:json['image'],
     count: json['rating']['count'].toInt(),
      price:json['price'].toInt(),
    );
  }

}