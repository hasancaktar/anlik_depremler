import 'dart:developer';
import 'package:anlik_depremler_yeni/models/service.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_pull_to_refresh/flutter_pull_to_refresh.dart';
import 'models/depremJson.dart';

class EarthqueApp extends StatefulWidget {
  @override
  _EarthqueAppState createState() => _EarthqueAppState();
}

class _EarthqueAppState extends State<EarthqueApp> {
  Future<DepremlerModel> _depremGetir;
  final Service apiManager = Service();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _depremGetir = apiManager.fetchData();
    _futureDepremler(context);
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool _enablePullDown = true;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _futureDepremler(context).refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _futureDepremler(context).loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Depremler"),
      ),
      body: SmartRefresher(child: _futureDepremler(context),
        enablePullDown: _enablePullDown,
        onRefresh: _onRefresh,
        controller: _refreshController,
        onLoading: _onLoading,
      ),
    );
  }

  _futureDepremler(BuildContext context) {
    return FutureBuilder(
        future: _depremGetir,
        builder: (context, AsyncSnapshot<DepremlerModel> depremler) {
          if (depremler.hasData) {
            return ListView.builder(
              itemCount: depremler.data.result.length,
              itemBuilder: (context, index) {
                final _data = depremler.data.result[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Material(
                    color: Colors.greenAccent,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(_data.mag.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      //subtitle: Text("Boylam "+depremler.data[index].boylam+" | Enlem "+depremler.data[index].enlem),
                      subtitle: Text(
                        "Tarih: " + _data.date,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      title: Text(
                        _data.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: () {
                        return showModalBottomSheet(
                            elevation: 50,
                            context: context,
                            builder: (context) {
                              return Container(
                                color: Color(0xff737373),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text(
                                          _data.lokasyon,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        )),
                                        subtitle: Center(
                                            child: Text(
                                          _data.date.toString(),
                                          style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.black87),
                                        )),
                                      ),
                                      Divider(
                                        height: 11,
                                        color: Colors.black,
                                      ),
                                      ListTile(
                                        title: Center(
                                            child: CircleAvatar(
                                          maxRadius: 40,
                                          child: Text(
                                            _data.mag.toString(),
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        )),
                                      ),
                                      ListTile(
                                        title: Center(
                                            child: Text(
                                          "TARİH: " + _data.date,
                                          style: TextStyle(fontSize: 20),
                                        )),
                                      ),
                                      // subtitle: Center(
                                      //     child: Text("Tarih " +
                                      //         _data.date,
                                      //       style: TextStyle(
                                      //           fontSize: 20,
                                      //           color: Colors.black),
                                      //     )),

                                      Column(
                                        children: <Widget>[
                                          ListTile(
                                            title: Center(
                                              child: Text(
                                                "DERİNLİK",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            subtitle: Center(
                                              child: Text(
                                                _data.depth.toString(),
                                                style: TextStyle(fontSize: 30),
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Center(
                                                child: Text(
                                              "[ENLEM, BOYLAM]\n" +
                                                  _data.coordinates.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        backgroundColor: Colors.orangeAccent,
                      ),
                    ),
                    Text(
                      "Yükleniyor...",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
