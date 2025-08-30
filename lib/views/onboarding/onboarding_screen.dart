import 'package:flutter/material.dart';
import 'package:flyweis_assignment/models/onboarding.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Welcome to Flyweis Lottery',
      subtitle: 'Your ultimate destination for lottery games and lucky numbers',
      description:
          'Discover a world of possibilities with our trusted lottery vendors and exciting games.',
      icon: Icons.casino,
      color: AppTheme.primaryColor,
    ),
    OnboardingPage(
      title: 'Find Your Lucky Vendor',
      subtitle: 'Browse through verified lottery vendors in your area',
      description:
          'Choose from a curated list of trusted vendors with the best odds and biggest prizes.',
      icon: Icons.store,
      color: AppTheme.secondaryColor,
    ),
    OnboardingPage(
      title: 'Pick Your Numbers',
      subtitle: 'Select from numbers 00-99 in snooker-style balls',
      description:
          'Choose your lucky numbers with our intuitive interface and track your tickets easily.',
      icon: Icons.sports_soccer,
      color: AppTheme.accentColor,
    ),
    OnboardingPage(
      title: 'Win Big!',
      subtitle: 'Join thousands of winners in our lottery community',
      description: 'Start your journey to fortune today with Flyweis Lottery.',
      icon: Icons.emoji_events,
      color: AppTheme.primaryVariant,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _getStarted();
    }
  }

  void _getStarted() {
    AppRouter.navigateToAndClear(context, AppRouter.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: _getStarted,
                  child: Text(
                    'Skip',
                    style: AppTheme.body1.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ),
              ),
            ),

            // Page Content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),

            // Page Indicators
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _buildPageIndicator(index),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  // Previous Button
                  if (_currentPage > 0)
                    Expanded(
                      child: AppButton(
                        text: 'Previous',
                        type: AppButtonType.outline,
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),

                  if (_currentPage > 0) const SizedBox(width: 16),

                  // Next/Get Started Button
                  Expanded(
                    flex: _currentPage > 0 ? 1 : 1,
                    child: AppButton(
                      text: _currentPage == _pages.length - 1
                          ? 'Get Started'
                          : 'Next',
                      onPressed: _nextPage,
                      icon: _currentPage == _pages.length - 1
                          ? Icons.arrow_forward
                          : null,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: page.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(page.icon, size: 60, color: page.color),
          ),

          const SizedBox(height: 40),

          // Title
          Text(
            page.title,
            style: AppTheme.headline2.copyWith(color: AppTheme.textPrimary),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Subtitle
          Text(
            page.subtitle,
            style: AppTheme.headline4.copyWith(color: page.color),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Description
          Text(
            page.description,
            style: AppTheme.body1.copyWith(color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: _currentPage == index ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? _pages[index].color
            : AppTheme.borderColor,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
