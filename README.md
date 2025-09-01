# DateMagicKit

**DateMagicKit** is a lightweight SwiftUI SDK that provides easy and flexible date and time formatting. It supports multiple input types, smart relative time formatting, locale-aware output, and SwiftUI-friendly components.

---

## Key Features

1. **Multiple Input Types**  
   You can format dates from:
   - `Date` objects
   - Time intervals in seconds (`TimeInterval`)  
   - Time intervals in milliseconds (`Int` or `Double`)  
   - ISO 8601 strings (e.g., `"2025-09-01T10:00:00Z"`)

2. **Smart Formatting**  
   - Automatically formats relative times like “Just now”, “5m ago”, “2h ago”, or “3d ago”.  
   - Falls back to a standard date format if the time difference is larger than a week.

3. **Locale Support**  
   - You can specify a `Locale` to display dates and times according to regional settings.

4. **Date Styles**  
   - Supports multiple date and time styles including `shortDate`, `mediumDate`, `longDate`, `fullDate`, `shortTime`, `mediumTime`, `longTime`, and `fullTime`.

5. **SwiftUI Integration**  
   - `FormattedDateText` allows you to display formatted dates in SwiftUI.  
   - `RelativeTimeText` allows you to display smart relative times in SwiftUI.  
   - Both views allow customizing font and color.

---

## How to Use

### Display a standard formatted date
FormattedDateText(input: Date())

### Display a relative/smart time
RelativeTimeText(input: Date().addingTimeInterval(-4500)) // Displays "1h ago"

### Display an ISO string as a formatted date
FormattedDateText(input: "2025-09-01T10:00:00Z", style: .longDate)

### Customizing appearance
FormattedDateText(input: Date(), color: .green, font: .title)
RelativeTimeText(input: Date(), color: .red, font: .headline)ce

### Locale-aware formatting
FormattedDateText(input: Date(), locale: Locale(identifier: "fr_FR"))

### Display a date from milliseconds
FormattedDateText(input: 1693550400000)

### Smart relative formatting examples
RelativeTimeText(input: Date().addingTimeInterval(-60))        // "1m ago"
RelativeTimeText(input: Date().addingTimeInterval(-3600))      // "1h ago"
RelativeTimeText(input: Date().addingTimeInterval(-86400))     // "1d ago"
RelativeTimeText(input: Date().addingTimeInterval(-604800))    // Falls back to standard date
