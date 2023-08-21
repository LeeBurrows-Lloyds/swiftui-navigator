import NavigationManager
import SwiftUI
import Foundation

public enum FirstJourneyScreenIdentifiers: String {
    case welcome
    case contacts
}

final class FirstJourneyNavigationProvider: NavigationProviderProtocol {

    fileprivate let navigation: NavigationManagerProtocol

    init(navigation: NavigationManagerProtocol) {
        self.navigation = navigation
    }

    func navigateTo(screenIdentifier: String, params: NavigationParams?) -> any View {

        let identifier = FirstJourneyScreenIdentifiers(rawValue: screenIdentifier)

        switch identifier {
        case .welcome:
            return welcomeScreen()
        case .contacts:
            return launchContactsList()
        case .none:
            return EmptyView()
        }
    }

    private func welcomeScreen() -> any View {

        let state = WelcomeScreenViewState()

        return WelcomeView(state: state, viewModel: WelcomeScreenViewModel(state: state, navigation: navigation))
    }

    private func launchContactsList() -> any View {

        let state = ContactsScreenViewState()

        return ContactsView(state: state, viewModel: ContactsViewModel(state: state, navigation: navigation))
    }

}
