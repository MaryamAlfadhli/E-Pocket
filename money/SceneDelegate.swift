//
//  SceneDelegate.swift
//  Addnew
//
//  Created by sumayah on 26/07/1443 AH.
//

import UIKit



class SceneDelegate: UIResponder, UIWindowSceneDelegate {


    var window: UIWindow?
    let Entertainment: [String] = [" Riyadh Season"," Vox Cinema"," Winter wonderland"]
    let Subscriptions: [String] = [" Netflix"," Spotify"," OSN"]
    let Car: [String] = [" Gas station"," car repair"]
    var title: String = ""
    var price: String = ""
    var note: String = ""
    var contentM: String = ""
    var date: Date = Date.now
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    @IBAction func addBtn(_ sender: Any) {

        let vc2 = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.window?.rootViewController = vc2

    }
    
    func getContent(_ url: URL){
        if let content = try? String(contentsOf: url) {
            contentM = content
     
            let message = content.split(whereSeparator: \.isNewline)
            let titleLine = message[3].split(separator: ":")
            let priceLine = message[2].split(separator: " ")
            let dateLine = message[4].split(separator: " ")
            let dateFormatter = DateFormatter()
            let dateString = String(dateLine[1])+" "+String(dateLine[2])
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            date = dateFormatter.date(from:dateString)!
            
            title = String(titleLine[1])
            price = String(priceLine[1])
            note = String(message[1])
            
            fillNewExp()

        }
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let _ = (scene as? UIWindowScene) else { return }
        if let url = connectionOptions.urlContexts.first?.url {
            getContent(url)
        }
        
   
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        // Get the first URL out of the URLContexts set. If it does not exist, abort handling the passed URLs and exit this method.
        if let url = URLContexts.first?.url  {
            getContent(url)
        }

        
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
    }
    func fillNewExp(){

            let vc = storyboard.instantiateViewController(withIdentifier: "AddNewExp") as! AddNewExp
            self.window?.rootViewController = vc
            vc.UTitle.text = title
            vc.UValue.text = price
            vc.UNote.text = note
            vc.UDate.date = date

            if Entertainment.contains(title){
                vc.pickerCateg.selectRow(3, inComponent: 0, animated: true)
                vc.Ucateg.text = "Entertainment"
            }
            else if  Subscriptions.contains(title){
                vc.pickerCateg.selectRow(2, inComponent: 0, animated: true)
                vc.Ucateg.text = "Subscriptions"
            }

            else if  Car.contains(title){
                vc.pickerCateg.selectRow(1, inComponent: 0, animated: true)
                vc.Ucateg.text = "Car"
            }


    }
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

