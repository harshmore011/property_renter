
import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class GetResidentialDataEvent extends HomeScreenEvent{}

class GetCommercialDataEvent extends HomeScreenEvent{}

