


class Customer{
  String id;
  String name;
  String evalute;
  String inAt;
  String outAt;
  String phone;
  
  Customer({this.id, this.name, this.inAt, this.outAt, this.evalute, this.phone});


  info(){
    return ''' 
    Họ và tên: $name
    CMT: $id
    Số điện thoại: $phone
    Ngày nhận phòng: $inAt
    Ngày trả phòng: $outAt
    ''';
  }

}