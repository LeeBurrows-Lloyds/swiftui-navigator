import Foundation
import SwiftUI

public protocol NavigationProviderProtocol {
    @available(iOS 13.0, *)
    func navigateTo(screenIdentifier: String, params: NavigationParams?) -> any View
}
