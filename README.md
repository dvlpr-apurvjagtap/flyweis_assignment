# Flyweis Lottery App

A Flutter application built with clean MC (Model, Controller, Core) architecture for lottery ticket management and vendor discovery.

## 🏗️ Architecture

The app follows a clean MC architecture pattern:

```
lib/
├── core/                # Reusable utilities, constants, themes
│   ├── constants/       # App-wide constants
│   ├── theme/           # Colors, typography, styles
│   ├── utils/           # Helpers, formatters, validators
│   ├── widgets/         # Shared widgets (buttons, text fields, banners)
│   └── router/          # Navigation and route handling
├── models/              # Data models (User, Vendor, LotteryTicket)
├── controllers/         # Business logic / state management
├── views/               # UI Screens
└── main.dart            # App entry point
```

## 🚀 Features

- **Splash Screen**: Animated app introduction
- **Onboarding**: Interactive app tour with swipe pages
- **Authentication**: Login and signup screens with validation
- **Home Screen**: Vendor discovery with search and filtering
- **Vendor Details**: Lottery number grid (00-99) displayed as snooker-style balls
- **Modern UI**: Material Design 3 with custom theme and vibrant colors

## 📱 Screens

1. **Splash Screen** - App logo and loading animation
2. **Onboarding** - 4-page app introduction with navigation
3. **Login Screen** - Email/password authentication
4. **Signup Screen** - User registration with validation
5. **Home Screen** - Vendor grid/list with search and filters
6. **Vendor Detail** - Lottery numbers grid and statistics

## 🎨 UI/UX Features

- **Responsive Design**: Adapts to different screen sizes
- **Custom Theme**: Modern color palette with gradients
- **Shared Widgets**: Reusable components (buttons, text fields, banners)
- **Smooth Animations**: Page transitions and loading states
- **Search & Filter**: Vendor discovery with category filtering
- **Grid/List Toggle**: Switch between view modes

## 🎯 Lottery Features

- **100 Numbers**: Display numbers 00-99 as colorful balls
- **Snooker-Style**: Each number range has distinct colors
- **Status Tracking**: Available, sold, expired, drawn tickets
- **Statistics**: Vendor performance and popular numbers
- **Purchase Flow**: Ticket buying simulation

## 🛠️ Technical Stack

- **Flutter**: Latest stable version
- **Provider**: State management
- **Material Design 3**: Modern UI components
- **Custom Theme**: Branded color scheme and typography
- **Named Routes**: Clean navigation system
- **Form Validation**: Input validation and error handling

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  provider: ^6.1.1
```

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd flyweis_assignment
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🔐 Demo Credentials

For testing purposes, use these demo credentials:

- **Email**: `test@example.com`
- **Password**: `password123`

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/app_constants.dart      # App-wide constants
│   ├── theme/app_theme.dart             # Custom theme and colors
│   ├── utils/validators.dart            # Form validation helpers
│   ├── widgets/
│   │   ├── app_button.dart              # Reusable button component
│   │   ├── app_text_field.dart          # Custom text field
│   │   └── banner_widget.dart           # Advertisement banners
│   └── router/app_router.dart           # Navigation and routing
├── models/
│   ├── user.dart                        # User data model
│   ├── vendor.dart                      # Vendor data model

├── controllers/
│   ├── auth_controller.dart             # Authentication logic
│   ├── vendor_controller.dart           # Vendor management

├── views/
│   ├── splash/splash_screen.dart        # App splash screen
│   ├── onboarding/onboarding_screen.dart # App introduction
│   ├── auth/
│   │   ├── login_screen.dart            # User login
│   │   └── signup_screen.dart           # User registration
│   ├── home/home_screen.dart            # Main dashboard
│   ├── vendor/vendor_detail_screen.dart # Vendor details
│   └── widgets/
│       ├── vendor_card.dart             # Vendor display card
│       ├── search_bar_widget.dart       # Search functionality

└── main.dart                            # App entry point
```

## 🎨 Theme System

The app uses a comprehensive theme system with:

- **Primary Colors**: Indigo-based palette
- **Secondary Colors**: Green accents
- **Accent Colors**: Orange highlights
- **Typography**: Custom text styles and weights
- **Shadows**: Consistent elevation system
- **Gradients**: Modern gradient backgrounds

## 🔄 State Management

Uses Provider pattern for state management:

- **AuthController**: User authentication state
- **VendorController**: Vendor data and filtering


## 📱 Responsive Design

- **Grid Layout**: Adaptive vendor grid (2 columns)
- **List View**: Alternative vendor list layout
- **Search**: Real-time vendor search
- **Search**: Real-time vendor search
- **Pull-to-Refresh**: Data refresh functionality

## 🚧 Future Enhancements

- [ ] Real API integration
- [ ] Push notifications
- [ ] Offline support
- [ ] User profile management
- [ ] Payment integration
- [ ] Social features
- [ ] Analytics dashboard
- [ ] Multi-language support

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For support and questions, please open an issue in the repository.

---

**Built with ❤️ using Flutter**
# flyweis_assignment
