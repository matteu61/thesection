part of 'add_stock_bloc.dart';

abstract class AddStockEvent extends Equatable {
  const AddStockEvent();
  @override
  List<Object> get props => [];
}

class TypingProductName extends AddStockEvent {
  final String productName;
  const TypingProductName({required this.productName});
  @override
  List<Object> get props => [productName];
}

class ImageState extends AddStockEvent {
  final ImageUploadState imageUploadState;
  const ImageState({required this.imageUploadState});
  @override
  List<Object> get props => [imageUploadState];
}

class OpenStockPage extends AddStockEvent {
  final bool open;
  const OpenStockPage(this.open);
  @override
  List<Object> get props => [open];
}

class AddImage extends AddStockEvent {
  final List<XFile> image;
  const AddImage({required this.image});

  @override
  List<Object> get props => [image];
}

class RemoveImage extends AddStockEvent {
  final int index;
  const RemoveImage({required this.index});

  @override
  List<Object> get props => [index];
}

class AddedImages extends AddStockEvent {
  final List<XFile> images;
  final ImageUploadState imageUploadState;

  const AddedImages({required this.images, required this.imageUploadState});
  @override
  List<Object> get props => [images, imageUploadState];
}

class TypingSalePrice extends AddStockEvent {
  final num salePrice;
  @override
  List<Object> get props => [salePrice];
  const TypingSalePrice({required this.salePrice});
}

class TypingCostPrice extends AddStockEvent {
  final num costPrice;
  const TypingCostPrice({required this.costPrice});
  @override
  List<Object> get props => [costPrice];
}

class TypingProductType extends AddStockEvent {
  final String productType;
  const TypingProductType({required this.productType});
  @override
  List<Object> get props => [productType];
}

class AddColorQty extends AddStockEvent {
  @override
  List<Object> get props => [];
}

class AddSizeblock extends AddStockEvent {
  final Map<String, dynamic> entry;

  const AddSizeblock({required this.entry});

  @override
  List<Object> get props => [entry];
}

class SendForm extends AddStockEvent {
  final String productType;

  final num salePrice;

  final num costPrice;

  final String name;

  final String description;

  const SendForm({
    required this.productType,
    required this.salePrice,
    required this.costPrice,
    required this.name,
    required this.description,
  });

  @override
  List<Object> get props => [
        productType,
        salePrice,
        costPrice,
        description,
        name,
      ];
}

class RemoveSizeBlock extends AddStockEvent {
  final int index;
  const RemoveSizeBlock({required this.index});

  @override
  List<Object> get props => [index];
}

class RemoveColorQty extends AddStockEvent {
  final int index;
  const RemoveColorQty({required this.index});

  @override
  List<Object> get props => [index];
}

class TypingDescription extends AddStockEvent {
  final String description;
  const TypingDescription({required this.description});

  @override
  List<Object> get props => [description];
}

class Warning extends AddStockEvent {
  final String description;
  const Warning({required this.description});

  @override
  List<Object> get props => [description];
}

class Success extends AddStockEvent {
  final String description;
  const Success({required this.description});

  @override
  List<Object> get props => [description];
}

class TypingSize extends AddStockEvent {
  final String size;
  const TypingSize({required this.size});
  @override
  List<Object> get props => [size];
}

class SizeCard extends AddStockEvent {
  final String size;
  final Map<String, dynamic> entry;
  const SizeCard({required this.size, required this.entry});
  @override
  List<Object> get props => [size, entry];
}

class TypingColor extends AddStockEvent {
  final String color;
  const TypingColor({required this.color});
  @override
  List<Object> get props => [color];
}

class TypingQuantity extends AddStockEvent {
  final num quantity;
  const TypingQuantity({required this.quantity});
  @override
  List<Object> get props => [quantity];
}

class AddToHeadline extends AddStockEvent {
  final AddHilight added;
  const AddToHeadline({required this.added});
  @override
  List<Object> get props => [added];
}

class OnSale extends AddStockEvent {
  final PutOnSale added;
  const OnSale({required this.added});
  @override
  List<Object> get props => [added];
}

class SalePercentage extends AddStockEvent {
  final num percentage;
  const SalePercentage({required this.percentage});
  @override
  List<Object> get props => [percentage];
}

class TypingHeadline extends AddStockEvent {
  final String headline;
  const TypingHeadline({required this.headline});
  @override
  List<Object> get props => [headline];
}

class TypingHeadlineDescription extends AddStockEvent {
  final String headline;
  const TypingHeadlineDescription({required this.headline});
  @override
  List<Object> get props => [headline];
}

class UpdateFormState extends AddStockEvent {
  final Formstate formstate;
  const UpdateFormState({required this.formstate});
}

class AddSizeColQty extends AddStockEvent {
  @override
  List<Object> get props => [];
}

class RemoveSizeColQty extends AddStockEvent {
  final int index;
  const RemoveSizeColQty({required this.index});

  @override
  List<Object> get props => [index];
}

class FormSentSuccess extends AddStockEvent {}

class FormSentFailed extends AddStockEvent {}
