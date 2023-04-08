import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mi_pos/model.dart';
import 'package:mi_pos/services/currency.dart';
import 'package:mi_pos/services/data.dart';
import 'package:mi_pos/themes.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final input = Model();

  bool _loading = false;
  set loading(bool value) {
    setState(() => _loading = value);
  }

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    priceController.dispose();
    super.dispose();
  }

  String? validatorName(String? value) {
    value = value ?? '';
    if (value.isEmpty) return 'Nama tidak boleh kosong';
    return null;
  }

  String? validatorCode(String? value) {
    value = value ?? '';
    if (value.isEmpty) return 'Kode tidak boleh kosong';
    return null;
  }

  String? validatorPrice(String? value) {
    value = value ?? '';
    if (value.isEmpty) return 'Harga tidak boleh kosong';
    return null;
  }

  void onSavedName(String? value) {
    input.name = value;
  }

  void onSavedCode(String? value) {
    input.code = value;
  }

  void onSavedPrice(String? value) {
    input.price = (value ?? '').replaceAll('.', '');
  }

  void submit() async {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState?.save();
      loading = true;
      await DataService.create(
        input: input,
        onSuccess: () {
          Get.back(result: true);
          Get.showSnackbar(
            const GetSnackBar(
              message: 'Menu berhasil disimpan',
              duration: Duration(seconds: 3),
            ),
          );
        },
      );
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: whiteColor,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle,
              _buildForm,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildTitle {
    return Stack(
      children: [
        Padding(
          padding: inset(36),
          child: Center(
            child: Text(
              'Tambah Menu',
              style: Get.textTheme.bodyLarge?.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CloseButton(
            onPressed: Get.back,
          ),
        ),
      ],
    );
  }

  Widget get _buildForm {
    return Form(
      key: formKey,
      child: Padding(
        padding: inset(),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: validatorName,
              onSaved: onSavedName,
              style: Get.textTheme.bodyMedium,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: inputDecorationBorder.copyWith(
                labelText: 'Nama Menu',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'^\s')),
              ],
            ),
            height(24),
            TextFormField(
              controller: codeController,
              validator: validatorCode,
              onSaved: onSavedCode,
              style: Get.textTheme.bodyMedium,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: inputDecorationBorder.copyWith(
                labelText: 'Kode Menu',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'^\s')),
              ],
            ),
            height(24),
            TextFormField(
              controller: priceController,
              validator: validatorPrice,
              onSaved: onSavedPrice,
              style: Get.textTheme.bodyMedium,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: inputDecorationBorder.copyWith(
                labelText: 'Harga',
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.deny(
                  RegExp(r'^0*'),
                ),
                CurrencyFormatter(),
              ],
            ),
            height(24),
            ElevatedButton(
              onPressed: _loading ? null : submit,
              style: ElevatedButton.styleFrom(padding: inset()),
              child: Center(
                child: Visibility(
                  visible: !_loading,
                  replacement: const Text('Menyimpan...'),
                  child: const Text('Simpan'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
