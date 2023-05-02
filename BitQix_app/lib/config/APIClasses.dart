// ignore_for_file: non_constant_identifier_names

class APIClasses {
  static String imageicon = 'https://www.cryptocompare.com';
  static String API_KEY =
      'b1a464700079be4d4c03749aa4ce2fc61d160bc84f31dae6e1b3b5b7917e76ba';
  static String BaseURL = 'min-api.cryptocompare.com'; // Base Url
  static String BaseURLbinance = 'api3.binance.com'; // Base Url
  static String livedatafetch = "/data/pricemultifull";
  static String currencyget = "/list-crypto/get";

  static String livedatafetchPrice = "/api/v3/ticker/price";
  static String LBM_BaseURL = 'bitqix.io';
  static String NODELBM_BaseURL = 'node.bitqix.io';
  static String websocket_url = 'wss://node.bitqix.io/';


  ///REGISTERATION
  static String LBM_register = '/backend/public/api/register';
  static String LBM_emailotp = '/backend/public/api/register/verify';
  static String LBM_phoneotp = '/backend/public/api/validateotp/mobile/';
  static String LBM_resendotp = '/backend/public/api/resendotp/';

  ///LOGIN
  static String LBM_login = '/backend/public/api/login';
  static String LBM_emailverify = '/backend/public/api/validateotp';
  static String LBM_phoneverify = '/backend/public/api/register/verify';
  static String LBM_forgetpassword = 'backend/public/api/forgotpassword';
  static String termconditions = '/backend/public/api/pages/get';

  ///Wallet
  static String Crypto_Data = '/user-crypto/get';
  static String Deposit_Crypto_Data = '/backend/public/api/wallet/update';
  static String Deposithistory = '/backend/public/api/deposit/get';
  static String Wallethistory = '/backend/public/api/wallet-trans/get';
  static String withdraw = '/backend/public/api/block/transfer';
  static String Validatewalletotp = "/backend/public/api/block/validateotpWith";

  ///buy/sell
  static String buy = '/orders/place-order';
  //orderHistory
  static String ordertradehistory = '/list-crypto/trade-history/';

  ///History
  static String OpenData = '/orders/get';
  static String completeOrderDetail = '/orders/getOrderDetail';
  static String CompleteData = '/backend/public/api/orders/get';
  static String WalletTranData = '/backend/public/api/wallet-trans/get';
  static String CancelOrder = '/backend/public/api/order/cancelOrder/';
  static String EditOrder = '/backend/public/api/order/update/';
  static String cancelorder = '/orders/cancel-order/';

  static String OrderDeposit = '/backend/public/api/wallet/update';
  static String addtofav = '/backend/public/api/favourite/create';
  static String getaddtofav = '/favpair/get';
  static String deladdtofav = '/backend/public/api/favourite/delete/';

  static String INRrate = '/get-currency-price';

  ///Own Currency
  static String order = '/orders/order-book';
  static String ownorderHistory = '/orders/trade-book';

  static String openorder = '/list-crypto/market-data/';

  ///SETTING
  static String fees = '/backend/public/api/fee_by_lbm/update';
  static String authverify = '/backend/public/api/2fa/update';
  static String authverifyget = '/backend/public/api/2fa/get';
  static String kyc_verify = '/user-kyc/get';
  static String logGet = '/backend/public/api/log/get';
  static String kycupdate = '/backend/public/api/userkyc/create';
  static String notification = '/backend/public/api/notification/get';
  static String referrallink = '/backend/public/api/user/getReferrals';
  static String ticket_create = '/backend/public/api/ticket/create';
  static String ticket_category = '/backend/public/api/ticket_type/get';
  static String ticket_view = '/backend/public/api/ticket/get';
  static String get_Category = '/backend/public/api/ticket_type/get';
  static String get_Comments = '/backend/public/api/ticket/get/';
  static String create_Comments = '/backend/public/api/ticket_comment/create';

  ///Fav
  static String favGet = '/favpair/get';
  static String banners = '/backend/public/api/banner/get';

  /// LOG OUT
  static String logout = 'backend/public/api/logout';
  static String logoutall = 'backend/public/api/hardlogout';

  static String passwordvalid = '/backend/public/api/password/valid';
  static String chnge_pass = '/backend/public/api/user/change_password';
  static String pass_reset = '/backend/public/api/password/reset';

  /// Launchpad
  static String launchpad = '/launchpad/token_get';
  static String launchpadOrderPlace = '/launchpad/order_place';

  ///Gainer/loser
  static String gainers = '/dashboard/market-gainers';

  //candle map url
  static String CandleMap = "http://192.168.1.11:8080/widget";
}
