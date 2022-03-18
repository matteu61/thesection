import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:image_picker/image_picker.dart';
import 'package:thesection/src/data/data_providers/stock_data_provider.dart';
import 'package:thesection/src/data/models/on_sale.dart';

import 'package:thesection/src/data/models/stock_model.dart';
import 'package:thesection/src/data/repositaries/image_picker_repo.dart';
import 'package:thesection/src/data/repositaries/stock_repository.dart';
//import 'package:thesection/src/data/repositaries/stock_repository.dart';

part 'add_stock_event.dart';
part 'add_stock_state.dart';

class AddStockBloc extends Bloc<AddStockEvent, AddStockInitial> {
  AddStockBloc() : super(const AddStockInitial()) {
    on<TypingProductName>((event, emit) {
      _updateProductName(event, emit);
    });
    on<TypingCostPrice>((event, emit) {
      _updateCostPrice(event, emit);
    });
    on<TypingSalePrice>((event, emit) {
      _updateSalePrice(event, emit);
    });
    on<TypingProductType>((event, emit) {
      _updateProductType(event, emit);
    });
    on<TypingDescription>((event, emit) {
      _updateProductDescription(event, emit);
    });
    on<TypingSize>((event, emit) {
      _updateProductSize(event, emit);
    });
    on<TypingQuantity>((event, emit) {
      _updateProductQuantity(event, emit);
    });
    on<AddToHeadline>((event, emit) {
      _updateAddToHeadline(event, emit);
    });
    on<TypingHeadline>((event, emit) {
      _updateHeadline(event, emit);
    });
    on<UpdateFormState>((event, emit) {
      _updateFormState(event, emit);
    });
    on<OpenStockPage>((event, emit) {
      _updateOpenStockPage(event, emit);
    });
    on<AddedImages>((event, emit) {
      _addImages(event, emit);
    });
    on<RemoveImage>((event, emit) {
      _removeImage(event, emit);
    });
    on<SizeCard>((event, emit) {
      _addColorNQty(event, emit);
    });
    on<RemoveColorQty>((event, emit) {
      _removeColorNQty(event, emit);
    });
    on<AddSizeblock>((event, emit) {
      _addNewSize(event, emit);
    });
    on<RemoveSizeBlock>((event, emit) {
      _removeSizeblok(event, emit);
    });
    on<TypingColor>((event, emit) {
      _updateColor(event, emit);
    });
    on<SendForm>((event, emit) {
      _sendForm(event, emit);
    });
    on<SalePercentage>((event, emit) {
      _addPercentage(event, emit);
    });
    on<TypingHeadlineDescription>((event, emit) {
      _updateHeadlineDescription(event, emit);
    });

    on<OnSale>((event, emit) => _addOnSale(event, emit));
  }

  void _removeImage(RemoveImage event, Emitter<AddStockInitial> emit) async {
    List<XFile> pix = List.from(state.images);
    pix.removeAt(event.index);
    emit(state.copyWith(
      images: pix.toList(),
    ));
  }

//upload form
  _uploadform(Emitter<AddStockInitial> emit) async {
    try {
      StockDao().addNewStock(Stock(
        header: state.headLineHeading,
        addToHeadline: state.addToHeadline.added,
        costPrice: state.costPrice,
        description: state.description,
        images: state.downloadUrls,
        name: state.name,
        headlineDescription: state.headlineDescription,
        salePrice: state.salePrice,
        productType: state.productType,
        sizeNqty: state.sizeNqty,
      ).toJson());
      emit(state.copyWith(
          sizeNqty: [], images: [], imageState: ImageUploadState.formSucces));
    } catch (e) {
      print('failed form upload,');
      emit(state.copyWith(imageState: ImageUploadState.formFailed));
    }
  }

  //upload images
  _uploadImages(Emitter<AddStockInitial> emit) async {
    List<String> downloadUrls = [];
    emit(state.copyWith(
      imageState: ImageUploadState.uploadingImages,
    ));
    print('got images, ${state.images.length}');
    try {
      for (var item in state.images) {
        Storage storage = Storage();
        String url = await storage.uploadImages(item);

        print('failed uploading images, $url');
        downloadUrls.add(url);
        emit(state.copyWith(
          downloadUrls: downloadUrls.toList(),
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        imageState: ImageUploadState.none,
      ));
      print('failed uploading images, $e');
    }
  }

  _uplImages(Emitter<AddStockInitial> emit) async {
    Storage storage = Storage();
    List<String> downloadUrls = [];
    for (var i = 0; i <= state.images.length - 1; i++) {
      emit(state.copyWith(imageState: ImageUploadState.uploadingImages));
      await storage.uploadImage(state.images[i]).then((value) {
        print(
            'Progress: ${(value.bytesTransferred / value.totalBytes) * 100} %');
      }).onError((error, stackTrace) {
        print('$error,$stackTrace');
        emit(state.copyWith(imageState: ImageUploadState.failedImages));
      }).whenComplete(() {
        print('succesfully loaded image ${i + 1}');
      });
    }
  }

  void _sendForm(SendForm event, Emitter<AddStockInitial> emit) async {
    await _uplImages(emit);
    emit(state.copyWith(
        description: event.description,
        name: event.name,
        costPrice: event.costPrice,
        salePrice: event.salePrice,
        productType: event.productType,
        imageState: ImageUploadState.sendingForm));
    await _uploadform(emit);
  }

  void _addImages(AddedImages event, Emitter<AddStockInitial> emit) async {
    if (event.imageUploadState == ImageUploadState.gotImages) {
      emit(state.copyWith(
        images: event.images,
      ));
    }
  }

  final List<Map<String, dynamic>> _colNqtyItems = [];
  List<Map<String, dynamic>> get items => _colNqtyItems;
  final List<Map<String, dynamic>> _sizeItems = [];
  List<Map<String, dynamic>> get sizeItems => _sizeItems;

  void _addOnSale(OnSale event, Emitter<AddStockInitial> emit) {
    emit(state.copyWith(onSale: event.added));
  }

  void _addPercentage(SalePercentage event, Emitter<AddStockInitial> emit) {
    emit(state.copyWith(discount: event.percentage));
  }

  void _addColorNQty(SizeCard event, Emitter<AddStockInitial> emit) {
    _colNqtyItems.add(event.entry);
    emit(state.copyWith(size: event.size, sizeQtyList: items.toList()));
    _colNqtyItems.clear;
    print(state.sizeQtyList);
  }

  void _removeColorNQty(
      RemoveColorQty event, Emitter<AddStockInitial> emit) async {
    if (event.index.isNaN) {
    } else {
      _colNqtyItems.removeAt(event.index);

      emit(state.copyWith(sizeQtyList: items.toList()));
    }
  }

  void _removeSizeblok(
      RemoveSizeBlock event, Emitter<AddStockInitial> emit) async {
    List<Map<String, dynamic>> pix = List.from(state.sizeNqty);
    pix.removeAt(event.index);
    emit(state.copyWith(
      sizeNqty: pix.toList(),
    ));
  }

  void _addNewSize(AddSizeblock event, Emitter<AddStockState> emit) async {
    List<Map<String, dynamic>> sizeblokk = state.sizeNqty;
    if (sizeblokk.contains(event.entry)) {
    } else {
      _colNqtyItems.clear();
      _sizeItems.clear();
      _sizeItems.addAll(sizeblokk);
      _sizeItems.add(event.entry);

      print('adding');
      emit(state
          .copyWith(sizeNqty: _sizeItems.toList(), name: '', sizeQtyList: []));

      print('state szqty: ${state.sizeNqty}');
    }
  }

  void _updateProductName(
      TypingProductName event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(name: event.productName));
  }

  void _updateCostPrice(TypingCostPrice event, Emitter<AddStockInitial> emit) {
    emit(state.copyWith(costPrice: event.costPrice));
  }

  void _updateColor(TypingColor event, Emitter<AddStockInitial> emit) async {
    emit(state.copyWith(color: event.color));
  }

  void _updateSalePrice(
      TypingSalePrice event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(salePrice: event.salePrice));
  }

  void _updateProductType(
      TypingProductType event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(productType: event.productType));
  }

  void _updateProductDescription(
      TypingDescription event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(description: event.description));
  }

  void _updateProductSize(
      TypingSize event, Emitter<AddStockInitial> emit) async {
    emit(state.copyWith(size: event.size));
  }

  void _updateProductQuantity(
      TypingQuantity event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(quantity: event.quantity));
  }

  void _updateAddToHeadline(
      AddToHeadline event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(addToHeadline: event.added));
  }

  void _updateHeadline(
      TypingHeadline event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(headlineHeading: event.headline));
  }

  void _updateHeadlineDescription(
      TypingHeadlineDescription event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(headlineDesciption: event.headline));
  }

  void _updateOpenStockPage(
      OpenStockPage event, Emitter<AddStockState> emit) async {
    emit(state.copyWith(openAddStockPage: event.open));
  }

  Future<void> _updateFormState(
      UpdateFormState event, Emitter<AddStockState> emit) async {
    if (event.formstate == Formstate.sent) {
      emit(state.copyWith(formState: event.formstate));
      try {
        StockRepo stok = StockRepo();

        stok.stock.addNewStock(state.toMap());
      } catch (e) {
        emit(state.copyWith(formState: Formstate.validationFailed));
      }
    }
    if (event.formstate == Formstate.typing) {
      emit(state.copyWith(formState: event.formstate));
    }
  }
}
