import Foundation
import NavigationManager

public struct FirstJourney {

    public init(navigation: NavigationManagerProtocol) {
        navigation.registerProvider(for: "First", provider: FirstJourneyNavigationProvider(navigation: navigation))
    }
}
