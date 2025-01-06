
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_commercial_data_usecase.dart';
import '../../domain/usecases/get_residential_data_usecase.dart';
import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {

  final GetResidentialDataUseCase getResidentialDataUseCase;
  final GetCommercialDataUseCase getCommercialDataUseCase;

  HomeScreenBloc({required this.getResidentialDataUseCase,
    required this.getCommercialDataUseCase,})
      : super(InitialState()) {
    on<HomeScreenEvent>((event, emit) async {

      if (event is GetResidentialDataEvent) {
        emit(LoadingState());
        final residentialData = getResidentialDataUseCase.call(NoParams());
        emit(GetResidentialDataState(residentialData: residentialData));

      } else if (event is GetCommercialDataEvent) {
        emit(LoadingState());
        final commercialData = getCommercialDataUseCase.call(NoParams());
        emit(GetCommercialDataState(commercialData: commercialData));
      }
    });
  }


}
