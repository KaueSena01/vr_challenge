import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/widgets/courses_list.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/pages/widgets/searchWithoutResult.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/pages/course/stores/course_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_subtitle.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_text_field.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/constants/theme/app_colors.dart';
import 'package:vr_challenge/core/constants/theme/app_sizes.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  final CourseStore _courseStore = Modular.get<CourseStore>();

  @override
  void initState() {
    super.initState();
    _courseStore.getAllCourses();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _courseStore.searchCourses(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              label: "Novo curso",
              onTap: () => Modular.to.pushNamed('/enrollment/course/'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        title("VR Cursos"),
                        subtitle(
                          "Lista de todos os cursos disponíveis na plataforma",
                        ),
                        CustomTextField(
                          margin: EdgeInsets.only(
                            top: AppSizes.size35,
                            bottom: AppSizes.size45,
                          ),
                          hintText: "Pesquisar por...",
                          inputTextColor: AppColors.courseLabelColor,
                          prefixIcon: Icon(Icons.search, size: AppSizes.size25),
                          fillColor: AppColors.cardColor,
                          controller: _searchController,
                        ),
                        Observer(
                          builder: (context) {
                            if (_courseStore.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return _courseStore.filteredCourses.isEmpty
                                  ? const SearchWithoutResult()
                                  : CoursesList(
                                      label: "Abrir",
                                      courseEntity:
                                          _courseStore.filteredCourses,
                                    );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
