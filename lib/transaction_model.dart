class TransactionModel {
  String name;
  String photo;
  String date;
  String amount;

  TransactionModel(this.name, this.photo, this.date, this.amount);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(
    item['name'], item['photo'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "Uber Ride",
    "photo": "images/uber.jpg",
    "date": "1st jun 2021",
    "amount": "-\$35.214"
  },
  {
    "name": "Nike Outlet",
    "photo": "images/nike.jpg",
    "date": "30th dec 2020",
    "amount": "-\$100.00"
  },
  {
    "name": "Bank Transfer",
    "photo": "images/bank-icon.jpg",
    "date": "25th july 2020",
    "amount": "+\$250.00"
  },
  {
    "name": "Flight Ticket",
    "photo": "images/ff.jpg",
    "date": "20th june 2020",
    "amount": "+\$450.00"
  },
  {
    "name": "Payment Received",
    "photo": "images/user_photo.jpg",
    "date": "15th feb 2020",
    "amount": "+\$350.00"
  }

];
