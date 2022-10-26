//
//  BaseViewController.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import UIKit
//import FirebaseAuth

class BaseViewController: UIViewController, CoordinatorNavigationControllerDelegate {
    let account = KeychainAccount.sharedAccount
    let fonts = Constants.Fonts.self
    let colors = Constants.Colors.self
//    let shadow = Constants.Shadow.self
//    let texts = Constants.Texts.self

    var onForceLogout: (() -> Void)?
    var onBack: (() -> Void)?

    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? CoordinatorNavigationController {
            navigationController.swipeBackDelegate = self
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupNavigationController()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // MARK: - Private methods
    private func setupNavigationController() {
//        navigationController?.navigationBar.hideHairline()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(rgba: "#f1eee4")
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.tabBarController?.navigationItem.title = self.title
    }

    // MARK: - SwipeBackNavigationControllerDelegate
    internal func transitionBackFinished() {}

    internal func didSelectCustomBackAction() {
        self.onBack?()
    }

    func forceLogout(_ code: Int) {
        if code == 462 || code == 461 || code == 401 {
            self.onForceLogout?()
        }
    }

    func showActivityIndicator() {
        AlertManager.showAlertPleaseWait(self)
    }

    func stopActivityIndicator() {
        AlertManager.dismiss(self)
    }

    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0 , width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

    func resizeImageForUpload(image: UIImage, size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
