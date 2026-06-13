import SwiftUI

// MARK: - Design Tokens
struct Theme {
    // MARK: Colors
    struct Colors {
        // Background & Surface
        static let background = Color(red: 0.08, green: 0.08, blue: 0.08) // Near-black #141414
        static let surface = Color(red: 0.12, green: 0.12, blue: 0.12)    // Slightly lighter
        
        // Text
        static let ivory = Color(red: 0.95, green: 0.93, blue: 0.88)      // Warm ivory
        static let muted = Color(red: 0.70, green: 0.68, blue: 0.60)      // Muted warm gray
        
        // Accents
        static let gold = Color(red: 0.85, green: 0.76, blue: 0.55)       // Antique gold
        static let goldAccent = Color(red: 0.88, green: 0.80, blue: 0.62) // Lighter gold for contrast
        
        // Utility
        static let divider = Color(red: 0.85, green: 0.76, blue: 0.55).opacity(0.3)
        static let border = Color(red: 0.85, green: 0.76, blue: 0.55).opacity(0.5)
    }
    
    // MARK: Typography
    struct Typography {
        // Display / Hero titles
        static func displayTitle(size: CGFloat = 24) -> Font {
            // Fallback to serif system font if custom unavailable
            return .system(size: size, weight: .semibold, design: .serif)
        }
        
        // Section titles (small caps feel)
        static func sectionLabel(size: CGFloat = 12) -> Font {
            return .system(size: size, weight: .semibold, design: .default)
        }
        
        // Body text
        static func body(size: CGFloat = 14) -> Font {
            return .system(size: size, weight: .regular, design: .default)
        }
        
        // Captions
        static func caption(size: CGFloat = 11) -> Font {
            return .system(size: size, weight: .regular, design: .default)
        }
        
        // Subtitle (smaller, muted)
        static func subtitle(size: CGFloat = 12) -> Font {
            return .system(size: size, weight: .regular, design: .default)
        }
    }
    
    // MARK: Spacing
    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32
    }
    
    // MARK: Corner Radius
    struct CornerRadius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 14
        static let hero: CGFloat = 16
    }
    
    // MARK: Strokes
    struct Strokes {
        static let thin: CGFloat = 1.0
        static let medium: CGFloat = 1.5
    }
    
    // MARK: Size
    struct Size {
        static let tabBarHeight: CGFloat = 60
        static let topBarHeight: CGFloat = 44
        static let ctaButtonHeight: CGFloat = 52
        static let ritualRowHeight: CGFloat = 70
        static let progressBarHeight: CGFloat = 6
        static let iconSmall: CGFloat = 20
        static let iconMedium: CGFloat = 24
    }
}

// MARK: - Helper Extensions
extension View {
    func goldOutlineButton() -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: Theme.CornerRadius.medium)
                    .stroke(Theme.Colors.gold, lineWidth: Theme.Strokes.thin)
            )
    }
    
    func oracleCardFrame() -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: Theme.CornerRadius.hero)
                    .stroke(Theme.Colors.gold, lineWidth: Theme.Strokes.thin)
            )
    }
    
    func ritualRowFrame() -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: Theme.CornerRadius.large)
                    .stroke(Theme.Colors.border, lineWidth: Theme.Strokes.thin)
            )
    }
}
