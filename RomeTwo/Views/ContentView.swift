import AuthenticationServices
import RealmSwift
import SwiftUI
import os

extension View {
    func Print(_ vars: Any...) -> some View {
        var log = ""
        for v in vars { log.append("\(v) | ") }
        print(log)
        return EmptyView()
    }
}

extension DefaultStringInterpolation {
  mutating func appendInterpolation<T>(_ optional: T?) {
    appendInterpolation(String(describing: optional))
  }
}

// MARK: Models
/// Random adjectives for more interesting demo item names
let randomAdjectives = [
    "fluffy", "classy", "bumpy", "bizarre", "wiggly", "quick", "sudden",
    "acoustic", "smiling", "dispensable", "foreign", "shaky", "purple", "keen",
    "aberrant", "disastrous", "vague", "squealing", "ad hoc", "sweet"
]

/// Random noun for more interesting demo item names
let randomNouns = [
    "floor", "monitor", "hair tie", "puddle", "hair brush", "bread",
    "cinder block", "glass", "ring", "twister", "coasters", "fridge",
    "toe ring", "bracelet", "cabinet", "nail file", "plate", "lace",
    "cork", "mouse pad"
]

/// An individual item. Part of an `ItemGroup`.
final class Item: Object, ObjectKeyIdentifiable {
    /// The unique ID of the Item. `primaryKey: true` declares the
    /// _id member as the primary key to the realm.
    @Persisted(primaryKey: true) var _id: ObjectId

    /// The name of the Item, By default, a random name is generated.
    @Persisted var name = "\(randomAdjectives.randomElement()!) \(randomNouns.randomElement()!)"

    /// A flag indicating whether the user "favorited" the item.
    @Persisted var isFavorite = false

    /// Users can enter a description, which is an empty string by default
    @Persisted var itemDescription = ""
    
    /// The backlink to the `ItemGroup` this item is a part of.
    @Persisted(originProperty: "items") var group: LinkingObjects<ItemGroup>
    
    /// Store the user.id as the ownerId so you can query for the user's objects with Flexible Sync
    /// Add this to both the `ItemGroup` and the `Item` objects so you can read and write the linked objects.
    @Persisted var ownerId = ""
}

/// Represents a collection of items.
final class ItemGroup: Object, ObjectKeyIdentifiable {
    /// The unique ID of the ItemGroup. `primaryKey: true` declares the
    /// _id member as the primary key to the realm.
    @Persisted(primaryKey: true) var _id: ObjectId

    /// The collection of Items in this group.
    @Persisted var items = RealmSwift.List<Item>()
    
    /// Store the user.id as the ownerId so you can query for the user's objects with Flexible Sync
    /// Add this to both the `ItemGroup` and the `Item` objects so you can read and write the linked objects.
    @Persisted var ownerId = ""
}

extension Item {
    static let item1 = Item(value: ["name": "fluffy coasters", "isFavorite": false, "ownerId": "previewRealm"])
    static let item2 = Item(value: ["name": "sudden cinder block", "isFavorite": true, "ownerId": "previewRealm"])
    static let item3 = Item(value: ["name": "classy mouse pad", "isFavorite": false, "ownerId": "previewRealm"])
}

extension ItemGroup {
    static let itemGroup = ItemGroup(value: ["ownerId": "previewRealm"])
    
    static var previewRealm: Realm {
        var realm: Realm
        let identifier = "previewRealm"
        let config = Realm.Configuration(inMemoryIdentifier: identifier)
        do {
            realm = try Realm(configuration: config)
            // Check to see whether the in-memory realm already contains an ItemGroup.
            // If it does, we'll just return the existing realm.
            // If it doesn't, we'll add an ItemGroup and append the Items.
            let realmObjects = realm.objects(ItemGroup.self)
            if realmObjects.count == 1 {
                return realm
            } else {
                try realm.write {
                    realm.add(itemGroup)
                    itemGroup.items.append(objectsIn: [Item.item1, Item.item2, Item.item3])
                }
                return realm
            }
        } catch let error {
            fatalError("Can't bootstrap item data: \(error.localizedDescription)")
        }
    }
}

// MARK: Views

/// The main content view if not using Sync.
struct LocalOnlyContentView: View {
    
    var body: some View {
        Text("Could not load application. Check your connection and try again")
    }
}

/// This view observes the Realm app object.
/// Either direct the user to login, or open a realm
/// with a logged-in user.
struct SyncContentView: View {
    // Observe the Realm app object in order to react to login state changes.
    @ObservedObject var app: RealmSwift.App
    
    var body: some View {
        if let user = app.currentUser {
            Print(String(describing: SyncContentView.self),
                  "User is logged in: \(app.currentUser?.id)")
            // Create a `flexibleSyncConfiguration` with `initialSubscriptions`.
            // We'll inject this configuration as an environment value to use when opening the realm
            // in the next view, and the realm will open with these initial subscriptions.
            let config = user.flexibleSyncConfiguration(initialSubscriptions: { subs in
                // Check whether the subscription already exists. Adding it more
                // than once causes an error.
                if let foundSubscriptions = subs.first(named: "user_groups") {
                    // Existing subscription found - do nothing
                    return
                } else {
                    // Add queries for any objects you want to use in the app
                    // Linked objects do not automatically get queried, so you
                    // must explicitly query for all linked objects you want to include
                    subs.append(QuerySubscription<ItemGroup>(name: "user_groups") {
                        // Query for objects where the ownerId is equal to the app's current user's id
                        // This means the app's current user can read and write their own data
                        $0.ownerId == user.id
                    })
                    subs.append(QuerySubscription<Item>(name: "user_items") {
                        $0.ownerId == user.id
                    })
                }
            })
            OpenSyncedRealmView()
                .environment(\.realmConfiguration, config)
        } else {
            Print(String(describing: SyncContentView.self),
                  "User is logged out.")
            // If there is no user logged in, show the login view.
            LoginView()
        }
    }
}

/// This view opens a synced realm.
struct OpenSyncedRealmView: View {
    // We've injected a `flexibleSyncConfiguration` as an environment value,
    // so `@AsyncOpen` here opens a realm using that configuration.
    @AsyncOpen(appId: "rometwo-pxipu", timeout: 4000) var asyncOpen
    
    var body: some View {
        // Because we are setting the `ownerId` to the `user.id`, we need
        // access to the app's current user in this view.
        let user = app?.currentUser
        
        switch asyncOpen {
            
        // Starting the Realm.asyncOpen process.
        // Show a progress view.
        case .connecting:
            ProgressView()
            
        // Waiting for a user to be logged in before executing
        // Realm.asyncOpen.
        case .waitingForUser:
            ProgressView("Waiting for user to log in...")
            
        // The realm has been opened and is ready for use.
        // Show the content view.
        case .open(let realm):
            ItemsView(itemGroup: {
                if realm.objects(ItemGroup.self).count == 0 {
                    try! realm.write {
                        // Because we're using `ownerId` as the queryable field, we must
                        // set the `ownerId` to equal the `user.id` when creating the object
                        realm.add(ItemGroup(value: ["ownerId":user!.id]))
                    }
                }
                return realm.objects(ItemGroup.self).first!
            }(), leadingBarButton: AnyView(LogoutButton())).environment(\.realm, realm)
            
        // The realm is currently being downloaded from the server.
        // Show a progress view.
        case .progress(let progress):
            ProgressView(progress)
            
        // Opening the Realm failed.
        // Show an error view.
        case .error(let error):
            ErrorView(error: error)
        }
    }
}

struct ErrorView: View {
    var error: Error
        
    var body: some View {
        VStack {
            Text("Error opening the realm: \(error.localizedDescription)")
        }
    }
}
    
// MARK: Authentication Views
/// Represents the login screen. We will have a button to log in anonymously.
struct LoginView: View {

    @AppStorage("userId") var userId: String = ""

    private var isSignedIn: Bool {
        !userId.isEmpty
    }

    // Hold an error if one occurs so we can display it.
    @State var error: Error?
    
    // Keep track of whether login is in progress.
    @State var isLoggingIn = false

    var body: some View {
        
        
        VStack {
            if isLoggingIn {
                let _ = Print(String(describing: LoginView.self),
                      "User is logging in...")
                ProgressView()
            } else {
                let _ = Print(String(describing: LoginView.self),
                      "User is NOT logging in...", "isSignedIn: \(isSignedIn)")
            }
            
            if let error = error {
                let _ = Print(String(describing: LoginView.self),
                      "Error in Login View: \(error.localizedDescription)")
                Text("Error: \(error.localizedDescription)")
            }

            if !isSignedIn {
                let _ = Print(String(describing: LoginView.self),
                      "Awaiting for user sign in")
                SignInWithAppleButtonView(isLoggingIn: $isLoggingIn)
                SignInAnonymouslyButtonView(isLoggingIn: $isLoggingIn, error: $error)
            }
        }
    }
}

struct SignInAnonymouslyButtonView: View {
    @Binding var isLoggingIn: Bool
    @Binding var error: Error?
    
    var body: some View {
        Button("Log in anonymously") {
            // Button pressed, so log in
            isLoggingIn = true
            Task {
                do {
                    let user = try await app!.login(credentials: .anonymous)
                    // Other views are observing the app and will detect
                    // that the currentUser has changed. Nothing more to do here.
                    let _ = Print(String(describing: SignInAnonymouslyButtonView.self),
                                  "Logged in as user with id: \(user.id)")
                    
                } catch {
                    let _ = Print(String(describing: SignInAnonymouslyButtonView.self),
                                  "Failed to log in: \(error.localizedDescription)")
                    // Set error to observed property so it can be displayed
                    self.error = error
                    return
                }
            }
        }.disabled(isLoggingIn)
    }
}

struct SignInWithAppleButtonView: View {
    @Binding var isLoggingIn: Bool
    
    // Ability to support light and dark mode
    // Here we are Observing the 'colorScheme' environment
    @Environment(\.colorScheme) var colorScheme

    @AppStorage("userId") var userId: String = ""
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    
    var body: some View {
        SignInWithAppleButton(.continue) { request in
            isLoggingIn = true
            
            // What scopes do we want to get out of the request (What user info)
            request.requestedScopes = [.email, .fullName]

        } onCompletion: { result in
            switch result {
            case .success(let auth):
                
                guard let credentials = auth.credential as? ASAuthorizationAppleIDCredential, let identityToken = credentials.identityToken, let identityTokenString = String(data: identityToken, encoding: .utf8) else { return }

                switch auth.credential {
                case let credential as ASAuthorizationAppleIDCredential:
                    // The userId is the only information your app gets if the user deletes your app and signs in again
                    self.userId = credential.user
                    
                    // This information is only collected the FIRST time a user signs in to your app
                    // Make sure to cache these in either your app or your database
                    self.email = credential.email ?? ""
                    self.firstName = credential.fullName?.givenName ?? ""
                    self.lastName = credential.fullName?.familyName ?? ""
                    
                    sign(token: identityTokenString)
                    
                default:
                    break
                }

            case .failure(let error):
                let _ = Print(String(describing: SignInWithAppleButtonView.self),
                      "Error: \(error)")
            }

        }
        .signInWithAppleButtonStyle(
                colorScheme == .dark ? .white : .black)
        .frame(height: 50)
        .padding()
        .cornerRadius(8)
        .disabled(isLoggingIn)
    }
    
    func sign(token: String) {
        
        // Fetch IDToken via the Apple SDK
        let credentials = Credentials.apple(idToken: token)
        app?.login(credentials: credentials) { (result) in
            switch result {
            case .failure(let error):
                let _ = Print(String(describing: SignInWithAppleButtonView.self),
                      "Login failed: \(error.localizedDescription)")
            case .success(let user):
                let _ = Print(String(describing: SignInWithAppleButtonView.self),
                      "Successfully logged in as user: \(user)")
                // Now logged in, do something with user
                // Remember to dispatch to main if you are doing anything on the UI thread
            }
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

/// A button that handles logout requests.
struct LogoutButton: View {
    @AppStorage("userId") var userId: String = ""
    @State var isLoggingOut = false

    var body: some View {
        Button("Log Out") {
            guard let user = app!.currentUser else {
                return
            }
            isLoggingOut = true
            Task {
                do {
                    let _ = Print(String(describing: LogoutButton.self), "Attempting to log out...")
                    try await app!.currentUser!.logOut()
                    self.userId = ""
                    // Other views are observing the app and will detect
                    // that the currentUser has changed. Nothing more to do here.
                } catch {
                    let _ = Print("Error logging out:", error.localizedDescription)
                }
            }
        }.disabled(app!.currentUser == nil || isLoggingOut)
    }
}

// MARK: Item Views
/// The screen containing a list of items in an ItemGroup. Implements functionality for adding, rearranging,
/// and deleting items in the ItemGroup.
struct ItemsView: View {
    @ObservedRealmObject var itemGroup: ItemGroup

    /// The button to be displayed on the top left.
    var leadingBarButton: AnyView?

    var body: some View {
        let user = app?.currentUser
        NavigationView {
            VStack {
                // The list shows the items in the realm.
                List {
                    ForEach(itemGroup.items) { item in
                        ItemRow(item: item)
                    }.onDelete(perform: $itemGroup.items.remove)
                    .onMove(perform: $itemGroup.items.move)
                }
                .listStyle(GroupedListStyle())
                    .navigationBarTitle("Items", displayMode: .large)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(
                        leading: self.leadingBarButton,
                        // Edit button on the right to enable rearranging items
                        trailing: EditButton())
                // Action bar at bottom contains Add button.
                HStack {
                    Spacer()
                    Button(action: {
                        // The bound collection automatically
                        // handles write transactions, so we can
                        // append directly to it.
                        // Because we are using Flexible Sync, we must set
                        // the item's ownerId to the current user.id when we create it.
                        $itemGroup.items.append(Item(value: ["ownerId":user!.id]))
                    }) { Image(systemName: "plus") }
                }.padding()
            }
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        let realm = ItemGroup.previewRealm
        let itemGroup = realm.objects(ItemGroup.self)
        ItemsView(itemGroup: itemGroup.first!)
    }
}

/// Represents an Item in a list.
struct ItemRow: View {
    @ObservedRealmObject var item: Item

    var body: some View {
        // You can click an item in the list to navigate to an edit details screen.
        NavigationLink(destination: ItemDetailsView(item: item)) {
            Text(item.name)
            if item.isFavorite {
                // If the user "favorited" the item, display a heart icon
                Image(systemName: "heart.fill")
            }
        }
    }
}

/// Represents a screen where you can edit the item's name.
struct ItemDetailsView: View {
    @ObservedRealmObject var item: Item

    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter a new name:")
            // Accept a new name
            TextField("New name", text: $item.name)
                .navigationBarTitle(item.name)
                .navigationBarItems(trailing: Toggle(isOn: $item.isFavorite) {
                    Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                })
        }.padding()
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailsView(item: Item.item2)
        }
    }
}