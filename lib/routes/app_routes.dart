
abstract class Routes{

  static const notFound='not-found';
  static const main='main';

}
extension RoutesExtension on String{
  String nameToRoute()=>'/${toLowerCase()}';
}