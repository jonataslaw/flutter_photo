import 'package:photo/src/entity/options.dart';
import 'package:photo/src/provider/selected_provider.dart';

abstract class I18nProvider {
  const I18nProvider._();

  String getTitleText(Options options);

  String getSureText(Options options, SelectedProvider selectedProvider);

  String getPreviewText(Options options, SelectedProvider selectedProvider);

  String getSelectedOptionsText(Options options);

  String getMaxTipText(Options options);

  String getAllGalleryText(Options options);

  I18NPermissionProvider getNotPermissionText(Options options);

  static const I18nProvider chinese = _CNProvider();

  static const I18nProvider english = _ENProvider();
}

class _CNProvider extends I18nProvider {
  const _CNProvider() : super._();

  @override
  String getTitleText(Options options) {
    return "图片选择";
  }

  @override
  String getPreviewText(Options options, SelectedProvider selectedProvider) {
    return "预览(${selectedProvider.selectedCount})";
  }

  @override
  String getSureText(Options options, SelectedProvider selectedProvider) {
    return "确定(${selectedProvider.selectedCount}/${options.maxSelected})";
  }

  @override
  String getSelectedOptionsText(Options options) {
    return "选择";
  }

  @override
  String getMaxTipText(Options options) {
    return "您已经选择了${options.maxSelected}张图片";
  }

  @override
  String getAllGalleryText(Options options) {
    return "全部图片";
  }

  @override
  I18NPermissionProvider getNotPermissionText(Options options) {
    return I18NPermissionProvider(
        cancelText: "取消", sureText: "去开启", titleText: "没有访问相册的权限");
  }
}

class _ENProvider extends I18nProvider {
  const _ENProvider() : super._();

  @override
  String getTitleText(Options options) {
    return "image picker";
  }

  @override
  String getPreviewText(Options options, SelectedProvider selectedProvider) {
    return "preview(${selectedProvider.selectedCount})";
  }

  @override
  String getSureText(Options options, SelectedProvider selectedProvider) {
    return "sure(${selectedProvider.selectedCount}/${options.maxSelected})";
  }

  @override
  String getSelectedOptionsText(Options options) {
    return "selected";
  }

  @override
  String getMaxTipText(Options options) {
    return "select ${options.maxSelected} pictures at most";
  }

  @override
  String getAllGalleryText(Options options) {
    return "all images";
  }

  @override
  I18NPermissionProvider getNotPermissionText(Options options) {
    return I18NPermissionProvider(
        cancelText: "cancel",
        sureText: "allow",
        titleText: "No permission to access gallery");
  }
}

abstract class I18NCustomProvider implements I18nProvider {
  final String maxTipText;
  final String previewText;
  final String selectedOptionsText;
  final String sureText;
  final String titleText;
  final I18NPermissionProvider notPermissionText;

  I18NCustomProvider(
      this.maxTipText,
      this.previewText,
      this.selectedOptionsText,
      this.sureText,
      this.titleText,
      this.notPermissionText);

  @override
  String getMaxTipText(Options options) {
    return maxTipText;
  }

  @override
  String getSelectedOptionsText(Options options) {
    return selectedOptionsText;
  }

  @override
  String getTitleText(Options options) {
    return titleText;
  }

  @override
  I18NPermissionProvider getNotPermissionText(Options options) {
    return notPermissionText;
  }
}

class I18NPermissionProvider {
  final String titleText;
  final String sureText;
  final String cancelText;

  const I18NPermissionProvider(
      {this.titleText, this.sureText, this.cancelText});
}