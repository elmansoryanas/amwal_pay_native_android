class PurchaseRequest {
  final String pan;
  final String? processingCode;
  final String? messageTypeId;
  final num amount;
  final String? systemTraceNr;
  final String? track2Data;
  final String? posEntryMode;
  final int terminalId;
  final int merchantId;
  final String? isCardSystemRelatedData;
  final String cardHolderName;
  final String cvV2;
  final String? batchId;
  final bool? isFromPos;
  final String? merchantReference;
  final String dateExpiration;
  final String? refundReason;
  final String requestDateTime;
  final int? requestSource;
  final String orderCustomerEmail;
  final String? otp;
  final String? orderKey;
  final String clientMail;
  final int? originalTransactionIdentifierType;
  final String? currencyCode;
  final int? currencyId;
  final String? transactionId;

//<editor-fold desc="Data Methods">
  const PurchaseRequest({
    required this.pan,
    this.processingCode,
    this.messageTypeId,
    required this.amount,
    this.systemTraceNr,
    this.track2Data,
    this.posEntryMode,
    required this.terminalId,
    required this.merchantId,
    this.isCardSystemRelatedData,
    required this.cardHolderName,
    required this.cvV2,
    this.batchId,
    this.isFromPos,
    this.merchantReference,
    required this.dateExpiration,
    this.refundReason,
    required this.requestDateTime,
    this.requestSource,
    required this.orderCustomerEmail,
    this.otp,
    this.orderKey,
    required this.clientMail,
    this.originalTransactionIdentifierType,
    this.currencyCode,
    this.currencyId,
    this.transactionId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseRequest &&
          runtimeType == other.runtimeType &&
          pan == other.pan &&
          processingCode == other.processingCode &&
          messageTypeId == other.messageTypeId &&
          amount == other.amount &&
          systemTraceNr == other.systemTraceNr &&
          track2Data == other.track2Data &&
          posEntryMode == other.posEntryMode &&
          terminalId == other.terminalId &&
          merchantId == other.merchantId &&
          isCardSystemRelatedData == other.isCardSystemRelatedData &&
          cardHolderName == other.cardHolderName &&
          cvV2 == other.cvV2 &&
          batchId == other.batchId &&
          isFromPos == other.isFromPos &&
          merchantReference == other.merchantReference &&
          dateExpiration == other.dateExpiration &&
          refundReason == other.refundReason &&
          requestDateTime == other.requestDateTime &&
          requestSource == other.requestSource &&
          orderCustomerEmail == other.orderCustomerEmail &&
          otp == other.otp &&
          orderKey == other.orderKey &&
          clientMail == other.clientMail &&
          originalTransactionIdentifierType ==
              other.originalTransactionIdentifierType &&
          currencyCode == other.currencyCode &&
          currencyId == other.currencyId &&
          transactionId == other.transactionId);

  @override
  int get hashCode =>
      pan.hashCode ^
      processingCode.hashCode ^
      messageTypeId.hashCode ^
      amount.hashCode ^
      systemTraceNr.hashCode ^
      track2Data.hashCode ^
      posEntryMode.hashCode ^
      terminalId.hashCode ^
      merchantId.hashCode ^
      isCardSystemRelatedData.hashCode ^
      cardHolderName.hashCode ^
      cvV2.hashCode ^
      batchId.hashCode ^
      isFromPos.hashCode ^
      merchantReference.hashCode ^
      dateExpiration.hashCode ^
      refundReason.hashCode ^
      requestDateTime.hashCode ^
      requestSource.hashCode ^
      orderCustomerEmail.hashCode ^
      otp.hashCode ^
      orderKey.hashCode ^
      clientMail.hashCode ^
      originalTransactionIdentifierType.hashCode ^
      currencyCode.hashCode ^
      currencyId.hashCode ^
      transactionId.hashCode;

  PurchaseRequest copyWith({
    String? pan,
    String? processingCode,
    String? messageTypeId,
    num? amount,
    String? systemTraceNr,
    String? track2Data,
    String? posEntryMode,
    int? terminalId,
    int? merchantId,
    String? isCardSystemRelatedData,
    String? cardHolderName,
    String? cvV2,
    String? batchId,
    bool? isFromPos,
    String? merchantReference,
    String? dateExpiration,
    String? refundReason,
    String? requestDateTime,
    int? requestSource,
    String? orderCustomerEmail,
    String? otp,
    String? orderKey,
    String? clientMail,
    int? originalTransactionIdentifierType,
    String? currencyCode,
    int? currencyId,
    String? transactionId,
  }) {
    return PurchaseRequest(
      pan: pan ?? this.pan,
      processingCode: processingCode ?? this.processingCode,
      messageTypeId: messageTypeId ?? this.messageTypeId,
      amount: amount ?? this.amount,
      systemTraceNr: systemTraceNr ?? this.systemTraceNr,
      track2Data: track2Data ?? this.track2Data,
      posEntryMode: posEntryMode ?? this.posEntryMode,
      terminalId: terminalId ?? this.terminalId,
      merchantId: merchantId ?? this.merchantId,
      isCardSystemRelatedData:
          isCardSystemRelatedData ?? this.isCardSystemRelatedData,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cvV2: cvV2 ?? this.cvV2,
      batchId: batchId ?? this.batchId,
      isFromPos: isFromPos ?? this.isFromPos,
      merchantReference: merchantReference ?? this.merchantReference,
      dateExpiration: dateExpiration ?? this.dateExpiration,
      refundReason: refundReason ?? this.refundReason,
      requestDateTime: requestDateTime ?? this.requestDateTime,
      requestSource: requestSource ?? this.requestSource,
      orderCustomerEmail: orderCustomerEmail ?? this.orderCustomerEmail,
      otp: otp ?? this.otp,
      orderKey: orderKey ?? this.orderKey,
      clientMail: clientMail ?? this.clientMail,
      originalTransactionIdentifierType: originalTransactionIdentifierType ??
          this.originalTransactionIdentifierType,
      currencyCode: currencyCode ?? this.currencyCode,
      currencyId: currencyId ?? this.currencyId,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pan': pan,
      'processingCode': 'processingCode',
      'messageTypeId': 'messageTypeId',
      'amount': amount,
      'systemTraceNr': 'systemTraceNr',
      'track2Data': 'track2Data',
      'posEntryMode': 'posEntryMode',
      'terminalId': terminalId,
      'merchantId': merchantId,
      'isCardSystemRelatedData': 'isCardSystemRelatedData',
      'cardHolderName': cardHolderName,
      'cvV2': cvV2,
      'batchId': 'batchId',
      'isFromPos': false,
      'merchantReference': 'merchantReference',
      'dateExpiration': dateExpiration,
      'refundReason': 'refundReason',
      'requestDateTime': requestDateTime,
      'requestSource': 2,
      'orderCustomerEmail': orderCustomerEmail,
      'otp': 'otp',
      'orderKey': 'orderKey',
      'clientMail': clientMail,
      'originalTransactionIdentifierType': 2,
      'currencyCode': 512,
      'currencyId': 512,
      'transactionId': 'transactionId',
    };
  }

  factory PurchaseRequest.fromMap(Map<String, dynamic> map) {
    return PurchaseRequest(
      pan: map['pan'] as String,
      processingCode: map['processingCode'] as String,
      messageTypeId: map['messageTypeId'] as String,
      amount: map['amount'] as num,
      systemTraceNr: map['systemTraceNr'] as String,
      track2Data: map['track2Data'] as String,
      posEntryMode: map['posEntryMode'] as String,
      terminalId: map['terminalId'] as int,
      merchantId: map['merchantId'] as int,
      isCardSystemRelatedData: map['isCardSystemRelatedData'] as String,
      cardHolderName: map['cardHolderName'] as String,
      cvV2: map['cvV2'] as String,
      batchId: map['batchId'] as String,
      isFromPos: map['isFromPos'] as bool,
      merchantReference: map['merchantReference'] as String,
      dateExpiration: map['dateExpiration'] as String,
      refundReason: map['refundReason'] as String,
      requestDateTime: map['requestDateTime'] as String,
      requestSource: map['requestSource'] as int,
      orderCustomerEmail: map['orderCustomerEmail'] as String,
      otp: map['otp'] as String,
      orderKey: map['orderKey'] as String,
      clientMail: map['clientMail'] as String,
      originalTransactionIdentifierType:
          map['originalTransactionIdentifierType'] as int,
      currencyCode: map['currencyCode'] as String,
      currencyId: map['currencyId'] as int,
      transactionId: map['transactionId'] as String,
    );
  }

//</editor-fold>
}
