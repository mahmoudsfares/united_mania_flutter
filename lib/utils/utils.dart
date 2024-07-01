
class Utils{

  static String trimContent(String wholeContent){
    int endPos = wholeContent.indexOf("[+");
    return wholeContent.substring(0, endPos);
  }
}