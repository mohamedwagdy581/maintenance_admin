
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/request_model.dart';
import 'requests_states.dart';

class RequestCubit extends Cubit<RequestStates>
{
  RequestCubit() : super(RequestInitialState());

  static RequestCubit get(context) => BlocProvider.of(context);

  // Done Technical Requests
  void technicalDoneRequest(
      {
        required String city,
        required String companyName,
        required String school,
        required String technicalPhone,
        required String technicalName,
        required String customerPhone,
        required String machineImage,
        required String machineTypeImage,
        required String damageImage,
        required String consultation,
        required double latitude,
        required double longitude,
      })
  {
    emit(RequestLoadingState());

    FirebaseFirestore.instance.collection(city).doc(city).collection('doneRequests').doc().get().then((value)
    {

      createDoneRequest(
        city: city,
        companyName: companyName,
        technicalName: technicalName,
        school: school,
        technicalPhone: technicalPhone,
        customerPhone: customerPhone,
        machineImage: machineImage,
        uId: value.id.toString(),
        machineTypeImage: machineTypeImage.toString(),
        damageImage: damageImage.toString(),
        consultation: consultation.toString(),
        latitude: latitude,
        longitude: longitude,
        //isEmailVerified: value.user!.emailVerified.toString(),
      );
    }).catchError((error)
    {
      emit(RequestErrorState(error.toString()));
    });
  }

  void createDoneRequest(
      {
        required String city,
        required String companyName,
        required String technicalName,
        required String school,
        required String technicalPhone,
        required String customerPhone,
        required String machineImage,
        required String uId,
        required String machineTypeImage,
        required String damageImage,
        required String consultation,
        required double latitude,
        required double longitude,
      })
  {

    RequestModel model = RequestModel(
      city: city,
      companyName: companyName,
      technicalName: technicalName,
      school: school,
      technicalPhone: technicalPhone,
      customerPhone: customerPhone,
      machineImage: machineImage,
      uId: uId,
      machineTypeImage: machineTypeImage,
      damageImage: damageImage,
      consultation: consultation,
      latitude: latitude,
      longitude: longitude,
    );

    FirebaseFirestore.instance
        .collection(city).doc(city).collection('doneRequests').doc().set(model.toJson())
        .then((value)
    {
      emit(CreateRequestSuccessState());
    }).catchError((error)
    {
      emit(CreateRequestErrorState(error.toString()));
    });
  }

  // Archived Technical Requests
  void technicalArchivedRequest(
      {
        required String city,
        required String companyName,
        required String school,
        required String technicalPhone,
        required String technicalName,
        required String customerPhone,
        required String machineImage,
        required String machineTypeImage,
        required String damageImage,
        required String consultation,
        required double latitude,
        required double longitude,
      })
  {
    emit(RequestLoadingState());

    FirebaseFirestore.instance.collection(city).doc(city).collection('archivedRequests').doc().get().then((value)
    {

      createArchivedRequest(
        city: city,
        companyName: companyName,
        school: school,
        technicalPhone: technicalPhone,
        technicalName: technicalName,
        customerPhone: customerPhone,
        machineImage: machineImage,
        uId: value.id.toString(),
        machineTypeImage: machineTypeImage.toString(),
        damageImage: damageImage.toString(),
        consultation: consultation.toString(),
        latitude: latitude,
        longitude: longitude,
        //isEmailVerified: value.user!.emailVerified.toString(),
      );
    }).catchError((error)
    {
      emit(RequestErrorState(error.toString()));
    });
  }

  // Create Archived Request Model
  void createArchivedRequest(
      {
        required String city,
        required String companyName,
        required String technicalName,
        required String school,
        required String technicalPhone,
        required String customerPhone,
        required String machineImage,
        required String uId,
        required String machineTypeImage,
        required String damageImage,
        required String consultation,
        required double latitude,
        required double longitude,
      })
  {

    RequestModel model = RequestModel(
      city: city,
      companyName: companyName,
      technicalName: technicalName,
      school: school,
      technicalPhone: technicalPhone,
      customerPhone: customerPhone,
      machineImage: machineImage,
      uId: uId,
      machineTypeImage: machineTypeImage,
      damageImage: damageImage,
      consultation: consultation,
      latitude: latitude,
      longitude: longitude,
    );

    FirebaseFirestore.instance
        .collection(city).doc(city).collection('archivedRequests').doc().set(model.toJson())
        .then((value)
    {
      emit(CreateRequestSuccessState());
    }).catchError((error)
    {
      emit(CreateRequestErrorState(error.toString()));
    });
  }


  IconData locationIcon = Icons.add_location_alt_outlined;
  bool isLocation = false;
  void changeLocationIcon()
  {
    isLocation = !isLocation;
    locationIcon = isLocation ? Icons.add_location_alt_outlined : Icons.done_all;

    emit(ChangeLocationIconState());
  }



}