import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/api/required_feed_api.dart';

part 'feed_indicator_state.dart';

class FeedIndicatorCubit extends Cubit<FeedIndicatorState> {
  FeedIndicatorCubit() : super(FeedIndicatorInitial());
  RequiredFeedApi requiredFeedApi = RequiredFeedApi();
  double feeded = 0.0;
  getRequiredFeed(String flockId) async {
    try {
      emit(FeedIndicatorLoading());
      final int response = await requiredFeedApi.getRequiredFeed(flockId);
      feeded=response.toDouble();
      emit(FeedIndicatorSuccess());
    } on DioException catch (_) {
      emit(FeedIndicatorFailed());
    }
  }
  double getPercentage(double nomFlocks) {
    double ratio = feeded / (nomFlocks * 100);
    if (ratio > 1.0) {
      return 1.0;
    }
    return ratio;
  }
}
