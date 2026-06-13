import SwiftUI

struct ProgressBarView: View {
    let label: String
    let progress: Double // 0.0 to 1.0
    let currentValue: Int
    let maxValue: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.sm) {
            HStack {
                Text(label)
                    .font(Theme.Typography.sectionLabel(size: 12))
                    .tracking(1.0)
                    .foregroundColor(Theme.Colors.ivory)
                    .textCase(.uppercase)
                
                Spacer()
                
                Text("\(currentValue) / \(maxValue)")
                    .font(Theme.Typography.sectionLabel(size: 12))
                    .foregroundColor(Theme.Colors.muted)
            }
            
            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Track
                    RoundedRectangle(cornerRadius: Theme.Size.progressBarHeight / 2)
                        .fill(Theme.Colors.surface)
                    
                    // Fill
                    RoundedRectangle(cornerRadius: Theme.Size.progressBarHeight / 2)
                        .fill(Theme.Colors.gold)
                        .frame(width: geometry.size.width * progress)
                }
            }
            .frame(height: Theme.Size.progressBarHeight)
        }
    }
}

#Preview {
    ProgressBarView(
        label: "MAJOR ARCANA MASTERY",
        progress: 14/22,
        currentValue: 14,
        maxValue: 22
    )
    .padding()
    .background(Theme.Colors.background)
}
