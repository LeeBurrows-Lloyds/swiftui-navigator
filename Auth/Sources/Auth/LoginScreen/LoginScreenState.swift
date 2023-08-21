import Foundation
import SwiftUI

enum LoginScreenState {
    case preAuth,
         authenticated
}

final class LoginViewState: ObservableObject {
    let title = "Login"
    @Published var screenState: LoginScreenState = .preAuth
}

