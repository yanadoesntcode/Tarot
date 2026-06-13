import SwiftUI

enum TabItem: Int {
    case home = 0
    case library = 1
    case read = 2
    case journal = 3
    case settings = 4
    
    var label: String {
        switch self {
        case .home: return "Home"
        case .library: return "Library"
        case .read: return "Read"
        case .journal: return "Journal"
        case .settings: return "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .home: return "house.fill"
        case .library: return "book.fill"
        case .read: return "sparkles"
        case .journal: return "square.and.pencil"
        case .settings: return "gear"
        }
    }
}

struct TabBarView: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach([TabItem.home, .library, .read, .journal, .settings], id: \.rawValue) { tab in
                VStack(spacing: 4) {
                    Image(systemName: tab.iconName)
                        .font(.system(size: 24, weight: .regular))
                    
                    Text(tab.label)
                        .font(Theme.Typography.caption(size: 10))
                }
                .frame(maxWidth: .infinity)
                .frame(height: Theme.Size.tabBarHeight)
                .foregroundColor(
                    selectedTab == tab ? Theme.Colors.gold : Theme.Colors.muted
                )
                .onTapGesture {
                    selectedTab = tab
                }
            }
        }
        .background(Theme.Colors.surface)
        .overlay(alignment: .top) {
            Divider()
                .background(Theme.Colors.divider)
        }
    }
}

#Preview {
    @State var selectedTab: TabItem = .home
    return TabBarView(selectedTab: $selectedTab)
        .background(Theme.Colors.background)
}
