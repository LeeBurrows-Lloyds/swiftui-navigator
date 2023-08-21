import Foundation
import SwiftUI
import NavigationManager

final class ContactsViewModel {

    fileprivate let navigation: NavigationManagerProtocol
    var state: ContactsScreenViewState

    init(state: ContactsScreenViewState,
         navigation: NavigationManagerProtocol) {
        self.state = state
        self.navigation = navigation
    }

    func didTapDetail() {
        state.screenState = .detail
    }

    func navigateToLogout() -> any View {
        // Logoutservice.logout
        return navigation.navigateTo(screenIdentifier: "Auth_login", params: nil)
    }
}
