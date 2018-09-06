


import StoreKit

struct UserDefaultsKeys {
    
    static let APP_OPENED_COUNT = "APP_OPENED_COUNT"
    
}

struct StoreReviewHelper {
    
   let Defaults = UserDefaults.standard
    
    static func incrementAppOpenedCount() { // called from appdelegate didfinishLaunchingWithOptions:
        guard var appOpenCount = UserDefaults.standard.value(forKey: UserDefaultsKeys.APP_OPENED_COUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
            return
        }
        appOpenCount += 1
        UserDefaults.standard.set(appOpenCount, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
    }
   
    
    // call this whenever appropriate this will not be shown everytime. Apple has some internal logic on how to show this.
    static func checkAndAskForReview() {
        guard let appOpenCount = UserDefaults.standard.value(forKey: UserDefaultsKeys.APP_OPENED_COUNT) as? Int else {
            UserDefaults.standard.set(1, forKey: UserDefaultsKeys.APP_OPENED_COUNT)
            return
        }
        
        //If the app is open certain number of times then call the requestReview() method
        switch appOpenCount {
        case 1,50:
            StoreReviewHelper().requestReview()
        case _ where appOpenCount%100 == 0 :
            StoreReviewHelper().requestReview()
        default:
            print("App run count is : \(appOpenCount)")
            break;
        }
        
    }
    fileprivate func requestReview() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
            // Try any other 3rd party or manual method here.
        }
    }
}

