import 'package:vexana/vexana.dart';
import '../../core/constants/project_items.dart';
import '../../core/init/toast/toast_service.dart';

class NetworkResolver with ToastService {
  T? getResolve<T>(IResponseModel<T?, INetworkModel<dynamic>?>? response) {
    if (response == null || response.data == null) {
      if (response?.error?.description != null) {
        if (response!.error!.description! != '') {
          showToast(
              label: response.error!.description!, toastType: ToastType.error);
        } else {
          showToast(
              label: ProjectItems.noConnectionServer,
              toastType: ToastType.error);
        }
      } else {
        showToast(
            label: ProjectItems.somethingError, toastType: ToastType.error);
      }
    } else {
      if (response.data != null) return response.data;
    }

    return null;
  }
}
