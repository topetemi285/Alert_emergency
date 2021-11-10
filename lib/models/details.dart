class Detail {
  final String subject;
  final String address;
  final String description;
  final String longitude;
  final String latitude;
  final DateTime doi;
  final String detailId;
  final String senderId;

  Detail(
      {this.subject,
      this.address,
      this.description,
      this.latitude,
      this.longitude,
      this.doi,
      this.detailId,
      this.senderId});

  Map<String, dynamic> toMap() {
    return {
      "detailId": detailId,
      'suject': subject,
      "address": address,
      "description": description,
      "longitude": longitude,
      "latitude": latitude,
      "senderId": senderId,
      "doi": doi,
    };
  }

  //Retrieving data from firestore
  Detail.fromFirestore(Map<String, dynamic> firestore)
      : detailId = firestore['detailId'],
        subject = firestore['subject'],
        address = firestore['address'],
        description = firestore['description'],
        longitude = firestore['longitude'],
        latitude = firestore['latitude'],
        senderId = firestore['senderId'],
        doi = firestore['doi'];
}
