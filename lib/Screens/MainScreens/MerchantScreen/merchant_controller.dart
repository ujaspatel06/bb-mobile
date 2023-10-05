import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantController extends GetxController {
  TextEditingController txtSearchMerchant = TextEditingController();


  List merchantsImages = [
    "https://play-lh.googleusercontent.com/4L63YxnocTXMqDNqeF0qgasndaXeVvV4FWsiOJdv6AEJ4iYvYF1UF3pXdFp3tyh6Yp0",
    "https://img.freepik.com/free-vector/pile-coffee-bean-tea-pot-logo-designs-inspiration-isolated-white-background_384344-557.jpg",
    "https://play-lh.googleusercontent.com/eJuvWSnbPwEWAQCYwl8i9nPJXRzTv94JSYGGrKIu0qeuG_5wgYtb982-2F_jOGtIytY=w240-h480-rw",
    "https://play-lh.googleusercontent.com/9NCyFNv6yf9D-hLwbx5v2o3UXIZj3XVJxw70GVvnF3eslqyzcYC7SBJfGrfh_JiuYXA",
    "https://play-lh.googleusercontent.com/VC_5q_xa8hkHoqXkZH-2vg3eZar7LpD6u8R4ispiAy89OqYZw2wNMZh7-oRVXPD_iQ",
    "https://play-lh.googleusercontent.com/hSRuCp9qVkxNYLYibPYyra4bQLYDyHg40TA1Cu6i9Z3HsWEgS1q076VfjacAdQquHw",
    "https://play-lh.googleusercontent.com/WTGDz8M2gRie-UPC1eFZ321-RavuXFhKlcvxHp0uVEDN0UrWfCMwU9uMvuEE98H3VtZG",
    "https://play-lh.googleusercontent.com/b1YhbZxXfFF5606IZt9-dIcgGvHNq2KpbrK9iNfkvHmG7DyrLS5RQL-YpEHf0dlwS4o",
    "https://www.logolynx.com/images/logolynx/s_cb/cb28972ffd794476daa62b3130fd13c4.jpeg",
    "https://play-lh.googleusercontent.com/CyY5bOcCjbbFJUcMvO46c6BDat9AEjWb5ye5mdqZ97Ra05oX3l1PSyLQgDo0ozd5TfcU=w240-h480-rw",
    "https://play-lh.googleusercontent.com/LHJQsvWSjUQHqX09tsZc2ABj4SngeyzCby9NhCFQHcIOy5F7ot67Ykjexahhr08pztYV",
  ];

  // RxList<String> tempMerchantList = [
  //   "Ami insurance",
  //   "Bleached Cafe",
  //   "Booking.com",
  //    "Countdown",
  //   "Mcdonalds",
  //   "Uber",
  //   "Paknsave",
  //   "Rebel Sport",
  //   "Trademe",
  //   "Starbucks",
  // ].obs;
  final RxList<String> merchantDropdownType = [
    'All',
    'Groceries',
    'Car',
    'Insurance',
    'Clothes',
    'Travel',
    'House'
  ].obs;
  RxList<RxList<String>> merchantList = <RxList<String>>[].obs;



  RxList<String> selectedmerchantDropdown = <String>[].obs;
  Future searchdata(String query) async {
    merchantList.value = tempMerchantList;
    if (query.isNotEmpty) {
      List<RxList<String>> searchList = [];
      for (var search in tempMerchantList) {
        if (search.first.toLowerCase().contains(query.toLowerCase())) {
          searchList.add(search);
        }
      }

      merchantList.value = searchList;
    }
  }



  RxString selectedMerchantType = 'All'.obs;
  RxString selectedCategoriesType = 'All'.obs;
  RxString selectedFilterBySpendType = 'All'.obs;

  RxString merchantSelectItem =
      'Insurance'
          .obs;


  RxList<RxList<String>> tempMerchantList = [
    ["Ami insurance", "Insurance"].obs,
    ["Bleached Cafe", "Health"].obs,
    ["Countdown", "Utilities"].obs,
    ["Uber", "Groceries"].obs,
    ["Mcdonalds", "Shopping"].obs,
    ["Paknsave", "Travel"].obs,
    ["Rebel Sport", "Eating out"].obs,
    ["Trademe", "Health"].obs,
    ["Starbucks", "Utilities"].obs,
  ].obs;

  RxList merchantCategoryList = [
    'Insurance',
    'Health',
    'Utilities',
    'Groceries',
    'Shopping',
    'Travel',
    'Eating Out',
  ].obs;


  RxList<RxList<String>> tempTransactionList = [
    ["Ami insurance", "Insurance"].obs,
    ["Bleached Cafe", "Health"].obs,
    ["Countdown", "Utilities"].obs,
    ["Uber", "Groceries"].obs,
    ["Mcdonalds", "Shopping"].obs,
    ["Paknsave", "Travel"].obs,
    ["Rebel Sport", "Eating out"].obs,
  ].obs;

  RxList merchantType = [
    'All',
    'Groceries',
    'Car',
    'Insurance',
    'Clothes',
    'Travel',
    'House'
  ].obs;

  RxList categoriesType = [
    'All',
    'Categorised',
    'Un-categorised',
  ].obs;

  RxList filterBySpendType = [
    'All',
    'Top 10 merchants ',
    'Top 5 merchants',
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    merchantList.value = tempMerchantList;
    super.onInit();
  }
}
