import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatefullWidget{
  @override
  _SamplePageState createState()=> _SamplePageState();
}
class _SamplePageState extends State<HomePage> {

  // まずクエリを書く
  String graphQLDocument = '''
    query GetUser(\$userId: ID!) {
    getUser(userId: \$userId) {
      userId
      name
      introduction
      lat
      lng
      tag
      acquaintance {
        userId
        name
        introduction
        lat
        lng
        tag
        acquaintance {
          userId
          name
          introduction
          lat
          lng
          tag
          status
          owner
          createdAt
          updatedAt
        }
        icon {
          userImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
        status
        event {
          eventId
          userId
          name
          introduction
          tag
          pin
          lat
          lng
          limit
          reserved
          start
          end
          from
          to
          reported
          owner
          createdAt
          updatedAt
        }
        owner
        createdAt
        updatedAt
      }
      icon {
        userImageId
        name
        type
        size
        alt
        url
        identityId
        owner
        createdAt
        updatedAt
      }
      status
      event {
        eventId
        userId
        name
        image {
          eventImageId
          name
          type
          size
          alt
          url
          identityId
          owner
          createdAt
          updatedAt
        }
        introduction
        tag
        pin
        lat
        lng
        limit
        reserved
        start
        end
        from
        to
        reported
        owner
        createdAt
        updatedAt
        comment {
          nextToken
        }
      }
      owner
      createdAt
      updatedAt
    }
  }''';

    await Amplify.API.query(
        request: GraphQLRequest<String>(
      document: graphQLDocument,
    )).then((res)=>{
      var operation = res
    }).catchError((e)=>{
      print('error' + e)
    });

    var response = await operation.response;
    var data = response.data;


  @override
  Widget build(Buildcontext context){
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[0]),
            title: Text(selectedItems[0]),
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[1]),
            title: Text(selectedItems[1]),
            backgroundColor: themeColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[2]),
            title: Text(selectedItems[2]),
            backgroundColor: themeColor,
          ),
        ],
        backgroundColor: themeColor,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        }
      ),
    )
  }
}