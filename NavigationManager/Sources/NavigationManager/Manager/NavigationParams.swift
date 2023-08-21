import Foundation

public protocol NavigationParams {
    var cacheIdentifier: String {get set}

}


public final class DefaultNavigationParams: NavigationParams {
    public var cacheIdentifier: String
    public init(cacheIdentifier: String) {
        self.cacheIdentifier = cacheIdentifier
    }
}
