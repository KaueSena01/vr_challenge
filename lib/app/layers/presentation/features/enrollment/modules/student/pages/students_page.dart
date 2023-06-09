import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/course/pages/widgets/search_without_result.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/pages/widgets/student_list.dart';
import 'package:vr_challenge/app/layers/presentation/features/enrollment/modules/student/stores/student_store.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_app_bar.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_subtitle.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_text_field.dart';
import 'package:vr_challenge/app/layers/presentation/widgets/custom_title.dart';
import 'package:vr_challenge/core/theme/app_colors.dart';
import 'package:vr_challenge/core/theme/app_sizes.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final _searchController = TextEditingController();

  final StudentStore _studentStore = Modular.get<StudentStore>();

  @override
  void initState() {
    super.initState();
    _studentStore.getAllStudents();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _studentStore.searchStudents(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              label: "Novo aluno",
              onTap: () => Modular.to.pushNamed('/enrollment/student/'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppSizes.size15,
                    AppSizes.size00,
                    AppSizes.size15,
                    AppSizes.size35,
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        title("Procurar por um aluno"),
                        subtitle(
                          "Lista de todos os alunos matriculados na plataforma",
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
                            if (_studentStore.loading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return _studentStore.filteredStudents.isEmpty
                                  ? const SearchWithoutResult(
                                      message: "Nenhum aluno foi encontrado",
                                    )
                                  : StudentsList(
                                      label: "Editar",
                                      studentEntity:
                                          _studentStore.filteredStudents,
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
