import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage>{
  int groupValue;
  int _umur = 40;
  int _tinggi = 150;
  int _berat = 60;
  double _hitung = 0.0;
  String _info = 'Masukan data';
  GlobalKey formkey = GlobalKey();

  void gender (int i){
    setState(() {
      if(i==1){
        groupValue=1;
      }
      else{
        groupValue=2;
      }
    });
  }

  void _umurpls(){
    setState(() {
      _umur++;
    });
  }
  void _umurmns(){
    setState(() {
      _umur--;
    });
  }
  void _tinggipls(){
    setState(() {
      _tinggi++;
    });
  }
  void _tinggimns(){
    setState(() {
      _tinggi--;
    });
  }
  void _beratpls(){
    setState(() {
      _berat++;
    });
  }
  void _beratmns(){
    setState(() {
      _berat--;
    });
  }
  void _reset(){
    setState(() {
      _umur = 40;
      _berat = 60;
      _tinggi = 150;
      _hitung = 0;
      _info = 'Masukan data';
    });
  }

  void _calc(){
    setState(() {
      _hitung = (_berat/(_tinggi*_tinggi))*10000;
    });
  }

  void _informasi(){
    setState(() {
      if(_hitung < 18.5){
        _info = 'Anda KEKURANGAN BERAT BADAN\nPerbanyak makanan bergizi';
      }
      else if(_hitung >= 18.5 && _hitung <= 24.9){
        _info = 'Anda memiliki berat badan IDEAL\nPertahankan';
      }
      else if(_hitung >= 25.0 && _hitung <= 29.9){
        _info = 'Anda KELEBIHAN BERAT BADAN\nLakukan olahraga rutin';
      }
      else if(_hitung >30.0){
        _info = 'Anda OBESITAS\nHubungi dokter SEGERA';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calc'),
        actions: <Widget>[
          Image.asset('asset/icon_bmi.png',
            width: 40,
            height: 40,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(top: 12),
                        child: Image.asset('asset/icon_male.png'),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          Radio(
                            onChanged: (int i) => gender(i),
                            activeColor: Colors.redAccent,
                            value: 1,
                            groupValue: groupValue,
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(top: 12),
                        child: Image.asset('asset/icon_female.png'),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          Radio(
                            onChanged: (int i) => gender(i),
                            activeColor: Colors.redAccent,
                            value: 2,
                            groupValue: groupValue,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              //umur
              children: <Widget>[
                Container(
                  height: 50,
                  width: 75,
                  margin: EdgeInsets.only(top: 12, left: 15),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.elliptical(60, 60))
                  ),
                  child: Text(
                    'Umur',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'NeoSansReglar',
                      color: Colors.white
                    ),
                  ),
                  alignment: Alignment(0,0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: FlatButton(
                    onPressed: (){
                      _umurmns();
                    },
                    child: Image.asset('asset/icon_minus.png',
                      height: 20,
                      width: 20,
                    ),
                  )
                ),
                Container(
                  width: 140,
                  height: 50,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.elliptical(70, 70))
                  ),
                  child: Text('$_umur',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'NeoSansRegular',
                      color: Colors.white
                    ),
                  ),
                  alignment: Alignment(0,0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: FlatButton(
                    onPressed: (){
                      _umurpls();
                    },
                    child: Image.asset('asset/icon_plus.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                )
              ],
            ),
            Row(
              //berat
              children: <Widget>[
                Container(
                  height: 50,
                  width: 75,
                  margin: EdgeInsets.only(top: 12, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.elliptical(60, 60))
                  ),
                  child: Text(
                    'Berat',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NeoSansReglar',
                        color: Colors.white
                    ),
                  ),
                  alignment: Alignment(0,0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: FlatButton(
                      onPressed: (){
                        _beratmns();
                      },
                      child: Image.asset('asset/icon_minus.png',
                        height: 20,
                        width: 20,
                      ),
                    )
                ),
                Container(
                  width: 140,
                  height: 50,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.elliptical(70, 70))
                  ),
                  child: Text('$_berat',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NeoSansRegular',
                        color: Colors.white
                    ),
                  ),
                  alignment: Alignment(0,0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: FlatButton(
                    onPressed: (){
                      _beratpls();
                    },
                    child: Image.asset('asset/icon_plus.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                )
              ],
            ),
            Row(
              //tinggi
              children: <Widget>[
                Container(
                  height: 50,
                  width: 75,
                  margin: EdgeInsets.only(top: 12, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.elliptical(60, 60))
                  ),
                  child: Text(
                    'Tinggi',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NeoSansReglar',
                        color: Colors.white
                    ),
                  ),
                  alignment: Alignment(0,0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15),
                    child: FlatButton(
                      onPressed: (){
                        _tinggimns();
                      },
                      child: Image.asset('asset/icon_minus.png',
                        height: 20,
                        width: 20,
                      ),
                    )
                ),
                Container(
                  width: 140,
                  height: 50,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.elliptical(70, 70))
                  ),
                  child: Text('$_tinggi',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NeoSansRegular',
                        color: Colors.white
                    ),
                  ),
                  alignment: Alignment(0,0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: FlatButton(
                    onPressed: (){
                      _tinggipls();
                    },
                    child: Image.asset('asset/icon_plus.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 50,
              width: 300,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.elliptical(70, 70))
              ),
              child: FlatButton(
                onPressed: (){
                  _reset();
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'NeoSansRegular',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 300,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(Radius.elliptical(70, 70))
              ),
              child: FlatButton(
                onPressed: (){
                  _calc();
                  _informasi();
                  print(_info);
                },
                child: Text(
                  'Hitung',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'NeoSansRegular',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 390,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.elliptical(70, 70))
              ),
              child: Text(
                _hitung.toStringAsFixed(1),
                style: TextStyle(
                  fontFamily: 'NeoSansBold',
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
              alignment: Alignment(0,0),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text(
                'Informasi',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'NeoSansBold',
                    color: Colors.white
                ),
              ),
              alignment: Alignment(-0.9,-1),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text(
                _info,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'NeoSansBold',
                    color: Colors.white
                ),
              ),
              alignment: Alignment(0,0),
            ),
          ],
        ),
      ),
    );
  }
}