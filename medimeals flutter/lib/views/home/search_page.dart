import 'package:flutter/material.dart';

import '../../core/components/app_back_button.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/routes/app_routes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _SearchPageHeader(),
            SizedBox(height: 8),
            Expanded(
              child: _RecentSearchList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentSearchList extends StatelessWidget {
  const _RecentSearchList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recent Search',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            itemBuilder: (context, index) {
              List<String> foodNames = ['kichdi', 'tea', 'daal', 'vegetables', 'fruit salad'];
              String foodName = foodNames[index % foodNames.length];
              return SearchHistoryTile(
                searchName: foodName,
              );
            },
            separatorBuilder: (context, index) => const Divider(
              thickness: 0.1,
            ),
            itemCount: 5, // Change this to the number of search history items you want to display
          ),
        )
      ],
    );
  }
}

class SearchHistoryTile extends StatelessWidget {
  const SearchHistoryTile({
    super.key,
    required this.searchName,
  });

  final String searchName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Row(
          children: [
            Text(
              searchName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

class _SearchPageHeader extends StatelessWidget {
  const _SearchPageHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Row(
        children: [
          const AppBackButton(),
          const SizedBox(width: 16),
          Expanded(
            child: Stack(
              children: [
                Form(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(AppDefaults.padding),
                        child: Icon(
                          Icons.search,
                          color: AppColors.primary,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(),
                      contentPadding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                    textInputAction: TextInputAction.search,
                    autofocus: true,
                    onChanged: (String? value) {},
                    onFieldSubmitted: (v) {
                      Navigator.pushNamed(context, AppRoutes.searchResult);
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  height: 56,
                  child: SizedBox(
                    width: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle filter button press
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(Icons.filter_list),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
