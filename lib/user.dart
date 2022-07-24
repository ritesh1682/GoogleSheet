class UserFields {
  // static final String id = 'id';
  // static final String name = 'name';
  // static final String email = 'email';
  // static final String isBeginner = 'isBeginner';

  static final String date = 'Date';
  static final String trucknumber = 'TruckNumber';
  static final String weight = 'Weight';
  static final String shift = 'Shift';

  //static List<String> getFields() => [id,name,email,isBeginner];
  static List<String> getFields() => [date,trucknumber,weight,shift];

}
class User{
  //final int? id;
  // final String? name;
  // final String? email;
  // final bool isBeginner;

  final String? date;
  final String? trucknumber;
  final String? weight;
  final String? shift;
  const User({
   // this.id,
   // required this.name,
   //  required this.email,
   //  required this.isBeginner,

  required this.date,
    required this.trucknumber,
    required this.weight,
    required this.shift,

});

  Map<String,dynamic> toJson() => {
    // UserFields.id: id,
    // UserFields.name: name,
    // UserFields.email: email,
    // UserFields.isBeginner: isBeginner,

    UserFields.date: date,
    UserFields.trucknumber: trucknumber,
    UserFields.weight: weight,
    UserFields.shift: shift,
  };
}