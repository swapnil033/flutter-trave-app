import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/travel_list/domain/entites/travel.dart';
import 'package:travel_app/features/travel_list/presentation/providers/travel_provider.dart';
import 'package:travel_app/features/travel_list/presentation/util/date_picker.dart';
import 'package:travel_app/features/travel_list/presentation/widgets/tool_bar.dart';

import '../widgets/custom_text_field.dart';

class AddTravelPage extends ConsumerStatefulWidget {
  final TravelEntity? travelEntity;

  const AddTravelPage({
    super.key,
    this.travelEntity,
  });

  @override
  ConsumerState<AddTravelPage> createState() => _AddTravelPageState();
}

class _AddTravelPageState extends ConsumerState<AddTravelPage> {
  TextEditingController _placeName = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _review = TextEditingController();
  double _rating = 1.0;

  bool _isUpdate = false;

  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (widget.travelEntity != null) {
      _isUpdate = true;
      _placeName.text = widget.travelEntity?.placeName ?? '';
      _review.text = widget.travelEntity?.review ?? '';
      _date.text = widget.travelEntity?.date ?? '';
      _rating = widget.travelEntity!.rating.toDouble();
    }

    return Scaffold(
      appBar: ToolBar(title: 'Add new travel'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildForm(),
            Expanded(child: SizedBox()),
            ElevatedButton(
                onPressed: _onAddClick,
                child: Text(_isUpdate ? 'Update' : 'Create')),
          ],
        ),
      ),
    );
  }

  void _onAddClick() {
    if (!key.currentState!.validate()) return;

    var travelData = TravelEntity(
      id: _isUpdate ? widget.travelEntity!.id : null,
      placeName: _placeName.text,
      date: _date.text,
      review: _review.text,
      rating: _rating.toInt(),
    );

    ref.read(travelProvider.notifier).addTravel(travelData);
    Navigator.pop(context);
  }

  Widget _buildForm() {
    return Column(
      children: [
        CustomTextField(
          hint: 'Place Name',
          controller: _placeName,
        ),
        SizedBox(height: 15),
        CustomTextField(
          hint: 'review',
          controller: _review,
        ),
        SizedBox(height: 15),
        CustomTextField(
          hint: 'Date',
          enable: false,
          controller: _date,
          onTap: _showDatePicker,
        ),
        SizedBox(height: 15),
        RatingBar.builder(
          initialRating: _rating,
          itemBuilder: (context, index) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
          onRatingUpdate: (rating) {
            _rating = rating;
            print(rating);
          },
        )
      ],
    );
  }

  _showDatePicker() {
    DataPicker(context: context).showCustomDatePicker((p0) {
      _date.text = p0;
    });
  }
}
