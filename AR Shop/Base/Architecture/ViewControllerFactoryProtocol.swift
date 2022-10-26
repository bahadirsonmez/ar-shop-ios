//
//  ViewControllerFactoryProtocol.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import Foundation

protocol AuthViewControllerFactory {
//    func instantiateOnboardingViewController() -> OnboardingViewController
//    func instantiateWelcomeViewController() -> WelcomeViewController
//    func instantiateLoginViewController() -> LoginViewController
//    func instantiateRegisterViewController() -> RegisterViewController
//    func instantiatePhoneViewController() -> PhoneViewController
//    func instantiateOTPViewController() -> OTPViewController

}

protocol TabBarControllerFactory {
    func instantiateTabBarController() -> MainTabBarController
    
    func instantiateMainViewController() -> MainViewController
    func instantiateOnFaceViewController() -> OnFaceViewController

    func instantiateCategoriesViewController() -> CategoriesViewController
//    func instantiateSubcategoriesViewController() -> SubcategoriesViewController
//    func instantiateSearchViewController() -> SearchViewController
//    func instantiateBasketViewController() -> BasketViewController
//    func instantiatePaymentViewController() -> PaymentViewController
//    func instantiateDeliveryViewController() -> DeliveryViewController
//    func instantiateConfirmationViewController() -> ConfirmationViewController
//    func instantiateWishlistViewController() -> WishlistViewController
//    func instantiateCampaignsViewController() -> CampaignsViewController
//    func instantiateAccountViewController() -> AccountViewController
}
