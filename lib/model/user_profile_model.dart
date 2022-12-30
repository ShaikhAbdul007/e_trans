class UserProfileModel {
  String? address;
  String? adhar;
  String? country;
  String? department;
  String? designation;
  String? empid;
  String? empname;
  String? mobileno;
  String? mobileno1;
  String? oemail;
  String? pancard;
  String? pemail;
  String? pincode;
  String? state;

  UserProfileModel(
      {this.address,
      this.adhar,
      this.country,
      this.department,
      this.designation,
      this.empid,
      this.empname,
      this.mobileno,
      this.mobileno1,
      this.oemail,
      this.pancard,
      this.pemail,
      this.pincode,
      this.state});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    adhar = json['adhar'];
    country = json['country'];
    department = json['department'];
    designation = json['designation'];
    empid = json['empid'];
    empname = json['empname'];
    mobileno = json['mobileno'];
    mobileno1 = json['mobileno1'];
    oemail = json['oemail'];
    pancard = json['pancard'];
    pemail = json['pemail'];
    pincode = json['pincode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['adhar'] = adhar;
    data['country'] = country;
    data['department'] = department;
    data['designation'] = designation;
    data['empid'] = empid;
    data['empname'] = empname;
    data['mobileno'] = mobileno;
    data['mobileno1'] = mobileno1;
    data['oemail'] = oemail;
    data['pancard'] = pancard;
    data['pemail'] = pemail;
    data['pincode'] = pincode;
    data['state'] = state;
    return data;
  }
}
