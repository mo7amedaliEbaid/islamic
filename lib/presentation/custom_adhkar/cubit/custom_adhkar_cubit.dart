
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../../domain/models/adhkar/custom_adhkar_model.dart';
import '../../../domain/usecase/base_usecase.dart';
import '../../../domain/usecase/del_all_custom_adhkar_usecase.dart';
import '../../../domain/usecase/del_custom_dhikr_by_id_usecase.dart';
import '../../../domain/usecase/get_all_custom_adhkar_usecase.dart';
import '../../../domain/usecase/insert_new_dhikr_usecase.dart';
import '../../../domain/usecase/update_custom_dhikr.dart';

part 'custom_adhkar_state.dart';

class CustomAdhkarCubit extends Cubit<CustomAdhkarState> {
  final GetAllCustomAdhkarUseCase _getAllCustomAdhkarUseCase =
      instance<GetAllCustomAdhkarUseCase>();
  final InsertNewDhikrUseCase _insertNewDhikrUseCase =
      instance<InsertNewDhikrUseCase>();
  final UpdateCustomDhikrUseCase _updateCustomDhikrUseCase =
      instance<UpdateCustomDhikrUseCase>();
  final DelCustomDhikrByDhikrTextUseCase _delCustomDhikrByDhikrTextUseCase =
      instance<DelCustomDhikrByDhikrTextUseCase>();
  final DelAllCustomAdhkarUseCase _delAllCustomAdhkarUseCase =
      instance<DelAllCustomAdhkarUseCase>();

  CustomAdhkarCubit() : super(CustomAdhkarInitial());

  static CustomAdhkarCubit get(context) => BlocProvider.of(context);

  bool isBotSheetShown = false;
  IconData fabIcon = Icons.add;

  void changeBotSheetState({
    required bool isShown,
  }) {
    isBotSheetShown = isShown;

    emit(ChangeBotSheetState());
  }

  List<CustomAdhkarEntity> customAdhkar = [];

  Future<void> getAllCustomAdhkar() async {
    emit(GetAllCustomAdhkarLoadingState());
    final result = await _getAllCustomAdhkarUseCase(const NoParameters());
    result.fold((l) {
      emit(GetAllCustomAdhkarErrorState(l.message));
    }, (r) {
      customAdhkar = r;
      emit(GetAllCustomAdhkarSuccessState());
    });
  }

  Future<void> insertNewDhikr(CustomAdhkarEntity dhikr) async {
    emit(InsertNewDhikrLoadingState());
    getAllCustomAdhkar();
    await _insertNewDhikrUseCase(dhikr).then((value) => value.fold((l) {
          emit(InsertNewDhikrErrorState(l.message));
        }, (r) {
          getAllCustomAdhkar();
          emit(InsertNewDhikrSuccessState());
        }));
  }

  Future<void> updateCustomDhikr(CustomAdhkarEntity dhikr) async {
    emit(UpdateCustomDhikrLoadingState());
    await _updateCustomDhikrUseCase(dhikr).then((value) => value.fold((l) {
          emit(UpdateCustomDhikrErrorState(l.message));
        }, (r) {
          getAllCustomAdhkar();
          emit(UpdateCustomDhikrSuccessState());
        }));
  }

  Future<void> delCustomDhikrByDhikrText(String dhikr) async {
    // emit(DelCustomDhikrByDhikrTextLoadingState());
    await _delCustomDhikrByDhikrTextUseCase(dhikr)
        .then((value) => value.fold((l) {
              emit(DelCustomDhikrByDhikrTextErrorState(l.message));
            }, (r) {
              getAllCustomAdhkar();
              emit(DelCustomDhikrByDhikrTextSuccessState());
            }));
  }

  Future<void> delAllCustomAdhkar() async {
    emit(DelAllCustomAdhkarLoadingState());
    await _delAllCustomAdhkarUseCase(customAdhkar)
        .then((value) => value.fold((l) {
              emit(DelAllCustomAdhkarErrorState(l.message));
            }, (r) {
              getAllCustomAdhkar();
              emit(DelAllCustomAdhkarSuccessState());
            }));
  }
}
