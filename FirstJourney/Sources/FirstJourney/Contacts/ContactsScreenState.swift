import Foundation
import SwiftUI

enum ContactsScreenState {
    case full,
         detail
}

final class ContactsScreenViewState: ObservableObject {
    let title = "All"
    @Published var screenState: ContactsScreenState = .full
}
