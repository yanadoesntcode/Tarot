# Oracvlvm

An iOS tarot companion with an editorial, magazine-styled interface. Scan a physical tarot card, browse the major arcana, draw a spread, and inscribe readings into a personal codex.

Built in SwiftUI for iPhone.

## Features

- **Daily Arcanum.** A card-of-the-day on the home page that opens into a full editorial entry.
- **Card scanner.** Point the camera at a physical tarot card and the app uses Vision OCR to identify it. If recognition fails, a "Choose from Deck" picker lets you pick the card manually.
- **Pinch-to-zoom and preset zoom levels** on the scanner (1x / 2x / 3x), with a live zoom indicator.
- **Editorial card details.** For every card: keywords, the upright reading, the reversed reading, esoteric symbolism, and a "Harmonic Resonance" carousel of related cards.
- **Personalized lens.** Set your birthday in Settings to get an extra interpretation layer through your zodiac sign and element.
- **Library.** Searchable grid of the 22 major arcana with favorite-marking.
- **Spreads.** Single card, three-card (Past / Present / Future), and a five-card path (Mind / Body / Spirit / Path / Outcome) with intentions and a ritual reveal flow.
- **Journal / codex.** Every pull or reading can be inscribed; recent entries surface on the home page.

## Tech stack

- **SwiftUI** for all UI.
- **`@Observable`** stores for `UserProfile`, `JournalStore`, and `AppRouter`.
- **AVFoundation** for the camera preview, capture, torch, and continuous / ramped zoom.
- **Vision** (`VNRecognizeTextRequest`) for on-device card-name OCR, with a Levenshtein fallback for fuzzy matching.
- **Swift Concurrency** (`async` / `await`) for capture and recognition.

No third-party dependencies.

## Requirements

- Xcode 15 or newer
- iOS 17 or newer (uses `@Observable` and the Observation framework)
- A physical device is recommended for the scanner; the simulator can run the UI but has no real camera feed.

## Getting started

```bash
git clone <your-repo-url>
cd "tarot app"
open "tarot app.xcodeproj"
```

In Xcode:

1. Select the `tarot app` scheme.
2. Pick a target device or simulator.
3. Run.

When running on a physical device, grant camera permission the first time you open the scanner so OCR can read the card title.

## Project structure

```
tarot app/
  tarot app/
    tarot_appApp.swift        App entry point
    ContentView.swift         Hosts MainTabView
    MainTabView.swift         Tab bar (Home / Library / Read / Journal / Settings)
    HomeView.swift            Daily arcanum, scan CTA, recent rituals
    LibraryView.swift         Searchable grid of all cards
    JournalView.swift         Codex of inscriptions
    CardDetailView.swift      Editorial detail page with upright/reversed/symbolism
    TarotModels.swift         TarotCard model + TarotDataStore
    ImageHelper.swift         Resilient asset lookup
    Themes/DesignTokens.swift Shared palette, type scale, spacing
    Views/
      CardScanView.swift      Camera scanner + Vision OCR + manual picker
      ReadView.swift          Spread picker + ritual reveal flow
    Components/               Small reusable views
    Images/                   Major arcana artwork
  UserProfile.swift           UserProfile, JournalStore, AppRouter, ZodiacSign
  SettingsView.swift          Profile, reading preferences, notifications, about
```

## Design

The visual language is intentionally editorial: a near-black "ink" background, parchment text, a single antique gold accent, and Georgia / serif typography with wide tracking. Sections are introduced with Roman numerals and thin gold dividers, modeled on printed almanacs and grimoires.

## Notes and limitations

- All state is kept in memory. Closing the app resets favorites, journal entries, and the user profile. Persistence is on the roadmap.
- Only the 22 cards of the major arcana are included.
- Notifications are a UI placeholder; the scheduling layer is not wired up.

## License

Personal project. All rights reserved unless otherwise stated.

## Credits

Designed and built by Yana Spasova.
