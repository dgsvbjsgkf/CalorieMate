# Project Documentation

## 1. Application Overview
CalorieMate is a beginner-friendly calorie tracking app built with Flutter. The app allows users to log meals, track calories, and review daily totals in a simple and clean interface.

## 2. Problem Solved
People often want to stay healthier but do not want to use complicated nutrition apps. CalorieMate offers an approachable solution by making meal logging quick and easy.

## 3. Target Users
- Students
- Busy adults
- Beginners working on healthy habits
- Anyone looking for a simple calorie tracker

## 4. Features Implemented
- Add meal entry with name and calories
- See total calories for the current day
- View recent meal list
- Delete saved entries
- Persist data locally using SharedPreferences
- Navigation between screens with BottomNavigationBar

## 5. Design and UI
The interface uses a clean Material Design layout with soft colors, readable text, and large tap targets. This makes the app easy to use for new programmers and first-time users.

## 6. Architecture
The app follows a simple structure:
- Models: meal data object
- Services: SharedPreferences storage logic
- Providers: state management with ChangeNotifier
- Screens: home, add food, summary

## 7. State Management
Provider is used to manage app state in a clean and beginner-friendly way. It keeps the app organized and makes it easier to update the meal list after adding or deleting items.

## 8. Persistence
The app stores data locally on the device with SharedPreferences. This ensures entries remain available after the app is closed and reopened.

## 9. Future Improvements
- Weekly calorie trends
- Goal setting for calorie targets
- Search by meal name
- Dark mode
- Food categories and macros

## 10. Conclusion
CalorieMate successfully demonstrates a simple, complete Flutter application that includes navigation, state management, persistence, and a clean user interface. It is an approachable project that is easy to understand and extend.
