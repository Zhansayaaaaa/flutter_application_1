double processOrder({
  required String orderId,
  required double itemPrice,
  String? promoCode,
  double? deliveryFee,
}){
  double price = itemPrice;
  if(promoCode =='SAVE10'){
    price= price * 0.90;
  }
  double delivery=deliveryFee ?? 500.0;

 double finalTotal = price + delivery;
  
 print('Order: $orderId, price: $itemPrice, final: $finalTotal');

  return finalTotal;
}

void main() {
  double total = processOrder(
    orderId: 'ORD001',
    itemPrice: 10000,
    promoCode: 'SAVE10',
  );

  print('Returned total: $total');
}