import SwiftUI

struct OracleHomeView: View {
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        ZStack {
            // Background
            Theme.Colors.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Bar
                HStack(spacing: 0) {
                    Image(systemName: "bolt.fill")
                        .font(.system(size: Theme.Size.iconMedium, weight: .regular))
                        .foregroundColor(Theme.Colors.gold)
                    
                    Spacer()
                    
                    Text("THE ORACLE")
                        .font(Theme.Typography.displayTitle(size: 18))
                        .tracking(1.5)
                        .foregroundColor(Theme.Colors.ivory)
                        .textCase(.uppercase)
                    
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: Theme.Size.iconMedium, weight: .regular))
                        .foregroundColor(Theme.Colors.gold)
                }
                .frame(height: Theme.Size.topBarHeight)
                .padding(.horizontal, Theme.Spacing.lg)
                .padding(.top, Theme.Spacing.md)
                
                // Scrollable Content
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: Theme.Spacing.lg) {
                        // Daily Energy Header
                        HStack {
                            Text("DAILY ENERGY")
                                .font(Theme.Typography.sectionLabel(size: 11))
                                .tracking(1.2)
                                .foregroundColor(Theme.Colors.gold)
                            
                            Spacer()
                            
                            Text("OCT 24 · MOON VOID")
                                .font(Theme.Typography.sectionLabel(size: 11))
                                .tracking(1.0)
                                .foregroundColor(Theme.Colors.muted)
                        }
                        .padding(.horizontal, Theme.Spacing.lg)
                        .padding(.top, Theme.Spacing.md)
                        
                        // Hero Card
                        HeroCardView(
                            title: "THE STAR",
                            subtitle: "HOPE  GUIDANCE  RENEWAL",
                            imageName: "hero"
                        )
                        .padding(.horizontal, Theme.Spacing.lg)
                        
                        // Scan Button
                        OutlinedButton(
                            label: "Scan Physical Card",
                            icon: "viewfinder"
                        ) {}
                        .padding(.horizontal, Theme.Spacing.lg)
                        
                        // Secondary CTAs
                        HStack(spacing: Theme.Spacing.md) {
                            OutlinedButton(label: "New Reading", icon: nil) {}
                            OutlinedButton(label: "Browse Library", icon: nil) {}
                        }
                        .padding(.horizontal, Theme.Spacing.lg)
                        
                        // Ornament Divider
                        HStack(spacing: Theme.Spacing.md) {
                            VStack {
                                Divider()
                                    .background(Theme.Colors.divider)
                            }
                            
                            Image(systemName: "star.fill")
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(Theme.Colors.gold)
                            
                            VStack {
                                Divider()
                                    .background(Theme.Colors.divider)
                            }
                        }
                        .padding(.horizontal, Theme.Spacing.lg)
                        .padding(.vertical, Theme.Spacing.md)
                        
                        // Past Rituals Section
                        VStack(alignment: .leading, spacing: Theme.Spacing.md) {
                            Text("PAST RITUALS")
                                .font(Theme.Typography.sectionLabel(size: 11))
                                .tracking(1.2)
                                .foregroundColor(Theme.Colors.ivory)
                                .textCase(.uppercase)
                                .padding(.horizontal, Theme.Spacing.lg)
                            
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
                                
                                RitualRow(
                                    title: "NIGHTLY JOURNAL",
                                    subtitle: "REFLECTIONS ON RENEWAL",
                                    iconName: "book.fill"
                                ) {}
                            }
                            .padding(.horizontal, Theme.Spacing.lg)
                        }
                        
                        // Mastery Progress
                        ProgressBarView(
                            label: "MAJOR ARCANA MASTERY",
                            progress: 14.0 / 22.0,
                            currentValue: 14,
                            maxValue: 22
                        )
                        .padding(.horizontal, Theme.Spacing.lg)
                        .padding(.bottom, Theme.Spacing.xl)
                    }
                }
                
                Spacer()
                
                // Bottom Tab Bar
                TabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    OracleHomeView()
}
