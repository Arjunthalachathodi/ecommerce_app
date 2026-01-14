import 'package:flutter/material.dart';
import 'package:ecommerce_app/application/core/theme/colors.dart';
import 'package:ecommerce_app/application/core/theme/text_styles.dart';
import 'package:ecommerce_app/application/products/cubit/product_details_cubit.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:gap/gap.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = 'edit-product';
  final ProductModel product;

  const EditProductScreen({
    super.key,
    required this.product,
  });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product.title);
    _priceController = TextEditingController(text: widget.product.price.toString());
    _descriptionController = TextEditingController(text: widget.product.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state.isUpdateSuccess) {
          AlertController.show(
            'Success',
            'Product updated successfully!',
            TypeAlert.success,
          );
          Navigator.pop(context);
        }
        state.updateFailureOption.fold(
          () => null,
          (f) => AlertController.show(
            'Error',
            f.map(
              customError: (e) => e.errorMsg,
              genericError: (e) => e.errorMsg,
              serverError: (e) => e.errorMsg,
            ),
            TypeAlert.error,
          ),
        );
      },
      child: Scaffold(
        backgroundColor: ColorResources.ecommerceBackground,
        appBar: AppBar(
          backgroundColor: ColorResources.ecommerceBackground,
          elevation: 0,
          title: Text(
            'Edit Product',
            style: context.titleLarge?.w700.deepMaroon,
          ),
          leading: BackButton(color: ColorResources.deepMaroon),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              _buildTextField(
                label: 'Title',
                controller: _titleController,
                validator: (v) => v!.isEmpty ? 'Title is required' : null,
              ),
              const Gap(16),
              _buildTextField(
                label: 'Price',
                controller: _priceController,
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Price is required' : null,
              ),
              const Gap(16),
              _buildTextField(
                label: 'Description',
                controller: _descriptionController,
                maxLines: 5,
                validator: (v) => v!.isEmpty ? 'Description is required' : null,
              ),
              const Gap(40),
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state.isUpdateLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ProductDetailsCubit>().updateProduct(
                                widget.product.id,
                                {
                                  'title': _titleController.text,
                                  'price': double.tryParse(_priceController.text) ?? 0,
                                  'description': _descriptionController.text,
                                },
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorResources.ecommercePrimary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: state.isUpdateLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Save Changes',
                            style: context.titleMedium?.w600.white,
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.labelLarge?.w600.deepMaroon,
        ),
        const Gap(8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: ColorResources.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: ColorResources.red),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}

extension on BuildContext {
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get white => Theme.of(this).textTheme.titleMedium?.copyWith(color: Colors.white);
}
