import 'package:finalproject/core/utilities/screens.dart' as screens;
import 'package:finalproject/core/widgets/congrats.dart';
import 'package:finalproject/core/widgets/success.dart';
import 'package:finalproject/features/custom_bottom_nav/home.dart';
import 'package:finalproject/features/custom_bottom_nav/nav_bar_cubit.dart';
import 'package:finalproject/features/flock_details/data/models/expense_model.dart';
import 'package:finalproject/features/flock_details/data/models/feed_serve_model.dart';
import 'package:finalproject/features/flock_details/data/models/income_model.dart';
import 'package:finalproject/features/flock_details/data/models/medicine_model.dart';
import 'package:finalproject/features/flock_details/data/models/mortality_model.dart';
import 'package:finalproject/features/flock_details/data/models/vaccinantion_model.dart';
import 'package:finalproject/features/flock_details/manager/add_cubit/add_cubit.dart';
import 'package:finalproject/features/flock_details/manager/feed_indicator.dart/feed_indicator_cubit.dart';
import 'package:finalproject/features/flock_details/manager/record_cubit/records_cubit.dart';
import 'package:finalproject/features/flock_details/presentation/add_screens/add_expenses_scren.dart';
import 'package:finalproject/features/flock_details/presentation/add_screens/add_feed_served.dart';
import 'package:finalproject/features/flock_details/presentation/add_screens/add_income_screen.dart';
import 'package:finalproject/features/flock_details/presentation/add_screens/add_medicine_screen.dart';
import 'package:finalproject/features/flock_details/presentation/add_screens/add_mortality.dart';
import 'package:finalproject/features/flock_details/presentation/add_screens/add_vaccine_screen.dart';
import 'package:finalproject/features/flock_details/presentation/screens/expenses_screeen.dart';
import 'package:finalproject/features/flock_details/presentation/screens/feedserved_screen.dart';
import 'package:finalproject/features/flock_details/presentation/screens/income_screen.dart';
import 'package:finalproject/features/flock_details/presentation/screens/medicine_screen.dart';
import 'package:finalproject/features/flock_details/presentation/screens/mortality_screen.dart';
import 'package:finalproject/features/flock_details/presentation/screens/vaccination_screen.dart';
import 'package:finalproject/features/home/data/analysis_api.dart';
import 'package:finalproject/features/home/data/flock_info_api.dart';
import 'package:finalproject/features/home/manager/analysys_cubit/analysis_cubit.dart';
import 'package:finalproject/features/home/manager/flock_info_upadates.dart/flock_info_cubit.dart';
import 'package:finalproject/features/home/manager/nom_dead_cubit/nom_dead_cubit.dart';
import 'package:finalproject/features/home/presentation/flock_info_screen.dart';
import 'package:finalproject/features/login/data/login_api.dart';
import 'package:finalproject/features/login/manager/cubit/cubit/login_cubit_cubit.dart';
import 'package:finalproject/features/new_flock/data/all_flocks_api.dart';
import 'package:finalproject/features/new_flock/manager/cubit_all_flocks/my_flocks_cubit.dart';
import 'package:finalproject/features/new_flock/presentation/screens/new_flock.dart';
import 'package:finalproject/features/on_boarding/presentation/main_on_boarding_screen.dart';
import 'package:finalproject/features/sign_up/data/registration_api.dart';
import 'package:finalproject/features/sign_up/manager/registration_cubit/registration_cubit.dart';
import 'package:finalproject/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/flock_details/manager/search_cubit/search_cubit.dart';
import '../../features/login/presentation/login_screen.dart';
import '../../features/new_flock/manager/tab_bar_cubit/cubit/tab_bar_cubit_cubit.dart';
import '../../features/otb/presentation/account_verfication_code.dart';
import '../../features/otb/presentation/account_verfication_method.dart';
import '../../features/otb/presentation/reset_pass_code.dart';
import '../../features/otb/presentation/reset_pass_method.dart';
import '../../features/reset_new_password/presentation/reset_new_password_screen.dart';
import '../../features/sign_up/presentation/profile_info.dart';
import '../../features/sign_up/presentation/signup_screen.dart';
class AppRouter {
  static final AppRouter router = AppRouter();
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings routeSettings) {
    final Map<String, dynamic>? args =
        routeSettings.arguments as Map<String, dynamic>?;
    startScreen = const SplashScreen();
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      /* return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddCubit(),
                  child: const AddNewFlock(),
                ));*/
      case screens.addIncome:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddCubit(),
                  child: AddIncomeScreen(flockModel: args!['flock_model']),
                ));
      case screens.addExpense:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddCubit(),
                  child: AddExpensesScreen(flockModel: args!['flock_model']),
                ));
      case screens.addFeed:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddCubit(),
                  child: AddFeedServeScreen(flockModel: args!['flock_model']),
                ));
      case screens.addMedicine:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddCubit(),
                  child: AddMedicineScreen(flockModel: args!['flock_model']),
                ));
      case screens.addVaccine:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddCubit(),
                  child: AddVaccinationScreen(flockModel: args!['flock_model']),
                ));
      case screens.addMortality:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddCubit(),
                  child: AddMortalityScreen(flockModel: args!['flock_model']),
                ));
      case screens.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => NavBarCubit(),
                  child: Home(index: args!['index']),
                ));
      case screens.newFlocks:
        return MaterialPageRoute(
            builder: (ctx) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => MyFlocksCubit(AllFlocksApi()),
                    ),
                    BlocProvider(
                      create: (context) => TabBarCubit(),
                    ),
                  ],
                  child: const NewFlock(),
                ));
      case screens.flockInfoScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => AnalysisCubit(AnalysisApi()),
                    ),
                    BlocProvider(
                      create: (context) => FlockInfoCubit(FlockInfoApi()),
                    ),
                    BlocProvider(
                      create: (context) => NomDeadCubit(FlockInfoApi()),
                    ),
                  ],
                  child: FlockInfoScreen(flockModel: args!['flock_model']),
                ));
      case screens.expensesCategory:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => RecordsCubit(ExpenseModel())),
                    BlocProvider(create: (context) => SearchCubit()),
                    //  BlocProvider(create: (context) => DeleteCubit(ExpenseModel())),
                  ],
                  child: ExpensesCategoryScreen(flock: args!['flock_model']),
                ));
      case screens.incomeCatrgory:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => RecordsCubit(IncomeModel())),
                    BlocProvider(create: (context) => SearchCubit()),
                  ],
                  child: IncomeCategoryScreen(flock: args!['flock_model']),
                ));
      case screens.feedServedCategory:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => RecordsCubit(FeedServedModel())),
                    BlocProvider(create: (context) => FeedIndicatorCubit()),
                  ],
                  child: FeedServedCategoryScreen(flock: args!['flock_model']),
                ));
      case screens.medicineCategory:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => RecordsCubit(MedicineModel())),
                    BlocProvider(create: (context) => SearchCubit()),
                  ],
                  child: MedicineCategoryScreen(flock: args!['flock_model']),
                ));
      case screens.vaccinationCategory:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => RecordsCubit(VaccinationModel())),
                    BlocProvider(create: (context) => SearchCubit()),
                  ],
                  child: VaccinationCategoryScreen(flock: args!['flock_model']),
                ));
      case screens.mortalityCategory:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => RecordsCubit(MortalityModel())),
                    BlocProvider(create: (context) => SearchCubit()),
                  ],
                  child: MortalityCategoryScreen(flock: args!['flock_model']),
                ));

      case screens.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const MainOnBoardingScreen());
      case screens.verCodeScreen:
        return MaterialPageRoute(
            builder: (_) => AccountVerficationCode(
                verficationMethod: args!['verficationMethod']));
      case screens.verPassScreen:
        return MaterialPageRoute(
            builder: (_) => ResetPasswordCode(
                verficationMethod: args!['verficationMethod']));
      case screens.verMethodScreen:
        return MaterialPageRoute(
            builder: (_) => const AccountVerficationMethod());
      case screens.passMethodScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordMethod());
      case screens.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(LoginApi()),
                  child: const LoginScreen(),
                ));
      case screens.registerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegistrationCubit(RegistraionApi()),
                  child: const SignupScreen(),
                ));
      case screens.newPassScreen:
        return MaterialPageRoute(
            builder: (_) => const ResetNewPasswordScreen());
      case screens.profileInfoScreen:
        return MaterialPageRoute(builder: (_) => const ProfileInfo());
      case screens.successScreen:
        return MaterialPageRoute(builder: (_) => const SuccessRegistration());
      case screens.congratsScreen:
        return MaterialPageRoute(builder: (_) => const CongratsScreen());
      // case '/':
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => NavBarCubit(),
      //             child: Home(),
      //           ));
    }
    return null;
  }
}
