
abstract class Routes{

  static const notFound='not-found';
  static const main='main';
  static const setting='setting';
  static const theme='theme';
  static const language='language';
  static const loginRegister='loginRegister';
  static const coinRank='coinRank';
  static const coinList='coinList';
  static const coin='coin';
  static const articleDetail='articleDetail';
  static const messageWebView='messageWebView';

}
extension RoutesExtension on String{
  String nameToRoute()=>'/${toLowerCase()}';
}