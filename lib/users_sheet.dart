import 'package:gsheets/gsheets.dart';
import 'package:hello/user.dart';

class UserSheetApi{
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheet1-356408",
  "private_key_id": "ac16d6b34af8690b01f58d3580cdecc4f60097b8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC20602/3HMPaZD\n/Aek5AosfR+4Vgz5OGGuyegLG9wi81wpFy1ViIubYn46bOtMn/cu3PXBLy0ZLfW1\nM+yIUlDodZsuUPz7oTP/KlzZ+aGX0lmHCC5H6Ze2T92x59oo8KVMfbwb4kpD6QF7\n2/LJZ38btyFZt6xVQcXgg0NPtmNajZ0YWmA2XFnMRU1pJ1Q6iWMN0sl2VXV5w3rK\noCbjwdmR4xBVW2CT3xP0vP/RMRKNd3+ntl6fkBhWBT1y3Z2p7UKtniIdotnsBrao\ngZLRpGD1PLYESkxo5dt370/TPjGpxuinUz6DycvcscWx05VshidEbFb7uVdfJMcb\nP+zr488lAgMBAAECggEAEfRPumrznf8f6OVDSuoqJZxUFSI+O+tRjHy/kPe3cqc7\nkb148kFqlGPjyZEQuoGrIKsKZ2Jep25gBt+GhwyubWW/S5kgfwWhuZlLbQya1fIO\nYLho8x75iynkt6fxQLwBP7XJV2Otr2Weg69h9G15ihs95zWmcuj2qcm6PoXG1AmR\nqIL74MRyB6iBcBC4tVNJfXiIlcc80acJJxoLL382BNzXWKc7SGuyg38hSOmBwDIJ\nZgQ5/oCUbsA/pxD6lcldGYLYaYt7Q0c1c9qPzbg9mb4UzVktmXlU88R04R7birt4\nSjMjzxQzPq9NMvGE7gJpyaW8dTT01OGh+xIHAG2AgQKBgQDk8/G698NkKX9OK448\n6u8Fa4MW+dptn+xRrp0yKVRR7m3Gvg+cm/M5cww9qDc0klSgzDEqtFqLlXpedpyy\nEtPobM99eT9a6ZwREmDzQ6xn+RcI5VIAl18LoArDE54SIjYzXgtJTE25lUlRPfHn\nBpuLoGM1Er2oGaXl8R1mCQzzWQKBgQDMbMapO2cMYjwrIYJ3pa3S3UJAKCl3MGY+\nWC9qFiLZamKBN+O2nhFJHd3BC2454EGDsC3ajWTYq/2mNk1DyJUuOc8LP9an8uKV\nPGRBq+Dt7YWsqpXaHKqsUbYQvjQ5PcejZmuEe2wRhxucne+wAgZM4aDVvaZ7fT5U\nAq0vHx68rQKBgQCU246FU2W0j853kpYOQWlaisZWf+hmch4CFZea74glJPI2z4fy\n+Oowpf6FcANEqQdg7KHi9BQSwQMou9GxbdBdQ7G8EMMCZvTTnLFwOMW1bBxv6jlg\nrQpc0pdssiqJ+7hluXV5GKVITim3KqFG5eLn60XVUfQBgXt9f0DwAF5tMQKBgCka\n7k91LGFnF2Ys1MkuPWebKgkwijX3O3fpz47raJKDO89z54v++MbVBJQesklc+I98\nS5wYtmCDJPvZC2xH1wd2hFVkvssCoeEURayW3SG6kxiHLJ6xCPihbZSsSmAANjZ7\nD7+R+ccEfd7eOyYPIikvbWHNQr6uDmxiJWTGQy35AoGACYN485TFqgMFbKRqvEwr\ngKmS+OKEB4Z7oDKwmmovSWJzToglm06eGnPh2DJpuN4xn61CVk6TXgQq3J7VIPgD\nh3YhM8l4p0t4BbYOhfPRJ/xb1c6EdY7tP+6Pe/8gFEOLWg/bmRZYNlwaBZvvYwr8\nBN3PHCg9TYyyyBNuXmsc2s4=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheet1-356408.iam.gserviceaccount.com",
  "client_id": "111421414292883505394",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheet1-356408.iam.gserviceaccount.com"
}
  ''';
  static final _spreadsheetId = '1egePpSwRvkP69aFZTiqg2TRdCuZ1UjFWuEJw1cICA_w';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _usersheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _usersheet = await _getWorkSheet(spreadsheet, title: 'Users');

      final firstRow = UserFields.getFields();
      _usersheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error : $e');
    }
    }

  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet,{
        required String title,
}) async{
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return await spreadsheet.worksheetByTitle(title)!;
    }
    }

    static Future insert(List<Map<String, dynamic>> rowList) async{
    if(_usersheet == null) return;
    _usersheet!.values.map.appendRows(rowList);
    }
  }
