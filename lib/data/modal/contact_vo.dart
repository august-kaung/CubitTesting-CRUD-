

import 'package:json_annotation/json_annotation.dart';
part 'contact_vo.g.dart';
@JsonSerializable()
class ContactVO{
 @JsonKey(name: 'id')
 String ? id;
 @JsonKey(name: 'name')
 String ? name;
 @JsonKey(name: 'job')
 String ? job;
 @JsonKey(name: 'age')
 String ? age;

 ContactVO(this.id,this.name, this.job, this.age);

 factory ContactVO.fromJson(Map<String,dynamic>json)=>_$ContactVOFromJson(json);
 Map<String,dynamic>toJson()=>_$ContactVOToJson(this);
}