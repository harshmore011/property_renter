
import 'package:equatable/equatable.dart';

import '../../domain/entities/commercial_properties_overview_entity.dart';

class CommercialPropertiesOverviewModel extends Equatable {

  final String message = "Coming Soon";

  toEntity() => CommercialPropertiesOverviewEntity();

  @override
  List<Object?> get props => [message];

}
