class FoodMenu{
  String name;
  int price;
 
  FoodMenu({ required this.name,  required this.price});
 
  @override
  String toString(){
    return "$name : $price";
  }
  
}