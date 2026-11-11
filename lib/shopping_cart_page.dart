import 'package:flutter/material.dart';

const Color kBlue = Color(0xFF1F5EFF);
const Color kLightBlue = Color(0xFFDCE9FF);
const Color kBg = Color(0xFFF3F4F6);
const Color kDark = Color(0xFF111827);

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: kDark),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, size: 28),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntro(),
              const SizedBox(height: 16),
              _buildDeliveryCard(),
              const SizedBox(height: 20),
              _buildOrderHeader(),
              const SizedBox(height: 12),
              const CartItemCard(
                name: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse_outlined,
              ),
              const SizedBox(height: 12),
              const CartItemCard(
                name: 'USB-C Hub',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.usb,
              ),
              const SizedBox(height: 12),
              const CartItemCard(
                name: 'Laptop Stand',
                price: 'PHP 700.00',
                quantity: 1,
                icon: Icons.laptop_mac,
              ),
              const SizedBox(height: 16),
              _buildDiscountBanner(),
              const SizedBox(height: 16),
              _buildPaymentSummary(),
              const SizedBox(height: 16),
              _buildPlaceOrderButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: kLightBlue,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: kBlue,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ready for checkout',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: kDark,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Review your items before placing your order.',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
      ],
    );
  }

  Widget _buildDeliveryCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: kBlue, size: 28),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to Ric Romil B. Tomas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 2),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            child: const Text(
              'Change',
              style: TextStyle(color: kBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order Items',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('3 items', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildDiscountBanner() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(Icons.sell_outlined, color: kBlue),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '10% discount on items',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          Icon(Icons.check_circle, color: kBlue, size: 28),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          _SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          SizedBox(height: 6),
          _SummaryRow(label: 'Discount (10%)', amount: '- PHP 200.00'),
          SizedBox(height: 6),
          _SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          SizedBox(height: 10),
          Divider(height: 1, thickness: 1),
          SizedBox(height: 10),
          _SummaryRow(
            label: 'Total',
            amount: 'PHP 1,850.00',
            bold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => debugPrint('Place order clicked! Total: PHP 1850.00'),
        icon: const Icon(Icons.lock),
        label: const Text(
          'Place Order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool bold;

  const _SummaryRow({
    required this.label,
    required this.amount,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: bold ? 16 : 13,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(amount, style: style),
      ],
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 40, color: kBlue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: const TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _qtyButton(
                      Icons.remove,
                      () => debugPrint('Decrease quantity: $name'),
                    ),
                    Container(
                      width: 36,
                      height: 30,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    _qtyButton(
                      Icons.add,
                      () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return SizedBox(
      width: 34,
      height: 30,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(minWidth: 34, minHeight: 30),
        style: IconButton.styleFrom(
          side: const BorderSide(color: kBlue, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: Icon(icon, size: 18, color: kBlue),
        onPressed: onTap,
      ),
    );
  }
}