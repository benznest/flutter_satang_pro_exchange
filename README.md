# Flutter Satang Pro Exchange

Flutter Satang Pro Exchange is a Flutter's library for calling API of the [https://https://satang.pro](https://satang.pro/)

## Installation
Add dependencies in pubspec.yaml

```bash
flutter_satang_pro_exchange: 1.0.0
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


### Open Order in Market

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

Prepare 2 API keys with different permissions. and your USER ID.
Go to [Developer Menu](https://satang.pro/developers) and create API KEY.

### 1. User Info API key \

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

Create instance with 3 API keys different permissions.
Your user id will be in [Developer Menu](https://satang.pro/developers).

```dart
var sp = SatangProExchangeService(
                userId: 7892,
                apiKeyUserInfo: SatangProApiKey(apiKey: "---", secret: "---"),
                apiKeyOrder: SatangProApiKey(apiKey: "---", secret: "---"));
```


### Get User Information and Wallet

Return user identity such as email, id , verify level and wallet.

```dart
  var userInfo = await sp.fetchUserInformation(printJson: true);
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

Get balance and address wallet.

```dart
     var wallets = userInfo.wallets.list;
     for(var wallet in wallets){
       // wallet.currency;   // BTC
       // wallet.availableBalance;  // 0.001
       /// wallet.addresses; // 365CKrHsS8gqMaETsuPVoeUcFxh4nAEaKu
     }
```



