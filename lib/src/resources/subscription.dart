import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';

class SubscriptionResource {
  final Client _client;
  SubscriptionResource(this._client);

  Future<Subscription> get(String id) async {
    final response = await _client.get('subscription/$id');
    return Subscription.fromJson(response);
  }

  Future<DataList<Subscription>> list(
      [ListSubscriptionsRequest? request]) async {
    final map =
        await _client.get('subscriptions', queryParameters: request?.toJson());
    return DataList<Subscription>.fromJson(
        map, (value) => Subscription.fromJson(value as Map<String, dynamic>));
  }
}
