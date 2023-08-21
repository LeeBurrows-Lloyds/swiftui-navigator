import NavigationManager

public struct Auth {
    public init(navigation: NavigationManagerProtocol) {
        navigation.registerProvider(for: "Auth", provider: AuthNavigationProvider(navigation: navigation))
    }
}
