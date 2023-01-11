import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child:
            const Center(child: Text('Got no places yet, start adding some!')),
        builder: (ctx, greatPlaces, child) => greatPlaces.items.isEmpty
            ? child!
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: ((ctx, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            FileImage(greatPlaces.items[index].image),
                      ),
                      title: Text(greatPlaces.items[index].title),
                      onTap: () {},
                    )),
              ),
      ),
    );
  }
}
