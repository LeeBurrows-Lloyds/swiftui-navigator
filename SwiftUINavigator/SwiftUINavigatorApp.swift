//
//  SwiftUINavigatorApp.swift
//  SwiftUINavigator
//
//  Created by Burrows, Lee (Everyday B INV - Internals Lloyds, Consumer Relationships Platform) on 16/08/2023.
//
import Auth
import SwiftUI
import FirstJourney
import NavigationManager

@main
struct SwiftUINavigatorApp: App {
    let navigationManager: NavigationManager

    init() {
        let navigationManager = NavigationManager()
        
        _ = FirstJourney(navigation: navigationManager)
        _ = Auth(navigation: navigationManager)

        self.navigationManager = navigationManager
    }

    var body: some Scene {
        WindowGroup {
            AnyView(navigationManager.navigateTo(screenIdentifier: "First_\(FirstJourneyScreenIdentifiers.welcome)", params: nil))
        }
    }
}
