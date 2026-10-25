<div align="center">

<img src="https://capsule-render.vercel.app/api?type=cylinder&color=0:7C3AED,50:4F46E5,100:0EA5E9&height=180&section=header&text=Expense%20Tracker&fontSize=52&fontColor=ffffff&fontAlignY=45&animation=blinking" width="100%"/>

<br/>

<a href="#">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=22&pause=1000&color=7C3AED&center=true&vCenter=true&width=600&lines=Flutter+%C2%B7+Material+3+%C2%B7+fl_chart;Track.+Visualize.+Understand.;4+screens+%C2%B7+Real-time+charts+%C2%B7+No+backend" alt="Typing SVG"/>
</a>

<br/><br/>

<p>
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/Material_3-757575?style=for-the-badge&logo=materialdesign&logoColor=white"/>
  <img src="https://img.shields.io/badge/fl__chart-7C3AED?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/shared__preferences-0EA5E9?style=for-the-badge"/>
</p>

<p>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-7C3AED?style=flat-square"/>
  &nbsp;
  <img src="https://img.shields.io/badge/Status-Complete-22C55E?style=flat-square"/>
  &nbsp;
  <img src="https://img.shields.io/badge/License-MIT-0EA5E9?style=flat-square"/>
</p>

</div>

---

<div align="center">

## `< The Idea />`

</div>

> Most expense apps bury you in menus. This one opens on your dashboard — every number you care about, no navigation required. Built entirely offline, data lives on-device, and the UI adapts to your system theme automatically.

<br/>

---

## 📱 Screens at a Glance

<div align="center">

| 🏠 Dashboard | ➕ Add Expense | 📊 Reports | 👤 Profile |
|:---:|:---:|:---:|:---:|
| Monthly total, recent list, quick-add FAB | Category picker, amount field, date selector | Bar + pie charts by category and trend | Currency, theme toggle, data reset |

</div>

---

## ⚡ Feature Breakdown

<details>
<summary><strong>🏠 Dashboard Screen</strong></summary>

<br/>

- **Monthly budget ring** — animated circular progress, updates on every add
- **Category summary cards** — color-coded chips for Food, Transport, Entertainment, Health, Shopping, Other
- **Recent transactions list** — last 10 entries with category icon, amount, and date
- **Empty state** — illustrated prompt on first launch

</details>

<details>
<summary><strong>📊 Reports Screen</strong></summary>

<br/>

- **Bar chart** — spending per category for the selected month (`fl_chart` BarChart)
- **Pie chart** — proportional breakdown with tap-to-highlight segments
- **Month selector** — swipe between months; charts animate on transition
- **Total vs. previous month** — percentage change badge (green/red)

</details>

<details>
<summary><strong>➕ Add Expense Screen</strong></summary>

<br/>

- Amount field with live currency formatting
- Category grid with icon + label — tap to select
- Date picker defaulting to today
- Description field (optional)
- Persists via `shared_preferences` — survives app restart

</details>

<details>
<summary><strong>👤 Profile Screen</strong></summary>

<br/>

- Display name and avatar initial
- Currency selector (20+ currencies)
- System/Light/Dark theme toggle
- Export data as CSV (one tap)
- Danger zone: clear all data with confirmation dialog

</details>

---

## 🏗️ Architecture

```
lib/
├── main.dart                   # App entry, ThemeData, MaterialApp
├── models/
│   └── expense.dart            # Expense data class + JSON serialization
└── screens/
    ├── dashboard_screen.dart   # Home tab — totals, recent list, FAB
    ├── add_expense_screen.dart # Form — amount, category, date, note
    ├── reports_screen.dart     # fl_chart bar + pie, month picker
    └── profile_screen.dart     # Settings, theme, currency, reset
```

---

## 🧩 Key Code

### Expense Model with UUID + JSON

```dart
import 'package:uuid/uuid.dart';

class Expense {
  final String id;
  final String category;
  final double amount;
  final DateTime date;
  final String? description;

  Expense({
    String? id,
    required this.category,
    required this.amount,
    required this.date,
    this.description,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'amount': amount,
    'date': date.toIso8601String(),
    'description': description,
  };

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    id: json['id'],
    category: json['category'],
    amount: (json['amount'] as num).toDouble(),
    date: DateTime.parse(json['date']),
    description: json['description'],
  );
}
```

### fl_chart Bar Chart — Category Spending

```dart
BarChart(
  BarChartData(
    barGroups: categoryTotals.entries.mapIndexed((i, entry) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            gradient: LinearGradient(
              colors: [Color(0xFF7C3AED), Color(0xFF0EA5E9)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            width: 18,
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      );
    }).toList(),
    titlesData: FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, _) =>
            Text(categoryLabels[value.toInt()], style: TextStyle(fontSize: 10)),
        ),
      ),
    ),
  ),
)
```

### IndexedStack Bottom Navigation

```dart
Scaffold(
  body: IndexedStack(
    index: _currentIndex,
    children: const [
      DashboardScreen(),
      AddExpenseScreen(),
      ReportsScreen(),
      ProfileScreen(),
    ],
  ),
  bottomNavigationBar: NavigationBar(
    selectedIndex: _currentIndex,
    onDestinationSelected: (i) => setState(() => _currentIndex = i),
    destinations: const [
      NavigationDestination(icon: Icon(Icons.dashboard_outlined),
        selectedIcon: Icon(Icons.dashboard), label: 'Dashboard'),
      NavigationDestination(icon: Icon(Icons.add_circle_outline),
        selectedIcon: Icon(Icons.add_circle), label: 'Add'),
      NavigationDestination(icon: Icon(Icons.bar_chart_outlined),
        selectedIcon: Icon(Icons.bar_chart), label: 'Reports'),
      NavigationDestination(icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person), label: 'Profile'),
    ],
  ),
)
```

---

## 🎨 Design System

<div align="center">

| Token | Value | Role |
|:---|:---|:---|
| `primary` | `#7C3AED` | Violet — primary actions, FAB |
| `secondary` | `#4F46E5` | Indigo — selected state |
| `accent` | `#0EA5E9` | Sky — charts, highlights |
| `surface` | `#F8FAFC / #0F172A` | Card background (light / dark) |
| `success` | `#22C55E` | Income, positive delta |
| `danger` | `#EF4444` | Over-budget, delete |

</div>

---

## 🚀 Run It

```bash
git clone https://github.com/layankhayyat04-ui/expense-tracker-app.git
cd expense-tracker-app
flutter pub get
flutter run
```

Requires Flutter 3.x. No API keys, no backend, no setup beyond `flutter run`.

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  fl_chart: ^0.68.0      # Charts
  shared_preferences: ^2.2.2  # Local persistence
  uuid: ^4.3.3           # Unique IDs
  intl: ^0.19.0          # Date & currency formatting
```

---

<div align="center">

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0EA5E9,100:7C3AED&height=120&section=footer&text=Built%20by%20Layan%20Khayyat&fontSize=20&fontColor=ffffff&fontAlignY=65&animation=twinkling" width="100%"/>

<br/>

[![Portfolio](https://img.shields.io/badge/Portfolio-layankhayyat.com-7C3AED?style=for-the-badge&logo=vercel&logoColor=white)](https://layankhayyat.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/layankhayyat)

</div>
