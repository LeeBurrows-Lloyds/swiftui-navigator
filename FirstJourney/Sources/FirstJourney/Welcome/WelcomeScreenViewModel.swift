import Foundation
import SwiftUI
import NavigationManager

final class WelcomeScreenViewModel {

    fileprivate let navigation: NavigationManagerProtocol
    var state: WelcomeScreenViewState

    init(state: WelcomeScreenViewState,
         navigation: NavigationManagerProtocol) {
        self.state = state
        self.navigation = navigation
    }

    func didTapLogin() {
        state.screenState = .login
    }

    func navigateToLogin() -> any View {
        return navigation.navigateTo(screenIdentifier: "Auth_login", params: nil)
    }
}
