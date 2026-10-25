<div align="center">

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&color=7C3AED&height=200&section=header&text=Expense%20Tracker&fontSize=48&fontColor=ffffff&fontAlignY=38&desc=Flutter%20Personal%20Finance%20App&descAlignY=58&descSize=18&animation=fadeIn" width="100%"/>

<br/>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/Platform-iOS%20%2F%20Android-lightgrey?style=for-the-badge&logo=apple&logoColor=white"/>
  <img src="https://img.shields.io/badge/Material_3-757575?style=for-the-badge&logo=material-design&logoColor=white"/>
  <img src="https://img.shields.io/badge/Status-Complete-0D9488?style=for-the-badge"/>
</p>

<p align="center">
  <strong>Track spending · Visualize budgets · Understand your money</strong><br/>
  A clean, card-based mobile app designed for real daily use.
</p>

<br/>

</div>

---

## ✨ Overview

Expense Tracker makes the daily habit of logging expenses **fast and frictionless** — not a chore. Four screens, always one tap away. A purple-teal design system that feels premium without being distracting.

```
Bottom Nav  ──►  🏠 Home  |  📊 Reports  |  ➕ Add  |  👤 Profile
```

---

## 📱 Screens

<table>
<tr>
<td width="25%" align="center"><strong>🏠 Dashboard</strong></td>
<td width="25%" align="center"><strong>➕ Add Expense</strong></td>
<td width="25%" align="center"><strong>📊 Reports</strong></td>
<td width="25%" align="center"><strong>👤 Profile</strong></td>
</tr>
<tr>
<td>Personalized greeting, gradient budget card, category scroll row, recent transactions</td>
<td>Large amount input, category chips, date picker, one-tap save</td>
<td>Horizontal progress bars per category, 3-stat summary row</td>
<td>Avatar, monthly budget editor, settings toggles</td>
</tr>
</table>

---

## 🎨 Design System

```dart
// Color palette
const Color primary   = Color(0xFF7C3AED);  // Purple
const Color secondary = Color(0xFF0D9488);  // Teal
const Color surface   = Color(0xFFF8F7FF);  // Off-white

// Gradient hero card
gradient: LinearGradient(
  colors: [Color(0xFF7C3AED), Color(0xFF0D9488)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

| Token | Value | Usage |
|---|---|---|
| `primary` | `#7C3AED` | Nav selected, buttons, amounts |
| `secondary` | `#0D9488` | Gradient end, success states |
| `surface` | `#F8F7FF` | Screen backgrounds |
| `radius.card` | `24px` | Hero cards |
| `radius.tile` | `16px` | List tiles, chips |

---

## 🗂️ Project Structure

```
lib/
├── main.dart                    # App entry + bottom nav
├── models/
│   └── expense.dart             # Expense model + Category enum
└── screens/
    ├── dashboard_screen.dart    # Home — summary + recent list
    ├── add_expense_screen.dart  # Log a new expense
    ├── reports_screen.dart      # Category breakdown + stats
    └── profile_screen.dart      # Settings + budget editor
```

---

## 🚀 Getting Started

```bash
# Clone
git clone https://github.com/layankhayyat04-ui/expense-tracker-app.git
cd expense-tracker-app

# Install dependencies
flutter pub get

# Run on device or simulator
flutter run

# Build release APK
flutter build apk --release
```

**Requirements:** Flutter 3.x · Dart 3.x · iOS 13+ or Android 6+

---

## 🧩 Key Code Snippets

### Expense Model with Category Enum

```dart
enum Category {
  food('Food & Drink', '🍔', 0xFF00BCD4),
  transport('Transport', '🚗', 0xFF9C27B0),
  shopping('Shopping', '🛍️', 0xFFE91E63),
  bills('Bills', '📄', 0xFF3F51B5);

  const Category(this.label, this.emoji, this.color);
  final String label;
  final String emoji;
  final int color;
}
```

### Gradient Summary Card

```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF7C3AED), Color(0xFF0D9488)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(24),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF7C3AED).withOpacity(0.3),
        blurRadius: 20,
        offset: Offset(0, 8),
      ),
    ],
  ),
)
```

### Category Progress Bar (Reports)

```dart
LinearProgressIndicator(
  value: amount / budget,
  backgroundColor: Color(0xFFF3F0FF),
  valueColor: AlwaysStoppedAnimation<Color>(Color(cat.color)),
  minHeight: 10,
)
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| `fl_chart` | `^0.68.0` | Chart visualizations |
| `intl` | `^0.19.0` | Date formatting |
| `shared_preferences` | `^2.2.3` | Local persistence |
| `uuid` | `^4.4.0` | Unique expense IDs |

---

## 🗺️ What's Next

| Feature | Status |
|---|---|
| SQLite / Hive local database | 🔜 Planned |
| Recurring expense detection | 🔜 Planned |
| Monthly comparison charts | 🔜 Planned |
| Export to CSV / PDF | 🔜 Planned |
| Dark mode support | 🔜 Planned |

---

<div align="center">

<br/>

**Built by [Layan Khayyat](https://layankhayyat.com)**<br/>
B.Sc. Business Information Technology · Princess Sumaya University for Technology (PSUT)

<br/>

[![Portfolio](https://img.shields.io/badge/Portfolio-layankhayyat.com-7C3AED?style=for-the-badge&logo=vercel&logoColor=white)](https://layankhayyat.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/layankhayyat)

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0D9488&height=100&section=footer" width="100%"/>

</div>
