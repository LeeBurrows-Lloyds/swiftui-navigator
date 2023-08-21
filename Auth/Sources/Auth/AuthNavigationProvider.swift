import Foundation
import NavigationManager
import SwiftUI

public enum AuthScreenIdentifiers: String {
    case login
}

final class AuthNavigationProvider: NavigationProviderProtocol {

    fileprivate let navigation: NavigationManagerProtocol

    init(navigation: NavigationManagerProtocol) {
        self.navigation = navigation
    }

    func navigateTo(screenIdentifier: String, params: NavigationParams?) -> any View {

        let identifier = AuthScreenIdentifiers(rawValue: screenIdentifier)

        switch identifier {
        case .login:
            return launchLoginScreen()
        default:
            return EmptyView()
        }
    }

    private func launchLoginScreen() -> any View {

        let state = LoginViewState()

        return LoginView(state: state, viewModel: LoginViewModel(navigation: navigation, state: state))
    }

}
