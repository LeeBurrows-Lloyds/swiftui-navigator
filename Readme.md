# SwiftUI and Navigation

An approach to Navigation in a SwiftUI journey

### Why we chose this approach?

- It's seperated allowing modularisation
- Kept with current Navigator Pattern inside of NGA
- Easy to trigger navigation changes.

## To make this work

### NavigationProvider
A NavigationProvider, given by each module, is responsible for creation and the return of a given view for a given screenIdentifier. 

```swift
    func navigateTo(screenIdentifier: String, params: NavigationParams?) -> any View {

        let identifier = FirstJourneyScreenIdentifiers(rawValue: screenIdentifier)

        switch identifier {
        case .welcome:
            return welcomeScreen()
        case .contacts:
            return launchContactsList()
        case .none:
            return EmptyView()
        }
    }

    private func welcomeScreen() -> any View {

        let state = WelcomeScreenViewState()

        return WelcomeView(state: state, viewModel: WelcomeScreenViewModel(state: state, navigation: navigation))
    }
```

### NavigationManager

We have a very basic NavigationManager SPM, whom defines protocols for navigating, and also implementation of `NavigationManager` which simply returns a `NavigationProvider` for a given "key". Each module depends upon `NavigationManager``

Inside the host application, we `register`` NavigationProviders for a given key. This keeps "Auth" seperate from "FirstJourney".

```swift
        navigation.registerProvider(for: "First", provider: FirstJourneyNavigationProvider(navigation: navigation))
```


### State

We make use of a State Object, whom is injected into a SwiftUIView and also to the ViewModel (could be coordinator) where `screenState` variable changes induce the navigation.

```swift
    func didTapLogin() {
        state.screenState = .login
    }
```

Changes to the Screen State will trigger SwiftUI to redraw, causing the navigation.

```swift
 var body: some View {
        switch state.screenState {
        case .welcome:
            welcomeScreen....
        case .login:
            AnyView(viewModel.navigateToLogin())
        }
    }
```

Our View Model returns a opaque View, from the Navigator. It is stringly typed, but we could enum around it

```swift
    func navigateToLogin() -> any View {
        return navigation.navigateTo(screenIdentifier: "Auth_login", params: nil)
    }
```



