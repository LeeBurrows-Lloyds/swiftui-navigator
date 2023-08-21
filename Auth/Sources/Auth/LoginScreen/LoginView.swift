
import SwiftUI

struct LoginView: View {

    @State var userName: String = ""
    @State var password: String = ""

    @ObservedObject private var state: LoginViewState

    private let viewModel: LoginViewModel

    init(state: LoginViewState, viewModel: LoginViewModel) {
        self.state = state
        self.viewModel = viewModel
    }

    var body: some View {

        switch state.screenState {
        case .preAuth:
            VStack(spacing: 20) {
                TextField("Username", text: $userName)
                TextField("Password", text: $password)

                Button("Login") {
                    viewModel.didTapLogin()
                }
            }
        case .authenticated:
            AnyView(viewModel.didLogin())
        }

    }
}

