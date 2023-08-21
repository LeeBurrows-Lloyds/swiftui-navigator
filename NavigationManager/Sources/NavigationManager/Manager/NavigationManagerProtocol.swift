import Foundation
import SwiftUI

public protocol NavigationManagerProtocol {
    func registerProvider(for module: String, provider: NavigationProviderProtocol)
    func navigateTo(screenIdentifier: String, params: NavigationParams?) -> any View
}
