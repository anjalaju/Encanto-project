 
class EnterprenurModel {
  String EnterprenurName;
  String EnterprenurNumber;
  String EnterprenurEmail;
  String EnterprenurPassword;
  String? id;

  EnterprenurModel({
    required this.EnterprenurName,
    required this.EnterprenurNumber,
    required this.EnterprenurEmail,
    required this.EnterprenurPassword,
    this.id,
  });

  Map<String, dynamic> toJsone(idd) => {
        'EnterprenurName': EnterprenurName,
        'EnterprenurNumber': EnterprenurNumber,
        'EnterprenurEmail': EnterprenurEmail,
        'EnterprenurPassword': EnterprenurPassword,
        'id': idd,
      };

  factory EnterprenurModel.toJsone(Map<String, dynamic> Json) {
    return EnterprenurModel(
      EnterprenurName: Json['EnterprenurName'],
      EnterprenurNumber: Json['EnterprenurNumber'],
      EnterprenurEmail: Json['EnterprenurEmail'],
      EnterprenurPassword: Json['EnterprenurPassword'],
      id: Json['idd'],
    );
  }
}
