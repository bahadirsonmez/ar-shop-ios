//
//  DependencyContainer+extension.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//
import UIKit

extension DependencyContainer: AuthViewControllerFactory {
//    func instantiateOnboardingViewController() -> OnboardingViewController {
//        let onboardVC = OnboardingViewController()
//        return onboardVC
//    }
//    func instantiateWelcomeViewController() -> WelcomeViewController {
//        let welcomeVC = WelcomeViewController()
//        return welcomeVC
//    }
//
//    func instantiateLoginViewController() -> LoginViewController {
//        let loginVM = LoginViewModel(manager: self.loginManager)
//        let loginVC = LoginViewController(with: loginVM)
//        return loginVC
//    }
//
//    func instantiateRegisterViewController() -> RegisterViewController {
//        let loginVM = LoginViewModel(manager: self.loginManager)
//        let registerVC = RegisterViewController(with: loginVM)
//        return registerVC
//    }
//
//    func instantiatePhoneViewController() -> PhoneViewController {
//        let loginVM = LoginViewModel(manager: self.loginManager)
//        let phoneVC = PhoneViewController(with: loginVM)
//        return phoneVC
//    }
//
//    func instantiateOTPViewController() -> OTPViewController {
//        let loginVM = LoginViewModel(manager: self.loginManager)
//        let otpVC = OTPViewController(with: loginVM)
//        return otpVC
//    }


}

extension DependencyContainer: TabBarControllerFactory {
    func instantiateTabBarController() -> MainTabBarController {
        let tabBarController = MainTabBarController()
        return tabBarController
    }
    
    func instantiateMainViewController() -> MainViewController{
        let vm = MainViewModel(manager: self.mainManager)
        let vc = MainViewController()
        
        let image = Constants.Tab.tab0
        let selectedImage = Constants.Tab.tab0Selected
        let title = Constants.Tab.tab0Title
                
        vc.tabBarItem = UITabBarItem(
            title: title,
            image: image, tag: 0)
        vc.tabBarItem.selectedImage = selectedImage
        vc.viewModel = vm
        return vc
    }
    
    func instantiateOnFaceViewController() -> OnFaceViewController{
        let vm = MainViewModel(manager: self.mainManager)
        let vc = OnFaceViewController()
        
        vc.viewModel = vm
        return vc
    }

    
    func instantiateCategoriesViewController() -> CategoriesViewController{
        let vm = CategoriesViewModel(manager: self.categoriesManager)
        let vc = CategoriesViewController()

        let image = Constants.Tab.tab1
        let selectedImage = Constants.Tab.tab1Selected
        let title = Constants.Tab.tab1Title

        vc.tabBarItem = UITabBarItem(
            title: title,
            image: image, tag: 1)
        vc.tabBarItem.selectedImage = selectedImage
        vc.viewModel = vm
        return vc
    }
    
//    func instantiateSubcategoriesViewController() -> SubcategoriesViewController {
//        let vc = SubcategoriesViewController()
//
//        return vc
//    }
    
//    func instantiateSearchViewController() -> SearchViewController{
//        let vm = SearchViewModel(manager: self.searchManager)
//        let vc = SearchViewController()
//
//        let image = Constants.Tab.tab2
//        let selectedImage = Constants.Tab.tab2Selected
//        let title = Constants.Tab.tab2Title
//
//        vc.tabBarItem = UITabBarItem(
//            title: title,
//            image: image, tag: 2)
//        vc.tabBarItem.selectedImage = selectedImage
//        vc.viewModel = vm
//        return vc
//    }
//
//    func instantiateBasketViewController() -> BasketViewController{
//        let vm = BasketViewModel(manager: self.basketManager)
//        let vc = BasketViewController()
//
//        let image = Constants.Tab.tab2
//        let selectedImage = Constants.Tab.tab2Selected
//        let title = Constants.Tab.tab2Title
//
//        vc.tabBarItem = UITabBarItem(
//            title: title,
//            image: image, tag: 2)
//        vc.tabBarItem.selectedImage = selectedImage
//        vc.viewModel = vm
//        return vc
//    }
//
//    func instantiatePaymentViewController() -> PaymentViewController {
////        let vm = PaymentViewModel(manager: )
//        let vc = PaymentViewController()
//        return vc
//    }
//
//    func instantiateDeliveryViewController() -> DeliveryViewController {
////        let vm = PaymentViewModel(manager: )
//        let vc = DeliveryViewController()
//        return vc
//    }
//
//    func instantiateConfirmationViewController() -> ConfirmationViewController {
////        let vm = PaymentViewModel(manager: )
//        let vc = ConfirmationViewController()
//        return vc
//    }


    
//    func instantiateCampaignsViewController() -> CampaignsViewController{
//        let vm = CampaignsViewModel(manager: self.campaignManager)
//        let vc = CampaignsViewController()
//
//        let image = Constants.Tab.tab3
//        let selectedImage = Constants.Tab.tab3Selected
//        let title = Constants.Tab.tab3Title
//
//        vc.tabBarItem = UITabBarItem(
//            title: title,
//            image: image, tag: 3)
//        vc.tabBarItem.selectedImage = selectedImage
//        vc.viewModel = vm
//        return vc
//    }
//
//    func instantiateWishlistViewController() -> WishlistViewController{
//        let vm = WishlistViewModel(manager: self.whislistManager)
//        let vc = WishlistViewController()
//
//        let image = Constants.Tab.tab3
//        let selectedImage = Constants.Tab.tab3Selected
//        let title = Constants.Tab.tab3Title
//
//        vc.tabBarItem = UITabBarItem(
//            title: title,
//            image: image, tag: 3)
//        vc.tabBarItem.selectedImage = selectedImage
//        vc.viewModel = vm
//        return vc
//    }
//
//    func instantiateAccountViewController() -> AccountViewController {
//        let vc = AccountViewController()
//        let image = Constants.Tab.tab4
//        let selectedImage = Constants.Tab.tab4Selected
//        let title = Constants.Tab.tab4Title
//
//        vc.tabBarItem = UITabBarItem(
//            title: title,
//            image: image, tag: 4)
//        vc.tabBarItem.selectedImage = selectedImage
//        return vc
//    }

}


