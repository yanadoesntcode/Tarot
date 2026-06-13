import SwiftUI

struct OutlinedButton: View {
    let label: String
    let icon: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: Theme.Spacing.sm) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: Theme.Size.iconSmall, weight: .regular))
                        .foregroundColor(Theme.Colors.gold)
                }
                Text(label)
                    .font(Theme.Typography.body(size: 14))
                    .foregroundColor(Theme.Colors.ivory)
                Spacer()
            }
            .frame(height: Theme.Size.ctaButtonHeight)
            .frame(maxWidth: .infinity)
            .background(Theme.Colors.surface)
            .goldOutlineButton()
        }
    }
}

#Preview {
    OutlinedButton(label: "Scan Physical Card", icon: "viewfinder") {}
        .padding()
        .background(Theme.Colors.background)
}
