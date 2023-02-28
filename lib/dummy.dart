import 'package:second_app/models/product.dart';

class DummyData {
  static final List<Product> products = [
    Product(
      id: '1', 
      title: 'MacBook Pro 14', 
      description: 'This is a MacBook Pro 14', 
      price: 1500, 
      imageUrl: 'https://images.fpt.shop/unsafe/filters:quality(5)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/QuanLNH2/macbook-pro-14-4.JPG'
    ),
    Product(
      id: '2', 
      title: 'AirPod Pro 2', 
      description: 'This is a AirPod Pro 2', 
      price: 500, 
      imageUrl: 'https://www.maccenter.vn/Accessories/AirPods-Pro2-A.jpg'
    ),
    Product(
      id: '3', 
      title: 'Ipad Air 4', 
      description: 'This is a Ipad Air 4', 
      price: 900, 
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1lQxPnH7pe2BPPJ6WqdN4r2TDP4hKW5PpWg&usqp=CAU'
    ),
    Product(
      id: '4', 
      title: 'Linux PC', 
      description: 'This is a Linux PC', 
      price: 1500, 
      imageUrl: 'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4HELg?q=90&o=f&w=480&h=270'
    ),
    Product(
      id: '5', 
      title: 'HeadPhone Sony Z5', 
      description: 'This is a HeadPhone Z5', 
      price: 1500, 
      imageUrl: 'https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4HELg?q=90&o=f&w=480&h=270'
    ),
  ];
}