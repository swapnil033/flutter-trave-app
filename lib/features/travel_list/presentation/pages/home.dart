import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/features/travel_list/domain/entites/travel.dart';
import 'package:travel_app/features/travel_list/presentation/providers/travel_provider.dart';
import 'package:travel_app/features/travel_list/presentation/widgets/tool_bar.dart';

import '../../../../config/routes/routes.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: 'Travel App'),
      body: _buildBody(),
      floatingActionButton: _buildFab(),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: _onAddClick,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildBody() {
    var list = ref.watch(travelProvider);

    if (list.isEmpty) {
      return const Center(
        child: Text('Add new travel'),
      );
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return _buildListItem(list[index]);
      },
    );
  }

  Widget _buildListItem(TravelEntity entity) {
    return InkWell(
      onTap: () => _onCardClick(entity),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        child: ListTile(
          leading: const Icon(Icons.place_outlined),
          trailing: RatingBar.builder(
            tapOnlyMode: true,
            initialRating: entity.rating.toDouble(),
            itemSize: 20,
            itemBuilder: (context, index) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
              );
            },
            onRatingUpdate: (rating) {},
          ),
          title: Text(entity.placeName),
          subtitle: Text(
            entity.review,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }

  void _onAddClick() {
    Navigator.pushNamed(context, Screens.addTravel);
  }

  void _onCardClick(TravelEntity entity) {
    Navigator.pushNamed(context, Screens.addTravel, arguments: entity);
  }
}
