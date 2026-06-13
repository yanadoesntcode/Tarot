import SwiftUI

struct HeroCardView: View {
    let title: String
    let subtitle: String
    let imageName: String
    
    var body: some View {
        VStack(spacing: 0) {
            // Image container with placeholder
            ZStack {
                // Placeholder with subtle geometry
                RoundedRectangle(cornerRadius: Theme.CornerRadius.hero)
                    .fill(Theme.Colors.surface)
                    .overlay(
                        RoundedRectangle(cornerRadius: Theme.CornerRadius.hero)
                            .stroke(Theme.Colors.gold, lineWidth: Theme.Strokes.thin)
                    )
                
                // Placeholder image (use actual image when available)
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .cornerRadius(Theme.CornerRadius.hero - 1)
                    .padding(Theme.Spacing.sm)
            }
            .aspectRatio(0.85, contentMode: .fit)
            .overlay(alignment: .bottom) {
                // Gold banner with title
                Text(title)
                    .font(Theme.Typography.displayTitle(size: 16))
                    .foregroundColor(Theme.Colors.background)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Theme.Colors.gold)
                    .cornerRadius(Theme.CornerRadius.small)
                    .padding(Theme.Spacing.md)
                    .offset(y: 22)
            }
            .padding(.bottom, Theme.Spacing.xl)
            
            // Keywords
            Text(subtitle)
                .font(Theme.Typography.sectionLabel(size: 11))
                .tracking(1.2)
                .foregroundColor(Theme.Colors.muted)
                .textCase(.uppercase)
        }
        .padding(Theme.Spacing.lg)
        .background(Theme.Colors.surface)
        .oracleCardFrame()
    }
}

#Preview {
    HeroCardView(
        title: "THE STAR",
        subtitle: "HOPE  GUIDANCE  RENEWAL",
        imageName: "hero"
    )
    .padding()
    .background(Theme.Colors.background)
}
