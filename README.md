<div align="center">

<a href="./showcase.html">
<img src="https://img.shields.io/badge/%E2%9C%A8%20Live%20Showcase-7C3AED?style=for-the-badge&logoColor=white" height="36"/>
</a>

</div>

<br/>

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=venom&color=0:7C3AED,30:9333EA,70:A855F7,100:C084FC&height=280&section=header&text=Expense%20Tracker&fontSize=80&fontColor=fff&fontAlignY=55&desc=Flutter%20%E2%80%A2%20Material%203%20%E2%80%A2%20fl_chart&descSize=20&descAlignY=75&descFontColor=E9D5FF&animation=twinkling&stroke=ffffff&strokeWidth=2" width="100%"/>

</div>

<br/>

<div align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Inter&weight=700&size=24&pause=1000&color=9333EA&center=true&vCenter=true&width=600&lines=Track+every+penny.+Visualize+every+pattern.;No+account.+No+sync.+Fully+offline.;4+screens%2C+real+charts%2C+zero+setup." alt="typing"/>
</div>

<br/>

<div align="center">

<img src="https://skillicons.dev/icons?i=flutter,dart&theme=dark" height="50"/>

&nbsp;&nbsp;&nbsp;

<img src="https://img.shields.io/badge/Material_3-%237C3AED?style=flat-square&logo=materialdesign&logoColor=white"/>
<img src="https://img.shields.io/badge/fl__chart-%236D28D9?style=flat-square&logo=chartdotjs&logoColor=white"/>
<img src="https://img.shields.io/badge/shared__preferences-%234F46E5?style=flat-square"/>
<img src="https://img.shields.io/badge/uuid-%230EA5E9?style=flat-square"/>

<br/><br/>

<img src="https://img.shields.io/badge/Android%20%26%20iOS-cross--platform-22C55E?style=for-the-badge&logo=flutter&logoColor=white"/>
&nbsp;
<img src="https://img.shields.io/badge/Zero%20Backend-offline%20first-7C3AED?style=for-the-badge"/>
&nbsp;
<img src="https://img.shields.io/badge/Status-Complete-A855F7?style=for-the-badge"/>

</div>

---

<br/>

<table>
<tr>
<td width="50%">

### 💡 What & Why

Most budget apps are overkill — accounts, cloud sync, paywalls. This one runs entirely on-device.

**Open it. Track it. Done.**

Four clean screens. Real-time charts. Offline persistence. Works on first launch with zero config.

</td>
<td width="50%">

### 📱 Four Screens

| Screen | Purpose |
|--------|---------|
| 🏠 Dashboard | Totals, recent entries, budget ring |
| ➕ Add Expense | Amount, category, date, description |
| 📊 Reports | Bar + pie charts, month picker |
| 👤 Profile | Theme, currency, CSV export |

</td>
</tr>
</table>

<br/>

---

## 🏗️ Architecture

```
lib/
├── main.dart                    # MaterialApp, ThemeData, IndexedStack nav
├── models/
│   └── expense.dart             # Expense model · UUID key · JSON serialization
└── screens/
    ├── dashboard_screen.dart    # Animated budget ring · category chips · recent 10
    ├── add_expense_screen.dart  # Form with live currency formatting
    ├── reports_screen.dart      # fl_chart bar + pie · month selector · delta badge
    └── profile_screen.dart      # Theme toggle · currency picker · CSV export · reset
```

<br/>

---

## 🧩 Code Highlights

<details>
<summary><b>Expense model — UUID key + JSON serialization</b></summary>

<br/>

```dart
class Expense {
  final String   id;
  final String   category;
  final double   amount;
  final DateTime date;
  final String?  description;

  Expense({
    String? id,
    required this.category,
    required this.amount,
    required this.date,
    this.description,
  }) : id = id ?? const Uuid().v4();

  factory Expense.fromJson(Map<String, dynamic> j) => Expense(
    id:          j['id'],
    category:    j['category'],
    amount:      (j['amount'] as num).toDouble(),
    date:        DateTime.parse(j['date']),
    description: j['description'],
  );
}
```

</details>

<details>
<summary><b>Reports screen — fl_chart gradient bar rods</b></summary>

<br/>

```dart
BarChart(
  BarChartData(
    barGroups: categoryTotals.entries.mapIndexed((i, entry) =>
      BarChartGroupData(x: i, barRods: [
        BarChartRodData(
          toY: entry.value,
          gradient: const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFF0EA5E9)],
            begin:  Alignment.bottomCenter,
            end:    Alignment.topCenter,
          ),
          width: 18, borderRadius: BorderRadius.circular(6),
        ),
      ]),
    ).toList(),
  ),
)
```

</details>

<details>
<summary><b>main.dart — IndexedStack keeps all 4 tabs alive</b></summary>

<br/>

```dart
Scaffold(
  body: IndexedStack(
    index: _selectedIndex,
    children: const [
      DashboardScreen(), AddExpenseScreen(),
      ReportsScreen(),   ProfileScreen(),
    ],
  ),
  bottomNavigationBar: NavigationBar(
    selectedIndex: _selectedIndex,
    onDestinationSelected: (i) => setState(() => _selectedIndex = i),
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

</details>

<br/>

---

## 🎨 Design Tokens

<div align="center">

| Token | Hex | Used For |
|:------|:----|:---------|
| `primary` | ![#7C3AED](https://placehold.co/14x14/7C3AED/7C3AED.png) `#7C3AED` | FAB · selected state · gradient start |
| `secondary` | ![#4F46E5](https://placehold.co/14x14/4F46E5/4F46E5.png) `#4F46E5` | Chart gradient end |
| `accent` | ![#0EA5E9](https://placehold.co/14x14/0EA5E9/0EA5E9.png) `#0EA5E9` | Highlights · links |
| `success` | ![#22C55E](https://placehold.co/14x14/22C55E/22C55E.png) `#22C55E` | Income · positive badge |
| `danger` | ![#EF4444](https://placehold.co/14x14/EF4444/EF4444.png) `#EF4444` | Over-budget · delete |

</div>

<br/>

---

## 🚀 Run It

```bash
git clone https://github.com/layankhayyat04-ui/expense-tracker-app.git
cd expense-tracker-app
flutter pub get
flutter run
```

> **Flutter 3.x** · No API keys · No backend · No account. Just `flutter run`.

```yaml
# pubspec.yaml
fl_chart:           ^0.68.0
shared_preferences: ^2.2.2
uuid:               ^4.3.3
intl:               ^0.19.0
```

<br/>

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:C084FC,50:9333EA,100:7C3AED&height=120&section=footer&text=Built%20by%20Layan%20Khayyat&fontSize=22&fontColor=fff&fontAlignY=70&animation=twinkling" width="100%"/>

<br/>

[![Portfolio](https://img.shields.io/badge/%F0%9F%8C%90%20layankhayyat.com-7C3AED?style=for-the-badge)](https://layankhayyat.com)
&nbsp;
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/layankhayyat)

</div>
