
import 'package:crud/data/modal/contact_vo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'contact_api.g.dart';
@RestApi(baseUrl: 'https://64979cc69543ce0f49e14bca.mockapi.io/ContactApi/')
abstract class ContactApi{
 factory ContactApi(Dio dio)=>_ContactApi(dio);

 @GET('')
  Future<List<ContactVO>>getContact();
 @POST('')
  Future<ContactVO>addContact(@Body() ContactVO contactVO);
 @PUT('{id}')
  Future<ContactVO>updateContact(@Path() String id , @Body() ContactVO contactVO);
 @DELETE('{id}')
  Future<ContactVO>deleteContact(@Path() String id);
}