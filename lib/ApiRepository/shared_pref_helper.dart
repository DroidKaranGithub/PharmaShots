import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  Future<bool> setAuthToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(userPref.AuthToken.toString(), token);
  }

  Future<String?> getAuthToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userPref.AuthToken.toString());
  }

  // Future<bool> setUserData(String userData) async {
  //   final pref = await SharedPreferences.getInstance();
  //   return pref.setString(userPref.UserData.toString(), userData);
  // }
  //
  // Future<String?> getUserData() async {
  //   final pref = await SharedPreferences.getInstance();
  //   return pref.getString(userPref.UserData.toString());
  // }

  Future<bool> setUserImage(String image) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(userPref.Image.toString(), image);
  }

  Future<String?> getUserImage() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userPref.Image.toString());
  }

  Future<dynamic> getRecentSearch() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList("recent");
  }

  Future<bool> setRecentSearch(String str) async {
    final pref = await SharedPreferences.getInstance();
    var s=pref.getStringList("recent");
    List<String> new_list=[];
    if(s==null)
      {
        new_list.add(str);
      }else{
        if(s.contains(str))
          {
            print(str);
            s.removeAt(s.indexOf(str));
            new_list.add(str);
            new_list.addAll(s);
            print(new_list);
          }else{
            if(s.length < 6)
            {
              new_list.add(str);
              new_list.addAll(s);
            }else
              {
                s.removeLast();
                new_list.add(str);
                new_list.addAll(s);
              }
            }
       }
    return pref.setStringList("recent", new_list);

  }

  Future<dynamic> clearRecentSearch() async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove("recent");
  }
}

enum userPref {
  AuthToken,
  Image,
}
