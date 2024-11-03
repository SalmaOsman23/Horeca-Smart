import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/components/empty_favorite_widget.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getFavoriteItems();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return homeCubit.favoriteItems.isEmpty
            ? const EmptyFavoriteWidget()
            : Column(
                children: [
                  Text("Favorite"),
                ],
              );
      },
    );
  }
}
