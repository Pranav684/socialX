import 'package:quantum_it_assignment/database/localDatabase.dart';

class TableElement {
  String newsTitle = '';
  String newsDesc = '';
  String newsPublishedAt = '';
  String newsSource = '';
  String newsImage = '';
  TableElement(
      {required this.newsTitle,
      required this.newsDesc,
      required this.newsPublishedAt,
      required this.newsSource,
      required this.newsImage});
}

class DatabaseObject {
  List<TableElement> _listOfTableData = [];
  Map<String, Object?> _dataIntoMap = {};
  List<Map<String, Object?>> _listOfMapData = [];
  List<Map<String, Object?>> _internalData = [];

  void insertTableData(
      newsTitle, newsDesc, newsPublishedAt, newsSource, newsImage) {
    _listOfTableData.add(
      TableElement(
          newsTitle: newsTitle,
          newsDesc: newsDesc,
          newsPublishedAt: newsPublishedAt,
          newsSource: newsSource,
          newsImage: newsImage),
    );
  }

  void listToMap() {
    print('into lTm');
    for (int i = 0; i < _listOfTableData.length; i++) {
      // _dataIntoMap['newsTitle'] = _listOfTableData[i].newsTitle;
      // _dataIntoMap['newsDesc'] = _listOfTableData[i].newsDesc;
      // _dataIntoMap['newsPublishedAt'] = _listOfTableData[i].newsPublishedAt;
      // _dataIntoMap['newsSource'] = _listOfTableData[i].newsSource;
      // _dataIntoMap['newsImage'] = _listOfTableData[i].newsImage;
      // print(_dataIntoMap);
      _listOfMapData.add(
        {
          'newsTitle': _listOfTableData[i].newsTitle,
          'newsDesc': _listOfTableData[i].newsDesc,
          'newsPublishedAt': _listOfTableData[i].newsPublishedAt,
          'newsSource': _listOfTableData[i].newsSource,
          'newsImage': _listOfTableData[i].newsImage,
        },
      );
    }
  }

  fetchInternalData() async {
    print('into fId');
    _internalData = await getData();
    return _internalData;
  }

  modelToDatabase() async {
    print('into mTd');
    await deleteData();
    listToMap();
    // print(_listOfMapData);
    for (int i = 0; i < _listOfMapData.length; i++) {
      // print(_listOfMapData[i]['newsSource']);
      await insertData(_listOfMapData[i]);
    }
  }
}
