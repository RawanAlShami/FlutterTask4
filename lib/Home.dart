import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter4/Mail.dart';
import 'Contacts.dart';
import 'package:flutter4/Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Color bg = Color.fromARGB(255,35,39,42);
Color blue = Color.fromARGB(255,144,160,193);

class _HomeState extends State<Home> {
  int NbIndex=0;

  @override
  Widget build(BuildContext context) {

    List<Widget> bodyWidgets = [
    Center(
      child: ListView.builder(
          itemCount: Mail.homeEmail.length ,
          itemBuilder:(context,i)=> MailContainer(index: i,)
      ),
    ),
      Center(
        child: ListView.builder(
            itemCount: Contacts.names.length,
            itemBuilder: (context, i) => ContactCard(index: i,)
        ),
      ),
      SafeArea(
          child:Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top:20.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.person_pin,color: blue,size: 40,),
                      Container(
                        height: 50.0,
                        width: double.infinity,
                        padding: EdgeInsets.only(top:20.0,bottom:5),
                        child: Text(
                          'Rawan Amr AlShami',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height:50,
                        padding: EdgeInsets.only(top:0),
                        child:Text(
                          'RawanAlShami@gmail.com',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.vpn_key_outlined,color: blue,size:25.0,semanticLabel: 'Change Password',),
                            Icon(Icons.payment,color:blue,size:25.0,semanticLabel: 'Payment Method',),
                            Icon(Icons.location_on_outlined,color: blue,size:25.0,semanticLabel: 'Enable Location',),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      )
    ];
    return SafeArea(
        child: Scaffold(
          body: bodyWidgets[NbIndex],
          backgroundColor: bg,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: blue,
            currentIndex: NbIndex,
            showUnselectedLabels: true,
            iconSize: 20.0,
            onTap: (index){
              setState(() {
                NbIndex = index;
              });
            },
            selectedItemColor: Colors.white,
            unselectedItemColor:Colors.white ,
            selectedFontSize: 11.0,
            unselectedFontSize: 11.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.mail_outlined,color: Colors.white,size: 20.0),
                label:'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail_outlined,color: Colors.white,size: 20.0),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined,color: Colors.white,size: 20.0),
                label:'Profile',
              ),
            ],
          ),
          appBar: AppBar(
            title: Text('Account'),
            backgroundColor: blue,
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.black,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: blue,
                    ),
                    accountName:Text('Rawan AlShami'),
                    accountEmail: Text(
                      'RawanAlShami@gmail.com',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Color(0xFF56ccf2)
                          : Colors.black,
                      child: Text("RA",
                        style: TextStyle(fontSize: 40,
                            color: Colors.white),),
                    ),
                  ),
                  ListTile(
                    title: Text(
                        'Home',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 16,
                        )
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    leading: Icon(Icons.home_outlined, color: blue,size: 20.0),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                    },
                  ),
                  ListTile(
                    title: Text(
                        'Starred',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 16,
                        )
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    leading: Icon(Icons.star_border, color: blue,size: 20.0),
                  ),
                  ListTile(
                    title: Text(
                        'Sent',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    leading: Icon(Icons.send_outlined, color: blue,size: 20.0),
                  ),
                  ListTile(
                    title: Text(
                        'Trash',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    leading: Icon(Icons.delete_outline, color: blue,size: 20.0),
                  ),
                  ListTile(
                    title: Text(
                        'Spam',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    leading: Icon(Icons.error_outline, color:blue,size: 20.0),
                  ),
                  ListTile(
                    title: Text(
                        'Drafts',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                    leading: Icon(Icons.mark_email_unread_outlined, color: blue,size: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final int index;

  const ContactCard({this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340.0,
        height: 120.0,
        margin: EdgeInsets.symmetric(vertical: 15.0),
        padding: EdgeInsets.only(top:15.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(Contacts.url[index]),
              ),
              title:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Contacts.names[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(CupertinoIcons.mail,color:Colors.white,size: 16.0,),
                      Text(
                        Contacts.email[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                  Row(
                      children:[
                        Icon(CupertinoIcons.phone,color:Colors.white,size: 16.0,),
                        Text(
                          Contacts.phone[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ]
                  ),
                  Container(
                    width: 50.0,
                    height:20.0,
                    margin: EdgeInsets.only(left:170.0),
                    child:
                    Icon(CupertinoIcons.delete,color: Colors.white,size: 16.0,),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
class MailContainer extends StatelessWidget {

  final int index;

  MailContainer({this.index,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.only(top:20.0,right:10.0,left:10.0),
      padding: EdgeInsets.only(top:10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child:Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(top:10.0),
              leading: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/000/442/018/original/vector-email-icon.jpg'),
              ),
              title:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Mail.NamesList[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    Mail.homeEmail[index],
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ),
          ],
      ),
      ),
    );
  }
}
/*
class Profile extends StatelessWidget {
  final int index;

  Profile({this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: double.infinity,
      child: Center(
        child:Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/user-icon-trendy-flat-style-260nw-1467725033.jpg'),
              ),
            ),
            Column(
              children: [
                Text(
                  'Rawan AlShami',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'RawanAlShami@gmail.com',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.vpn_key_outlined,color: blue,size:16.0,),
                    Icon(Icons.payment,color:blue,size:16.0),
                    Icon(Icons.location_on_outlined,color: blue,size:16.0),
                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
*/