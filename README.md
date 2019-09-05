# Flutter Satang Pro Exchange

Flutter Satang Pro Exchange is a Flutter's library for calling API of the [https://https://satang.pro](https://satang.pro/)

## Installation

Add dependencies in pubspec.yaml

```bash
flutter_satang_pro_exchange: 1.0.2
```

## Usage

Import the package to your project.

```dart
import 'package:flutter_satang_pro_exchange/satang_pro_exchange.dart';
```

## Using Public API

Create instance without API Key.

```dart
var sp = SatangProExchangeService();
```


### Get Open Order in Market

Get market open order bids and asks.

This is a public API. you can access JSON in [https://api.tdax.com/api/orders/?pair=btc_thb](https://api.tdax.com/api/orders/?pair=btc_thb) directly.

```
[GET]
https://api.tdax.com/api/orders/?pair=SYMBOL
```

Using in Flutter.

```dart
  SatangProMarketOpenOrdersDao market = await sp.fetchMarketOpenOrders(pair: "btc_thb");
  var bids = market.bids; // list sell order.
  var asks = market.asks; // list buy order.
}
```

Get price and amount in order.

```dart
  for(var order in bids){
    // order.price;
    // order.amount;
  }
}
```


## Prepare Private API

Prepare 2 API keys with different permissions and trying to look your USER ID.
Go to [Developer Menu](https://satang.pro/developers) then create API KEY.

### 1. User Information API key

This API key are used for reading general information, such as balance, wallet address.

```
required permissions : READ WALLET , READ USER INFO.
```

### 2. Order's API key

Crate Order API key are used for creating order, such as balance, cancel orders ,

```
required permissions : READ/WRITE ORDER.
```


## Using Private API

Create instance with 2 API keys and user id.
Your user id will be in [Developer Menu](https://satang.pro/developers).

```dart
var sp = SatangProExchangeService(
                userId: 7892,
                apiKeyUserInfo: SatangProApiKey(apiKey: "---", secret: "---"),
                apiKeyOrder: SatangProApiKey(apiKey: "---", secret: "---"));
```


### Get User Information and Wallet

Return user information such as email, user id , verify level and wallet data.

```dart
  var userInfo = await sp.fetchUserInformation();
  if(!userInfo.isError){
    // userInfo.email;
    // userInfo.id;
    // userInfo.identityVerificationLevel;
    // userInfo.wallets;
    // userInfo.identity;
  }else{
    // userInfo.error.code;
    // userInfo.error.message;
  }
```

Get balance and wallet's addresses.

```dart
     var wallets = userInfo.wallets.list;
     for(var wallet in wallets){
       // wallet.currency;   // BTC
       // wallet.availableBalance;  // 0.001
       /// wallet.addresses; // 365CKrHsS8gqMaETsuPVoeUcFxh4nAEaKu
     }
```


### Get Order List

Get current order and order history.

Order Type

```dart
SatangProOrderType.BUY
SatangProOrderType.SELL
```

Using fetch orders.

```dart
  var myOrders = await sp.fetchOrders(pair: "btc_thb",orderType: SatangProOrderType.BUY);
  if(!myOrders.isError){
    for(var order in myOrders.orders){
      // order.id;
      // order.amount;
      // order.price;
      // order.type;
      // order.status;
      // order.remainingAmount;
    }
  }else{
    // userInfo.error.code;
    // userInfo.error.message;
  }
```

### Create Order

Create order to market.

```dart
  // create order BUY 0.0005 BTC with 100,000 THB
  var response = await sp.createOrder(pair: "btc_thb",
      orderType: SatangProOrderType.BUY,
      amount: 0.0005,
      price: 100000);
```

### Cancel Order

Cancel order with order id.

```dart
 var response = await sp.cancelOrder(orderId: 1234567);
```

## Other uses

Suggestions for other uses.

### Pairing Currency

You can use the atangProCurrency class instead of pair text.

Example

```dart
var market = await sp.fetchMarketOpenOrders(pair: SatangProCurrency.BTC_THB);
```

Pair supported.

```dart
    BTC_THB
    ETH_THB
    USDT_THB
    XLM_THB
    XRP_THB
    XZC_THB
```


### Print JSON

display JSON response on console or logcat.

```dart
await sp.fetchMarketOpenOrders(printJson: true);
```

## More

This package is UNOFFICIAL and the developer is not related with Satang.pro site.