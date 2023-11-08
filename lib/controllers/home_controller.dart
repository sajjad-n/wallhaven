import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/models.dart';
import '../helper/utils/utils.dart';
import '../services/services.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();

  final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final errorMessage = Rxn<String>();
  final wallpapers = <Wallpaper>[].obs;

  int _currentPage = 1;
  bool _lastPage = false;

  @override
  Future<void> onInit() async {
    super.onInit();

    _initPaginationListener();

    await fetchData();
  }

  void _initPaginationListener() {
    scrollController.addListener(() async {
      final nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
      final currentPosition = scrollController.position.pixels;
      final isConnected = await isConnectionAvailable();

      if (currentPosition > nextPageTrigger &&
          !isLoadingMore.value &&
          !_lastPage &&
          isConnected) {
        isLoadingMore.value = true;

        _currentPage++;

        try {
          await _fetchWallpapers();
        } catch (e) {
          if (e is TimeoutException) {
            showSnackBar(e.message);
          } else if (e is SocketException) {
            showSnackBar(e.message);
          } else {
            showSnackBar(e.toString());
          }
        }

        isLoadingMore.value = false;
      }
    });
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    errorMessage.value = null;
    wallpapers.clear();

    try {
      await _fetchWallpapers();
    } catch (e) {
      if (e is TimeoutException) {
        errorMessage.value = e.message;
      } else if (e is SocketException) {
        errorMessage.value = e.message;
      } else {
        errorMessage.value = e.toString();
      }
    }

    isLoading.value = false;
  }

  Future<void> _fetchWallpapers() async {
    final response = await SearchService().search(
      page: _currentPage.toString(),
    );

    if (response.schema?.error == null) {
      response.wallpapers?.forEach((v) => wallpapers.add(v));

      _lastPage = response.schema?.meta?.lastPage == _currentPage;
    } else {
      throw Exception(response.schema?.error);
    }
  }
}
