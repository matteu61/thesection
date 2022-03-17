import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thesection/src/business_logic/blocs/add_stock/add_stock_bloc.dart';
import 'package:thesection/src/data/models/on_sale.dart';
import 'package:thesection/src/data/models/size_color_entry.dart';
import 'package:thesection/src/data/models/sizeblock.dart';
import 'package:thesection/src/data/repositaries/image_picker_repo.dart';
import 'package:thesection/src/presentation/shared_widgets/loadingScreen.dart';

class AddStockBuilder extends StatelessWidget {
  const AddStockBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return const AddStockDesktop();
        } else {
          return const AddStockMobile();
        }
      },
    );
  }
}

class AddStockMobile extends StatefulWidget {
  const AddStockMobile({Key? key}) : super(key: key);

  @override
  _AddStockMobileState createState() => _AddStockMobileState();
}

class _AddStockMobileState extends State<AddStockMobile> {
  //keys
  final formKey = GlobalKey<FormState>();
  final secondformKey = GlobalKey<FormState>();
  final FocusNode focusProductType = FocusNode();
  final FocusNode focusNames = FocusNode();
  final FocusNode focusNames1 = FocusNode();
  final FocusNode focusSizes = FocusNode();
  final FocusNode focusColors = FocusNode();
  final FocusNode focusDescription = FocusNode();
  final FocusNode focusQuantities = FocusNode();
  final FocusNode focusSalePrice = FocusNode();
  final FocusNode focusCostPrice = FocusNode();
  final FocusNode focusImages = FocusNode();
  final FocusNode focusHilight = FocusNode();
  final FocusNode focusHeadlineDescription = FocusNode();
  final FocusNode addToDescription = FocusNode();
  final FocusNode focusHeader = FocusNode();
  final FocusNode focusCost = FocusNode();
  final FocusNode focusSale = FocusNode();
  final FocusNode focusPercentage = FocusNode();
  final TextEditingController percentageController = TextEditingController();
  final TextEditingController saleController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController headerController = TextEditingController();
  final TextEditingController hilightController = TextEditingController();
  Future<List<XFile>>? imagesPicked;
  Widget _productCostPrice(FocusNode node, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: TextFormField(
        validator: (value) {
          if (RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
            return null;
          } else {
            return 'Please enter valid number';
          }
        },
        controller: costController,
        focusNode: node,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontFamily: "SignikaSemiBold", fontSize: 16.0, color: Colors.grey),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: false,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            fillColor: Colors.black,
            isCollapsed: false,
            label: Text(
              'Enter product cost price',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintStyle:
                const TextStyle(fontFamily: "SignikaSemiBold", fontSize: 18.0)),
      ),
    );
  }

  Widget _productSalePrice(FocusNode node, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: TextFormField(
        validator: (value) {
          if (RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
            return null;
          } else {
            return 'Please enter valid number';
          }
        },
        controller: saleController,
        focusNode: focusSale,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontFamily: "SignikaSemiBold", fontSize: 16.0, color: Colors.grey),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: false,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            fillColor: Colors.black,
            isCollapsed: false,
            label: Text(
              'Enter product sale price',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintStyle:
                const TextStyle(fontFamily: "SignikaSemiBold", fontSize: 18.0)),
      ),
    );
  }

  Widget _productColor(FocusNode node, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return null;
          } else {
            return 'Enter valid color, letters only';
          }
        },
        controller: colorController,
        focusNode: node,
        keyboardType: TextInputType.text,
        style: const TextStyle(
            fontFamily: "SignikaSemiBold", fontSize: 16.0, color: Colors.grey),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: false,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            fillColor: Colors.black,
            isCollapsed: false,
            label: Text(
              'Enter color relative to size',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintStyle:
                const TextStyle(fontFamily: "SignikaSemiBold", fontSize: 18.0)),
      ),
    );
  }

  Widget _productSize(BuildContext context, FocusNode node) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return null;
          } else {
            return 'Enter valid name consisting of letters only';
          }
        },
        controller: sizeController,
        focusNode: node,
        keyboardType: TextInputType.text,
        style: const TextStyle(
            fontFamily: "SignikaSemiBold", fontSize: 16.0, color: Colors.grey),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: false,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            fillColor: Colors.black,
            isCollapsed: false,
            label: Text(
              'Enter product size',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintStyle:
                const TextStyle(fontFamily: "SignikaSemiBold", fontSize: 18.0)),
      ),
    );
  }

  Widget _productQuantity(BuildContext context, FocusNode node) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: TextFormField(
        validator: (value) {
          if (RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
            return null;
          } else {
            return 'Please enter valid number';
          }
        },
        controller: quantityController,
        focusNode: node,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontFamily: "SignikaSemiBold", fontSize: 16.0, color: Colors.grey),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            alignLabelWithHint: false,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            fillColor: Colors.black,
            isCollapsed: false,
            label: Text(
              'Enter quantity for this color',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintStyle:
                const TextStyle(fontFamily: "SignikaSemiBold", fontSize: 18.0)),
      ),
    );
  }

  Widget _productDescription(BuildContext context, FocusNode node) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return null;
          } else {
            return 'Enter valid description consisting of letters only';
          }
        },
        controller: descriptionController,
        focusNode: node,
        keyboardType: TextInputType.text,
        style: const TextStyle(
            fontFamily: "SignikaSemiBold", fontSize: 16.0, color: Colors.grey),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            fillColor: Colors.black,
            isCollapsed: false,
            label: Text(
              'Enter product description',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintStyle:
                const TextStyle(fontFamily: "SignikaSemiBold", fontSize: 18.0)),
      ),
    );
  }

  Widget _productName(BuildContext context, FocusNode node) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return null;
          } else {
            return 'Enter valid name consisting of letters only';
          }
        },
        controller: nameController,
        focusNode: node,
        keyboardType: TextInputType.text,
        style: const TextStyle(
            fontFamily: "SignikaSemiBold", fontSize: 16.0, color: Colors.grey),
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            fillColor: Colors.black,
            isCollapsed: false,
            label: Text(
              'Enter product name',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintStyle:
                const TextStyle(fontFamily: "SignikaSemiBold", fontSize: 18.0)),
      ),
    );
  }

//headline data
  Widget _addtoHeadline(BuildContext context) {
    return BlocBuilder<AddStockBloc, AddStockInitial>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Switch(
                value: state.addToHeadline.added,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  context
                      .read<AddStockBloc>()
                      .add(AddToHeadline(added: AddHilight(added: value)));
                }));
      },
    );
  }

  //headline data
  Widget _addHeadlineData(BuildContext context, double width) {
    return BlocBuilder<AddStockBloc, AddStockInitial>(
      builder: (context, state) {
        return state.addToHeadline.added
            ? Container(
                width: width,
                height: 150,
                color: Colors.black,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, left: 10.0, right: 10.0),
                        child: TextFormField(
                          onChanged: (value) => context
                              .read<AddStockBloc>()
                              .add(TypingHeadline(
                                  headline: value.toString().trim())),
                          controller: headerController,
                          focusNode: focusHeader,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16.0,
                              color: Colors.grey),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              alignLabelWithHint: false,
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              fillColor: Colors.black,
                              isCollapsed: false,
                              label: Text(
                                'Enter product highlite heading',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              hintStyle: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 18.0)),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, left: 10.0, right: 10.0),
                        child: TextFormField(
                          onChanged: (value) => context
                              .read<AddStockBloc>()
                              .add(TypingHeadlineDescription(
                                  headline: value.toString().trim())),
                          controller: hilightController,
                          focusNode: focusHilight,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              fontFamily: "SignikaSemiBold",
                              fontSize: 16.0,
                              color: Colors.grey),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              alignLabelWithHint: false,
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              fillColor: Colors.black,
                              isCollapsed: false,
                              label: Text(
                                'Enter product highlite description',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                              hintStyle: const TextStyle(
                                  fontFamily: "SignikaSemiBold",
                                  fontSize: 18.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }

//add on sale data n button
  Widget _onSale(BuildContext context) {
    return BlocBuilder<AddStockBloc, AddStockInitial>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Switch(
                value: state.onSale.putOnSale,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  context
                      .read<AddStockBloc>()
                      .add(OnSale(added: PutOnSale(putOnSale: value)));
                }));
      },
    );
  }

  Widget _addOnSaleData(BuildContext context, double width) {
    return BlocBuilder<AddStockBloc, AddStockInitial>(
      builder: (context, state) {
        return state.onSale.putOnSale
            ? Container(
                padding: const EdgeInsets.only(top: 6, right: 10, left: 10),
                width: width,
                height: 80,
                color: Colors.black,
                child: Center(
                  child: SizedBox(
                    width: width,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          return context.read<AddStockBloc>().add(
                              SalePercentage(
                                  percentage:
                                      num.parse(percentageController.text)));
                        }
                      },
                      controller: percentageController,
                      focusNode: focusPercentage,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontFamily: "SignikaSemiBold",
                          fontSize: 16.0,
                          color: Colors.grey),
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          alignLabelWithHint: false,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          fillColor: Colors.black,
                          isCollapsed: false,
                          label: Text(
                            'Enter percentage off on amount',
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          hintStyle: const TextStyle(
                              fontFamily: "SignikaSemiBold", fontSize: 18.0)),
                    ),
                  ),
                ))
            : const SizedBox();
      },
    );
  }

//add color and qty button
  Padding colorQtyButton(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 13),
      child: SizedBox(
          width: width - 28,
          height: 45,
          child: BlocBuilder<AddStockBloc, AddStockInitial>(
            builder: (context, state) {
              return MaterialButton(
                  color: const Color.fromARGB(255, 25, 76, 92),
                  child: const Text(
                    'Add  color and quantity',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    if (secondformKey.currentState!.validate() == true) {
                      context.read<AddStockBloc>().add(SizeCard(
                            entry: ColorSizeEntry(
                              color: colorController.text,
                              quantity: int.parse(quantityController.text),
                            ).toJson(),
                            size: sizeController.text,
                          ));

                      colorController.clear();
                      quantityController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Enter quantity, size and color first!',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      ));
                    }
                  });
            },
          )),
    );
  }

//uploaded images display
  BlocBuilder<AddStockBloc, AddStockInitial> imageContainers(double width) {
    return BlocBuilder<AddStockBloc, AddStockInitial>(
      builder: (context, state) {
        return state.images.isNotEmpty
            ? Container(
                width: width,
                height: 110,
                color: Colors.black,
                margin: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: (SizedBox(
                            width: 80,
                            height: 80,
                            child: Stack(
                              children: [
                                Image.network(state.images[index].path,
                                    fit: BoxFit.fill),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: IconButton(
                                        onPressed: () {
                                          context
                                              .read<AddStockBloc>()
                                              .add(RemoveImage(
                                                index: index,
                                              ));
                                        },
                                        icon: const Icon(
                                          Icons.close_outlined,
                                          size: 18,
                                        )),
                                  ),
                                )
                              ],
                            ))),
                      );
                    }),
              )
            : const SizedBox();
      },
    );
  }

// display of all sizes for product
  BlocBuilder<AddStockBloc, AddStockInitial> sizeBlocks(double width) {
    return BlocBuilder<AddStockBloc, AddStockInitial>(
      builder: (context, state) {
        if (state.sizeNqty.isNotEmpty) {
          return SizedBox(
            width: width,
            height: 110,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.sizeNqty.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: SizedBox(
                      height: 90,
                      width: 100,
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        child: Column(children: [
                          //size heading
                          Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  state.sizeNqty[index]['size'],
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              )),
                          //color n qty list
                          Flexible(
                              flex: 2,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (var item in state.sizeNqty[index]
                                      ['colorNqty'])
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      margin: const EdgeInsets.only(
                                          left: 4, top: 7, right: 4),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: (Column(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Center(
                                              child: Text(
                                                'color: ${item['color']}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Center(
                                              child: Text(
                                                'qty: ${item['quantity']}',
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                    )
                                ],
                              )),
                          //remove size card
                          Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 4,
                                  top: 2,
                                ),
                                child: IconButton(
                                  splashRadius: 15,
                                  splashColor: Colors.white24,
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<AddStockBloc>()
                                        .add(RemoveSizeBlock(index: index));
                                  },
                                ),
                              ))
                        ]),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

//add size for button
  Padding addSizeButton(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 13),
      child: SizedBox(
        width: width,
        height: 45,
        child: BlocBuilder<AddStockBloc, AddStockInitial>(
          builder: (context, state) {
            return MaterialButton(
              color: const Color.fromARGB(255, 13, 110, 20),
              child: const Text(
                'Add  size',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (state.sizeQtyList.isNotEmpty) {
                  SizeBlock bloc =
                      SizeBlock(size: state.size, colQty: state.sizeQtyList);
                  context
                      .read<AddStockBloc>()
                      .add(AddSizeblock(entry: bloc.toJson()));
                  sizeController.clear();
                }
              },
            );
          },
        ),
      ),
    );
  }

  //title
  Center title() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 13.0, bottom: 14),
        child: Text(
          'Add a  product ',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AddStockBloc(),
      child: Builder(builder: (context) {
        return Stack(
          children: [
            Container(
              height: height,
              width: width,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(15),
              child: Card(
                color: Colors.white,
                child: Form(
                  key: formKey,
                  child: SizedBox(
                    height: height - 60,
                    width: width,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        title(),
                        Container(
                            margin: const EdgeInsets.only(bottom: 7),
                            width: width,
                            height: 1,
                            color: Colors.black),
                        _productName(
                          context,
                          focusNames,
                        ),
                        _productDescription(context, focusDescription),
                        //cost
                        _productCostPrice(focusCost, context),

                        //sale
                        _productSalePrice(focusSale, context),
                        //add to headline switch
                        Container(
                          margin: const EdgeInsets.only(top: 9),
                          width: width,
                          height: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              flex: 7,
                              child: Padding(
                                padding: EdgeInsets.only(left: 22.0, top: 7),
                                child: Text(
                                  'Add this product to highlights reel?',
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ),
                            Flexible(flex: 1, child: _addtoHeadline(context)),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          width: width,
                          height: 1,
                          color: Colors.grey,
                        ),
                        _addHeadlineData(context, width),
                        //add on sale
                        Container(
                          margin: const EdgeInsets.only(top: 9),
                          width: width,
                          height: 1,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              flex: 7,
                              child: Padding(
                                padding: EdgeInsets.only(left: 22.0, top: 7),
                                child: Text(
                                  'Is product on sale?',
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ),
                            Flexible(flex: 1, child: _onSale(context)),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          width: width,
                          height: 1,
                          color: Colors.grey,
                        ),
                        //on sale data
                        _addOnSaleData(context, width),
                        //enter size color quantity
                        Form(
                          key: secondformKey,
                          child: SizedBox(
                              height: 135,
                              width: width,
                              child: Column(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: _productSize(context, focusSizes),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                              child: _productColor(
                                            focusColors,
                                            context,
                                          )),
                                          Flexible(
                                              child: _productQuantity(
                                                  context, focusQuantities))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),

                        //add color n qty button
                        colorQtyButton(width),
                        //color qty blocks
                        BlocBuilder<AddStockBloc, AddStockInitial>(
                          builder: (context, state) {
                            if (state.sizeQtyList.isNotEmpty) {
                              return SizedBox(
                                  height: 150,
                                  width: width,
                                  child: Column(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13.0, top: 4),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Colors and quantities for size ${state.size}',
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ),
                                      ),
                                      Flexible(
                                          flex: 5,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  state.sizeQtyList.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 2,
                                                            right: 2,
                                                            bottom: 8),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12,
                                                        vertical: 7),
                                                    width: 95,
                                                    height: 60,
                                                    color: Colors.black,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Center(
                                                            child: Text(
                                                              'color: ${state.sizeQtyList[index]['color']}',
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          13),
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Center(
                                                            child: Text(
                                                              'qty: ${state.sizeQtyList[index]['quantity']}',
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                            flex: 1,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          8.0),
                                                              child: IconButton(
                                                                splashRadius:
                                                                    27,
                                                                splashColor:
                                                                    Colors
                                                                        .white24,
                                                                icon:
                                                                    const Icon(
                                                                  Icons.delete,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                onPressed: () {
                                                                  context
                                                                      .read<
                                                                          AddStockBloc>()
                                                                      .add(RemoveColorQty(
                                                                          index:
                                                                              index));
                                                                  print(
                                                                      'pressed');
                                                                },
                                                              ),
                                                            ))
                                                      ],
                                                    ));
                                              })),
                                    ],
                                  ));
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        //Add  size button
                        addSizeButton(width),
                        //size blocks
                        sizeBlocks(width),
                        //add images
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SizedBox(
                              width: width,
                              height: 50,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                  ),
                                  child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 2.0, color: Colors.blue),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 18.0),
                                            child: Text('Add product images'),
                                          ),
                                          Center(
                                              child: Icon(
                                            Icons.image_search,
                                            color: Colors.grey,
                                          )),
                                        ],
                                      ),
                                      onPressed: () async {
                                        ImageRepo image = const ImageRepo();

                                        List<XFile>? pictures =
                                            await image.getMultipleImages();
                                        context.read<AddStockBloc>().add(
                                            AddedImages(
                                                images: pictures,
                                                imageUploadState:
                                                    ImageUploadState
                                                        .gotImages));
                                      }),
                                ),
                              )),
                        ),
                        //images row
                        imageContainers(width),
                        //ADD TO DATABASE
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 9),
                          child: SizedBox(
                            height: 40,
                            width: 70,
                            child: BlocBuilder<AddStockBloc, AddStockInitial>(
                              builder: (context, state) {
                                return MaterialButton(
                                  color: const Color.fromARGB(255, 165, 3, 165),
                                  onPressed: () {
                                    if (formKey.currentState!.validate() ==
                                        true) {
                                      if (state.sizeNqty.isNotEmpty &&
                                          state.images.isNotEmpty) {
                                        context
                                            .read<AddStockBloc>()
                                            .add(SendForm(
                                              description:
                                                  descriptionController.text,
                                              name: nameController.text,
                                              costPrice: num.parse(
                                                  costController.text),
                                              salePrice: num.parse(
                                                  saleController.text),
                                              productType: typeController.text,
                                            ));
                                        formKey.currentState!.reset();
                                        secondformKey.currentState!.reset();
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    'Add size, quantity and product images ')));
                                      }
                                    } else {
                                      print('fail');
                                    }
                                  },
                                  child: const Text(
                                    'Upload Product',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //loading page overlay
            BlocBuilder<AddStockBloc, AddStockInitial>(
              builder: (context, state) {
                switch (state.imageState) {
                  case ImageUploadState.sendingForm:
                    return LoadingView(
                      height: height,
                      width: width,
                      message: 'Sending form...',
                    );
                  case ImageUploadState.uploadingImages:
                    return LoadingView(
                      height: height,
                      width: width,
                      message: 'Uploading Images...',
                    );
                  default:
                    return const SizedBox();
                }
              },
            )
          ],
        );
      }),
    );
  }
}

//desktop version

class AddStockDesktop extends StatefulWidget {
  const AddStockDesktop({Key? key}) : super(key: key);

  @override
  _AddStockDesktopState createState() => _AddStockDesktopState();
}

class _AddStockDesktopState extends State<AddStockDesktop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      height: height,
      width: width,
    );
  }
}
