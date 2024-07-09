// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:capp/src/presentation/screens/explore/civic_education/civic_education_screen.dart';
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/fgn_support_scheme_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/join_a_party_screen.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/know_your_leader_screen.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/know_your_mda_screen.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/policy_library_screen.dart';
import 'package:flutter/material.dart';

class ExploreCategoryModel {
  final String title, iconPath;
  final Color color;
  final Widget widgetPath;

  ExploreCategoryModel(
      {required this.widgetPath,
      required this.title,
      required this.iconPath,
      required this.color});

  @override
  String toString() => 'ExploreCategoryModel(path: $widgetPath, color: $color)';
}

final List<ExploreCategoryModel> exploreCategorylist = [
  ExploreCategoryModel(
      title: 'Civic Education',
      widgetPath: const CivicEducationScreen(),
      iconPath: 'assets/images/ic_civic_education.png',
      color: const Color(0xFFE4F9E0)),
  ExploreCategoryModel(
      title: 'Policy Library',
      widgetPath: const PolicyLibraryScreen(),
      iconPath: 'assets/images/ic_policyLibrary.png',
      color: const Color(0xFFE6F0FD)),
  ExploreCategoryModel(
      title: 'Join a Political Party',
      widgetPath: const JoinPartyScreen(),
      iconPath: 'assets/images/ic_join_a_party.png',
      color: const Color(0xFFFFE5E5)),
  ExploreCategoryModel(
      title: 'Know your MDA’s',
      widgetPath: const KnowYourMDA(),
      iconPath: 'assets/images/ic_know_your_mda.png',
      color: const Color(0xFFFFF8E0)),
  ExploreCategoryModel(
      title: 'Know your Leaders',
      widgetPath: const KnowYourLeader(),
      iconPath: 'assets/images/ic_know_your_leaders.png',
      color: const Color(0xFFEFEEFF)),
  ExploreCategoryModel(
      title: 'FGN Support Scheme',
      widgetPath: const FGNSupportScheme(),
      iconPath: 'assets/images/ic_fgn_scheme.png',
      color: const Color(0xFFF7E6FD)),
];
