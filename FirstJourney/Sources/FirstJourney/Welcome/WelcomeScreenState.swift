import Foundation
import SwiftUI

enum WelcomeScreenScreenState {
    case welcome,
         login
}

final class WelcomeScreenViewState: ObservableObject {
    let title = "Welcome"
    @Published var screenState: WelcomeScreenScreenState = .welcome
}
