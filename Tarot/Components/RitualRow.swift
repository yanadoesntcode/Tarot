import SwiftUI

struct RitualRow: View {
    let title: String
    let subtitle: String
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: Theme.Spacing.md) {
                // Left icon container
                Image(systemName: iconName)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(Theme.Colors.gold)
                    .frame(width: 40, height: 40)
                    .background(Theme.Colors.surface)
                    .overlay(
                        Circle()
                            .stroke(Theme.Colors.gold, lineWidth: Theme.Strokes.thin)
                    )
                    .cornerRadius(20)
                
                // Center text
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(Theme.Typography.sectionLabel(size: 13))
                        .tracking(0.8)
                        .foregroundColor(Theme.Colors.ivory)
                        .textCase(.uppercase)
                    
                    Text(subtitle)
                        .font(Theme.Typography.subtitle(size: 11))
                        .foregroundColor(Theme.Colors.muted)
                        .lineLimit(1)
                }
                
                Spacer()
                
                // Right chevron
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Theme.Colors.muted)
            }
            .frame(height: Theme.Size.ritualRowHeight)
            .padding(Theme.Spacing.md)
            .background(Theme.Colors.surface)
            .ritualRowFrame()
        }
    }
}

#Preview {
    VStack(spacing: Theme.Spacing.md) {
        RitualRow(
            title: "THREE CARD SPREAD",
            subtitle: "DRAWN YESTERDAY · PAST/PRESENT/FUTURE",
            iconName: "moon.stars"
        ) {}
        
        RitualRow(
            title: "THE HIGH PRIESTESS",
            subtitle: "LAST SCANNED · MAJOR ARCANA",
            iconName: "star.fill"
        ) {}
    }
    .padding()
    .background(Theme.Colors.background)
}
