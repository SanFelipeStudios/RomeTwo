import RealmSwift
import SwiftUI

// MARK: Atlas App Services (Optional)
// The App Services App. Change YOUR_APP_SERVICES_APP_ID_HERE to your App Services App ID.
// If you don't have a App Services App and don't wish to use Sync for now,
// you can change this to:
let app: RealmSwift.App? = RealmSwift.App(id: "rometwo-pxipu")

// MARK: Main Views
/// The main screen that determines whether to present the SyncContentView or the LocalOnlyContentView.
@main
struct RomeTwoApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            // Using Sync?
            if let app = app {
                SyncContentView(app: app)
            } else {
                LocalOnlyContentView()
            }
        }
    }
}
