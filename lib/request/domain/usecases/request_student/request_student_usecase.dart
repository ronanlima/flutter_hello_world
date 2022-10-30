import '../../params/request_student_params.dart';
import '../../typedefs/request_student_typedef.dart';

abstract class RequestStudentUsecase {
  // Future<StudentEntity> call({required RequestStudentParams params});
  RequestStudentResult requestStudent({required RequestStudentParams params});
}
