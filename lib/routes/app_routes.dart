
abstract class Routes{

  static const notFound='not-found';
  static const main='main';
  static const setting='setting';
  static const theme='theme';
  static const language='language';

}
extension RoutesExtension on String{
  String nameToRoute()=>'/${toLowerCase()}';
}