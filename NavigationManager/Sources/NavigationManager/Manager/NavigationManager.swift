import Foundation
import SwiftUI

public final class NavigationManager: NavigationManagerProtocol {
    private var providers = [String: NavigationProviderProtocol]()
    public init() {}
    public func registerProvider(for module: String, provider: NavigationProviderProtocol) {
        providers[module] = provider
    }
    private func getModuleAndScreenName(_ screenIdentifier: String) -> (String?, String?) {
        let identifierList = screenIdentifier.split(separator: "_")
        if identifierList.count > 1 {
            if let moduleName = identifierList.first,
               let screenName = identifierList.last {
                let module = String(moduleName)
                let screen = String(screenName)
                return (module, screen)
            }
        }
        return(nil, nil)
    }

    public func navigateTo(screenIdentifier: String, params: NavigationParams?) -> any View {
        let (moduleName, screenName) = getModuleAndScreenName(screenIdentifier)
        guard let module = moduleName, let screen = screenName else {
            return EmptyView()
        }
        if let provider = providers[module] {
            return provider.navigateTo(screenIdentifier: screen, params: params)
        }
        return EmptyView()
    }
}
