part of 'add_stock_bloc.dart';

abstract class AddStockState extends Equatable {
  const AddStockState();

  @override
  List<Object> get props => [];
}

enum Formstate { typing, validated, validationFailed, sent }
enum ImageUploadState {
  none,
  uploadingImages,
  sendingForm,
  formSucces,
  formFailed,
  gotImages,
  successImages,
  failedImages,
}

class Stockinit extends AddStockState {}

class AddStockInitial extends AddStockState {
  final PutOnSale onSale;
  final String productType;
  final String headLineHeading;
  bool get isvValidProductType => productType.isNotEmpty;
  final List<String> downloadUrls;
  final num discount;
  final bool sizeCardStatus;
  final Formstate formstate;
  final num salePrice;
  bool get isValidPrice => salePrice > 0;
  final List<XFile> images;
  final ImageUploadState imageState;
  final String size;
  bool get isValidSize => size.isNotEmpty;
  final bool openAddStockPage;
  final num quantity;
  bool get isValidQty => quantity.isNaN == false || quantity > 0;
  final String color;
  bool get isValidColor => color.isNotEmpty;
  final List<Map<String, dynamic>> sizeQtyList;
  final List<Map<String, dynamic>> sizeNqty;
  bool get isValidSizeNqty => sizeNqty.isNotEmpty;
  final num costPrice;
  final AddHilight addToHeadline;
  final String name;
  bool get isValidProductName => name.isNotEmpty;
  final String description;
  bool get isValidDestricption => description.isNotEmpty;
  final String headlineDescription;
  bool get isValidHeadline => headlineDescription.isNotEmpty;

  const AddStockInitial({
    this.onSale = const PutOnSale(putOnSale: false),
    this.headLineHeading = '',
    this.discount = 0,
    this.sizeCardStatus = false,
    this.sizeQtyList = const [],
    this.downloadUrls = const [],
    this.openAddStockPage = false,
    this.formstate = Formstate.typing,
    this.imageState = ImageUploadState.none,
    this.sizeNqty = const [],
    this.productType = '',
    this.salePrice = 0,
    this.size = '',
    this.quantity = 0,
    this.color = '',
    this.addToHeadline = const AddHilight(added: false),
    this.name = '',
    this.description = '',
    this.headlineDescription = '',
    this.costPrice = 0,
    this.images = const [],
  });

  @override
  List<Object> get props => [
        headLineHeading,
        productType,
        salePrice,
        costPrice,
        color,
        addToHeadline,
        quantity,
        images,
        name,
        description,
        headlineDescription,
        formstate,
        openAddStockPage,
        imageState,
        downloadUrls,
        sizeNqty,
        sizeQtyList,
        discount,
        onSale
      ];

  AddStockInitial copyWith(
      {String? productType,
      PutOnSale? onSale,
      List<String>? downloadUrls,
      String? headlineHeading,
      List<Map<String, dynamic>>? sizeQtyList,
      num? salePrice,
      List<XFile>? images,
      String? size,
      String? color,
      num? costPrice,
      List<Map<String, dynamic>>? sizeNqty,
      AddHilight? addToHeadline,
      String? name,
      String? description,
      String? headlineDesciption,
      num? quantity,
      Formstate? formState,
      bool? openAddStockPage,
      num? discount,
      bool? sizeCardStatus,
      ImageUploadState? imageState}) {
    return AddStockInitial(
      onSale: onSale ?? this.onSale,
      headLineHeading: headlineHeading ?? headLineHeading,
      sizeCardStatus: sizeCardStatus ?? this.sizeCardStatus,
      discount: discount ?? this.discount,
      downloadUrls: downloadUrls ?? this.downloadUrls,
      sizeQtyList: sizeQtyList ?? this.sizeQtyList,
      sizeNqty: sizeNqty ?? this.sizeNqty,
      imageState: imageState ?? this.imageState,
      images: images ?? this.images,
      openAddStockPage: openAddStockPage ?? this.openAddStockPage,
      productType: productType ?? this.productType,
      salePrice: salePrice ?? this.salePrice,
      costPrice: costPrice ?? this.costPrice,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      addToHeadline: addToHeadline ?? this.addToHeadline,
      name: name ?? this.name,
      description: description ?? this.description,
      headlineDescription: headlineDesciption ?? headlineDescription,
      formstate: formState ?? formstate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productType': productType,
      'salePrice': salePrice,
      'images': images,
      'size': size,
      'quantity': quantity,
      'color': color,
      'sizeNqty': sizeNqty,
      'costPrice': costPrice,
      'addToHeadline': addToHeadline,
      'name': name,
      'description': description,
      'headlineDescription': headlineDescription,
    };
  }

  String toJson() => json.encode(toMap());
}
