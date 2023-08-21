import NavigationManager
import SwiftUI
import Foundation

final class LoginViewModel {

    fileprivate let navigation: NavigationManagerProtocol
    var state: LoginViewState

    init(navigation: NavigationManagerProtocol, state: LoginViewState) {
        self.navigation = navigation
        self.state = state
    }

    func didLogin() -> any View {
        navigation.navigateTo(screenIdentifier: "First_contacts", params: nil)
    }

    func didTapLogin() {
        state.screenState = .authenticated
    }
}
