import SwiftUI

struct WelcomeView: View {

    @ObservedObject private var state: WelcomeScreenViewState
    private let viewModel: WelcomeScreenViewModel

    init(state: WelcomeScreenViewState, viewModel: WelcomeScreenViewModel) {
        self.state = state
        self.viewModel = viewModel
    }

    var body: some View {
        switch state.screenState {
        case .welcome:
            welcomeScreen
        case .login:
            AnyView(viewModel.navigateToLogin())
        }
    }

    var welcomeScreen: some View {
        VStack(spacing: 10) {
            Text("Hello, let's get started")
            Button("Login") {
                viewModel.didTapLogin()
            }
        }
    }
}
