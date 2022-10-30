import '../params/request_student_params.dart';
import '../typedefs/request_student_typedef.dart';

abstract class RequestStudentRepository {
  RequestStudentResult requestStudent({required RequestStudentParams params});
}
