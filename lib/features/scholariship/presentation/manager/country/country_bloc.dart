import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/entity/country.dart';
import '../../../../../global/utils/map_failure_message.dart';
import '../../../domain/usecases/get_countries.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;

  CountryBloc(this.getCountries) : super(Empty()) {
    on<GetCountryEvent>(_getCountries);
  }
  Future<void> _getCountries(GetCountryEvent event, Emitter emit)async{
    emit(CountryLoading());
    final response = await getCountries(NoParams());
    response?.fold((failure){
      emit(CountryErrorState(message: mapFailureToMessage(failure)));
    }, (countries){
      emit(CountryLoaded( country: countries));
    });
  }
}
