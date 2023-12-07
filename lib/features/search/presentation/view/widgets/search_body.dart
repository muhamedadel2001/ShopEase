import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/features/favourites/presentation/view/widgets/favourites_item_screen.dart';
import 'package:shop_aoo/features/search/manager/search_cubit.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: SearchCubit.get(context).searchKey,
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The Search must Not be empty!';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String text) {
                    if (kDebugMode) {
                      print(text);
                    }
                    SearchCubit.get(context).getSearch(text: text);
                  },
                  controller: SearchCubit.get(context).searchController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      ),
                      labelText: 'Search',
                      enabledBorder: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state is SearchLoading) const LinearProgressIndicator(),
                const SizedBox(
                  height: 10,
                ),
                if (state is SearchSuccess)
                  Expanded(
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              return FavouritesItemScreen(
                                  model: SearchCubit.get(context)
                                      .searchModel
                                      .data!
                                      .data![index]);
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 2,
                              );
                            },
                            itemCount: SearchCubit.get(context)
                                .searchModel
                                .data!
                                .data!
                                .length);
                      },
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
