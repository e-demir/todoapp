import 'package:flutter/material.dart';
import 'package:todoapp/core/model/api_service.dart';
import 'package:todoapp/core/model/product.dart';
import 'package:todoapp/ui/shared/widgets/custom_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiService service = ApiService.getInstance();
  List<Product>? productList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppLava"),
        ),
        floatingActionButton: _fabButton,
        body: FutureBuilder<List<Product>>(
          future: service.getProducts(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  productList = snapshot.data;
                  return _listView;
                }

                return Center(
                  child: Text("Error"),
                );

              default:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ));
  }

  Widget get _fabButton => FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      );

  Widget get _listView => ListView.separated(
      itemBuilder: (context, index) => CustomCard(
            title: productList![index].product,
            subTitle: productList![index].money.toString(),
            imageUrl: productList![index].imageURL,
          ),
      separatorBuilder: (context, index) => Divider(),
      itemCount: productList!.length);
}
