import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mi_pos/controller.dart';
import 'package:mi_pos/models/menu.dart';
import 'package:mi_pos/services/currency.dart';
import 'package:mi_pos/services/utils.dart';
import 'package:mi_pos/themes.dart';
import 'package:mi_pos/widgets/order.dart';

class ChargePage extends StatefulWidget {
  final List<MenuModel?>? orders;
  const ChargePage({super.key, this.orders});

  @override
  State<ChargePage> createState() => _ChargePageState();
}

class _ChargePageState extends State<ChargePage> {
  String _pay = '';

  int get change {
    if (_pay.isEmpty) return 0;

    final total = MainController.find.totalCharge;
    final pay = int.parse(_pay.replaceAll('.', ''));
    return pay - total;
  }

  set pay(String value) {
    setState(() => _pay = value);
  }

  bool get enable {
    if (_pay.isEmpty) return false;

    final total = MainController.find.totalCharge;
    final pay = int.parse(_pay.replaceAll('.', ''));
    final change = pay - total;
    return !change.isNegative;
  }

  void onChanged(String value) {
    pay = value;
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
              _buildList,
              _buildSummary,
              _buildButton,
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
              'Detail Pesanan',
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

  Widget get _buildList {
    final orders = widget.orders ?? [];
    return ListView.separated(
      shrinkWrap: true,
      padding: insetHorizontal(),
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderWidget(order: order);
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: 16,
        endIndent: 16,
      ),
      itemCount: orders.length,
    );
  }

  Widget get _buildSummary {
    final total = double.parse('${MainController.find.totalCharge}');
    final totalChange = double.parse('$change');
    return Padding(
      padding: insetSymmetric(32, 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Total',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(': '),
              Expanded(
                flex: 2,
                child: Container(
                  padding: inset(8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: borderRadius(2),
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Rp. ${Utils.currency(total)}',
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          height(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Total Dibayar',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(': '),
              Expanded(
                flex: 2,
                child: Container(
                  padding: inset(8),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                    borderRadius: borderRadius(2),
                  ),
                  child: TextFormField(
                    style: Get.textTheme.bodyMedium?.copyWith(
                      color: darkColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(
                        RegExp(r'^0*'),
                      ),
                      CurrencyFormatter(),
                    ],
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: '0',
                      contentPadding: inset(0),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          height(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Kembalian',
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(': '),
              Expanded(
                flex: 2,
                child: Container(
                  padding: inset(8),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: borderRadius(2),
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Rp. ${Utils.currency(totalChange)}',
                    style: Get.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _buildButton {
    return Padding(
      padding: insetSymmetric(32, 16),
      child: ElevatedButton(
        onPressed: enable ? () {} : null,
        child: const Center(child: Text('Cetak Struk')),
      ),
    );
  }
}
