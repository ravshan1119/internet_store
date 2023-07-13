import 'package:flutter/material.dart';
import 'package:internet_store/data/models/product/product_model.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';
import 'package:internet_store/data/network/repositories/product_repo.dart';

class PopUpMenuScreen extends StatefulWidget {
  PopUpMenuScreen({Key? key, required this.path}) : super(key: key);
  List<ProductModel> path;

  @override
  State<PopUpMenuScreen> createState() => _PopUpMenuScreenState();
}

class _PopUpMenuScreenState extends State<PopUpMenuScreen> {
  ProductRepo productRepo = ProductRepo(apiProvider: ApiProvider());

  List<ProductModel> productsByLimit = [];
  List<ProductModel> productsByAsc = [];
  List<ProductModel> productsByDesc = [];
  List<ProductModel> productsAll = [];
  Items? selectedMenu;

  TextEditingController controller = TextEditingController();

  _fetchData() async {
    productsAll = await productRepo.getAllProducts();

    productsByAsc = await productRepo.getSortedProducts("asc");
    productsByDesc = await productRepo.getSortedProducts("desc");
    productsByLimit = await productRepo.getProductsByLimit(number);
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Items>(
      initialValue: selectedMenu,
      onSelected: (Items item) {
        setState(() {
          selectedMenu = item;
          if (item.index == 3) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Limit'),
                content: TextField(
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.number,
                  controller: controller,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        number = int.parse(controller.text);
                        widget.path = productsByLimit;
                      });
                      return Navigator.pop(context, 'done');
                    },
                    child: const Text('done'),
                  ),
                ],
              ),
            );
          } else if (item.index == 0) {
            setState(() {
              widget.path = productsAll;
            });
          } else if (item.index == 1) {
            setState(() {
              widget.path = productsByAsc;
            });
          } else if (item.index == 2) {
            setState(() {
              widget.path = productsByDesc;
            });
          }
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Items>>[
        const PopupMenuItem<Items>(
          value: Items.all,
          child: Text('all'),
        ),
        const PopupMenuItem<Items>(
          value: Items.asc,
          child: Text('A-Z'),
        ),
        const PopupMenuItem<Items>(
          value: Items.desc,
          child: Text('Z-A'),
        ),
        const PopupMenuItem<Items>(
          value: Items.limit,
          child: Text('limit'),
        ),
      ],
    );
  }
}

int number = 0;

enum Items { all, asc, desc, limit }
