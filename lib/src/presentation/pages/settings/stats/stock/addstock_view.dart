import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateStock extends StatefulWidget {
  const UpdateStock({Key? key}) : super(key: key);

  @override
  _UpdateStockState createState() => _UpdateStockState();
}

class _UpdateStockState extends State<UpdateStock> {
//to map functions nd variables
  Map<String, dynamic> colQtyMap = {};
  List<Map<String, dynamic>> colorQtyList = [];
  Map<String, dynamic> midMap = {};
  Map<String, dynamic> stockMap = {};
  List<Map<String, dynamic>> cardList = [];
  Map dataCheck = {};

  void addToColorNqty(
      {required TextEditingController colorController,
      required TextEditingController quantity,
      required List<Map<String, dynamic>> colorQty}) {
    Map<String, dynamic> bypass = {
      'color': colorController.text,
      'quantity': quantity.text
    };
    setState(() {
      colorQty.add(bypass);
    });
  }

//add to size qty list
  void addToCardList(
      {required List<Map<String, dynamic>> cardList,
      required List<Map<String, dynamic>> colorQtyList,
      required Map dataCheck}) {
    String size = dataCheck['size'];
    List<Map<String, dynamic>> lilList = colorQtyList;
    Map<String, dynamic> bypass = {'size': size, 'qtyNsize': lilList};
    setState(() {
      cardList.add(bypass);
    });
  }

  //keys
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode focusProductType = FocusNode();
  final FocusNode focusNames = FocusNode();
  final FocusNode focusSizes = FocusNode();
  final FocusNode focusColors = FocusNode();
  final FocusNode focusDescription = FocusNode();
  final FocusNode focusQuantities = FocusNode();
  final FocusNode focusSalePrice = FocusNode();
  final FocusNode focusCostPrice = FocusNode();
  final FocusNode focusImages = FocusNode();

  //controllers
  final TextEditingController productController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController restockController = TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController productTypeController = TextEditingController();
  final TextEditingController imagesController = TextEditingController();
  //build
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      body: Center(
        child: SizedBox(
          height: height / 5 * 4,
          width: 300,
          //color: Colors.white12,
          child: Card(
            color: const Color.fromARGB(234, 13, 78, 58),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          stockMap['name'] = value;
                        });
                      }
                    },
                    focusNode: focusNames,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        fontFamily: "SignikaSemiBold",
                        fontSize: 16.0,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        labelText: 'product name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "SignikaSemiBold", fontSize: 18.0)),
                  ),
                ),
                //description
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          stockMap['description'] = value;
                        });
                      }
                    },
                    focusNode: focusDescription,
                    controller: productController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        fontFamily: "SignikaSemiBold",
                        fontSize: 16.0,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        labelText: 'Edit Product description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "SignikaSemiBold", fontSize: 18.0)),
                  ),
                ),
                //product type
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          stockMap['productType'] = value;
                        });
                      }
                    },
                    focusNode: focusProductType,
                    controller: sizeController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        fontFamily: "SignikaSemiBold",
                        fontSize: 16.0,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        labelText: 'Edit Product Type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "SignikaSemiBold", fontSize: 18.0)),
                  ),
                ),
                //cost price
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          stockMap['costPrice'] = value;
                        });
                      }
                    },
                    focusNode: focusCostPrice,
                    controller: costPriceController,
                    style: const TextStyle(
                        fontFamily: "SignikaSemiBold",
                        fontSize: 16.0,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        labelText: 'Edit cost price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "SignikaSemiBold", fontSize: 18.0)),
                  ),
                ),
                //selling price
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          stockMap['salePrice'] = value;
                        });
                      }
                    },
                    focusNode: focusSalePrice,
                    controller: salePriceController,
                    style: const TextStyle(
                        fontFamily: "SignikaSemiBold",
                        fontSize: 16.0,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        labelText: 'Edit sale price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "SignikaSemiBold", fontSize: 18.0)),
                  ),
                ),
                //color n sizes container
                SizedBox(
                  width: double.infinity,
                  height: 450,
                  child: Column(
                    children: [
                      //size
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              dataCheck['size'] = value;
                            }
                          },
                          focusNode: focusSizes,
                          controller: sizeController,
                          style: const TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16.0,
                              color: Colors.white),
                          decoration: const InputDecoration(
                              labelText: 'Edit size ',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              hintStyle: TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 18.0)),
                        ),
                      ),
                      //quantity and color row
                      Row(
                        children: [
                          //quantity
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 20.0,
                                  left: 15.0,
                                  right: 5.0),
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]+$'))
                                ],
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'must be a number dummy!!'
                                      : null;
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      dataCheck['quantity'] = value;
                                    });
                                  }
                                },
                                focusNode: focusQuantities,
                                controller: quantity,
                                style: const TextStyle(
                                    fontFamily: "SignikaSemiBold",
                                    fontSize: 16.0,
                                    color: Colors.white),
                                decoration: const InputDecoration(
                                    labelText: 'Edit quantity',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    hintStyle: TextStyle(
                                        fontFamily: "SignikaSemiBold",
                                        fontSize: 18.0)),
                              ),
                            ),
                          ),
                          //color
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 20.0,
                                  left: 5.0,
                                  right: 15.0),
                              child: TextFormField(
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      dataCheck['color'] = value;
                                    });
                                  }
                                },
                                focusNode: focusColors,
                                controller: colorController,
                                style: const TextStyle(
                                    fontFamily: "SignikaSemiBold",
                                    fontSize: 16.0,
                                    color: Colors.white),
                                decoration: const InputDecoration(
                                    //alignLabelWithHint: true,
                                    labelText: 'Edit color,',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                    ),
                                    hintStyle: TextStyle(
                                        fontFamily: "SignikaSemiBold",
                                        fontSize: 18.0)),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //color card list
                      SizedBox(
                        height: 85,
                        width: double.infinity,
                        child: colorQtyList.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 150,
                                    width: 70,
                                    child: Card(
                                      child: Column(
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              child: Center(
                                                  child: Text(
                                                      colorQtyList[index]
                                                              ['color']
                                                          .toString()))),
                                          Flexible(
                                              child: Text(colorQtyList[index]
                                                      ['quantity']
                                                  .toString())),
                                          Flexible(
                                              child: IconButton(
                                            splashRadius: 20,
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 17,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                colorQtyList.removeAt(index);
                                              });
                                            },
                                          ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: colorQtyList.length,
                              )
                            : const Center(
                                child: Text(
                                    'color and quantity list will appear here')),
                      ),

                      //add color button
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          width: 230,
                          child: MaterialButton(
                            disabledColor: Colors.grey.shade800,
                            color: Colors.green.shade600,
                            onPressed: () {
                              if (quantity.text.isNotEmpty &&
                                  sizeController.text.isNotEmpty &&
                                  colorController.text.isNotEmpty) {
                                addToColorNqty(
                                    colorController: colorController,
                                    quantity: quantity,
                                    colorQty: colorQtyList);
                                colorController.clear();
                                quantity.clear();

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        dismissDirection: DismissDirection.down,
                                        duration: Duration(seconds: 3),
                                        content: Text(
                                          'added succesfully',
                                          style: TextStyle(color: Colors.white),
                                        )));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.red,
                                        dismissDirection: DismissDirection.down,
                                        duration: Duration(seconds: 1),
                                        content: Text(
                                          'enter quantity and color for given size',
                                          style: TextStyle(color: Colors.white),
                                        )));
                              }
                            },
                            child: const Text('add another color and quantity'),
                          ),
                        ),
                      ),
                      //add new size button
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: OutlinedButton(
                          onPressed: () {
                            if (colorQtyList.isNotEmpty &&
                                sizeController.text.isNotEmpty) {
                              if (cardList.contains({'name': nameController})) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.red,
                                        dismissDirection: DismissDirection.down,
                                        duration: Duration(seconds: 1),
                                        content: Text(
                                          'size already exists!',
                                          style: TextStyle(color: Colors.white),
                                        )));
                              } else {
                                addToCardList(
                                    cardList: cardList,
                                    colorQtyList: colorQtyList,
                                    dataCheck: dataCheck);
                                dataCheck.clear();
                                colorQtyList.clear();
                                sizeController.clear();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        dismissDirection: DismissDirection.down,
                                        duration: Duration(seconds: 1),
                                        content: Text(
                                          'added size card succesfully',
                                          style: TextStyle(color: Colors.white),
                                        )));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.red,
                                      dismissDirection: DismissDirection.down,
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        'add color and quantity first before you add a new size!',
                                        style: TextStyle(color: Colors.white),
                                      )));
                            }
                          },
                          child: const Text('add new size, color and quantity'),
                        ),
                      ),
                      cardList.isNotEmpty
                          ? SizedBox(
                              width: double.infinity,
                              height: 130,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.delete_outline))),
                                  ),
                                  ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cardList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        color: Colors.white,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 6),
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Column(
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                child: Center(
                                                  child: Text(
                                                    cardList[index]['size']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                  flex: 3,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: ListView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        children: [
                                                          for (var item
                                                              in cardList[index]
                                                                  ['qtyNsize'])
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          5.0),
                                                              child: Card(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Column(
                                                                    children: [
                                                                      Flexible(
                                                                          child: Center(
                                                                              child: Text(
                                                                        item[
                                                                            'color'],
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.black),
                                                                      ))),
                                                                      Flexible(
                                                                          child:
                                                                              Center(
                                                                        child: Text(
                                                                            item[
                                                                                'quantity'],
                                                                            style:
                                                                                const TextStyle(color: Colors.black)),
                                                                      ))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                        ],
                                                      )))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ))
                          : const Padding(
                              padding: EdgeInsets.only(top: 18.0),
                              child: Center(
                                  child: Text('size cards will appear here')),
                            ),
                    ],
                  ),
                ),
                //upload button
                Container(
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, top: 5.0, bottom: 5),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      gradient: LinearGradient(
                          colors: [Colors.grey, Colors.white],
                          begin: FractionalOffset(0.2, 0.2),
                          end: FractionalOffset(1.0, 1.0),
                          stops: [0.1, 1.0],
                          tileMode: TileMode.clamp)),
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "save updated product information",
                        style: TextStyle(
                            fontFamily: "SignikaSemiBold",
                            color: Colors.white,
                            fontSize: 14.0),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
