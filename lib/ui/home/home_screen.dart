import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_store/data/models/product/product_model.dart';
import 'package:internet_store/data/network/providers/api_provider.dart';
import 'package:internet_store/data/network/repositories/category_repo.dart';
import 'package:internet_store/data/network/repositories/product_repo.dart';
import 'package:internet_store/ui/home/widgets/container_category.dart';
import 'package:internet_store/ui/home/widgets/home_screen_shimmer.dart';
import 'package:internet_store/ui/home/widgets/products_container.dart';
import 'package:internet_store/ui/login/widgets/global_text_field.dart';
import 'package:internet_store/ui/product_ditail/product_ditail_screen.dart';
import 'package:internet_store/ui/users/users_screen.dart';
import 'package:internet_store/utils/app_colors.dart';
import 'package:internet_store/utils/app_images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> productsAll = [];
  List<ProductModel> products = [];
  List<ProductModel> productsElectronics = [];
  List<ProductModel> productsJewelery = [];
  List<ProductModel> productsWomenClothing = [];
  List<ProductModel> productsMensClothing = [];
  List<ProductModel> productsByLimit = [];
  List<ProductModel> productsByAsc = [];
  List<ProductModel> productsByDesc = [];
  List<String> category = [];

  ProductRepo productRepo = ProductRepo(apiProvider: ApiProvider());
  CategoryRepo categoryRepo = CategoryRepo(apiProvider: ApiProvider());

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerLimit = TextEditingController();
  bool isLoading = false;
  List categorilar = [];

  Items? selectedMenu;

  TextEditingController controller = TextEditingController();

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    productsAll = await productRepo.getAllProducts();

    products = await productRepo.getAllProducts();
    category = await categoryRepo.getAllCategories();
    productsElectronics =
        await productRepo.getProductsByCategory("electronics");
    productsJewelery = await productRepo.getProductsByCategory("jewelery");
    productsWomenClothing =
        await productRepo.getProductsByCategory("women's clothing");
    productsMensClothing =
        await productRepo.getProductsByCategory("men's clothing");

    productsByAsc = await productRepo.getSortedProducts("asc");
    productsByDesc = await productRepo.getSortedProducts("desc");
    productsByLimit = await productRepo.getProductsByLimit(number);

    path = products;

    categorilar.addAll([
      products,
      productsElectronics,
      productsJewelery,
      productsMensClothing,
      productsWomenClothing
    ]);
    setState(() {
      isLoading = false;
    });
  }

  late List<ProductModel> path;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.c_F9FAFB,
        appBar: AppBar(
          toolbarHeight: 76.h,
          backgroundColor: AppColors.c_F9FAFB,
          elevation: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: AppColors.c_A8AFB9),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  top: 16.h, bottom: 16.h, right: 24.w, left: 24.w),
              child: ZoomTapAnimation(
                  child: SvgPicture.asset(AppImages.natification)),
            )
          ],
          centerTitle: true,
          title: Text(
            "E-SHOP",
            style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.w500,
                color: AppColors.c_040415,
                fontFamily: "LeagueSpartan"),
          ),
        ),
        body: isLoading
            ? const Center(child: HomeScreenShimmer())
            : products.isEmpty
                ? const Center(child: Text("Connection error"))
                : Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 32.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 74.h,
                                  width: 330.w,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: GlobalTextField(
                                        onChanged: (v) {},
                                        icon: AppImages.search,
                                        hintText:
                                            "Search for tshirts, jeans, shorts, jackets",
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.search,
                                        textAlign: TextAlign.start),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 24.w),
                                  child: PopupMenuButton<Items>(
                                    initialValue: selectedMenu,
                                    onSelected: (Items item) {
                                      setState(() {
                                        selectedMenu = item;
                                        if (item.index == 3) {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text('Limit'),
                                              content: TextField(
                                                textInputAction:
                                                    TextInputAction.send,
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: controller,
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      number = int.parse(
                                                          controller.text);
                                                      path = productsByLimit;
                                                    });
                                                    return Navigator.pop(
                                                        context, 'done');
                                                  },
                                                  child: const Text('done'),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else if (item.index == 0) {
                                          setState(() {
                                            path = productsAll;
                                          });
                                        } else if (item.index == 1) {
                                          setState(() {
                                            path = productsByAsc;
                                          });
                                        } else if (item.index == 2) {
                                          setState(() {
                                            path = productsByDesc;
                                          });
                                        }
                                      });
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<Items>>[
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
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 220.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ZoomTapAnimation(
                                    onTap: () {
                                      path = categorilar[0];
                                      setState(() {});
                                    },
                                    child: ContainerCategory(
                                      color: AppColors.c_FC6828,
                                      category: "All",
                                      image: AppImages.women,
                                    ),
                                  ),
                                  ...List.generate(
                                      category.length,
                                      (index) => ZoomTapAnimation(
                                            onTap: () {
                                              path = categorilar[index + 1];
                                              setState(() {});
                                            },
                                            child: ContainerCategory(
                                              color: AppColors.c_FC6828,
                                              category: category[index],
                                              image: AppImages.women,
                                            ),
                                          ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 37.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recommended",
                                    style: TextStyle(
                                        fontSize: 18.spMin,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.c_040415,
                                        fontFamily: "LeagueSpartan"),
                                  ),
                                  ZoomTapAnimation(
                                    onTap: () {
                                      setState(() {
                                        path = products;
                                      });
                                    },
                                    child: Text(
                                      "See all",
                                      style: TextStyle(
                                          fontSize: 18.spMin,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.c_A8AFB9,
                                          fontFamily: "LeagueSpartan"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 29.h,
                            ),
                            SizedBox(
                              height: 380.h,
                              child: GridView(
                                physics: const BouncingScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.754,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                children: [
                                  ...List.generate(
                                    path.length,
                                    (index) {
                                      return ProductsContainer(
                                        image: path[index].image,
                                        title: path[index].title,
                                        price: "\$${path[index].price}",
                                        voidCallbackFavorite: () {},
                                        voidCallbackImage: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDitailScreen(
                                                product: path[index],
                                              ),
                                            ),
                                          );
                                        },
                                        voidCallbackLogTap: () {},
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 0.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
  }
}

int number = 0;

enum Items { all, asc, desc, limit }
