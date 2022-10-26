//
//  OnFaceView.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 23.01.2022.
//

import UIKit
import ARKit
import RealityKit

class OnFaceView: BaseView {    
    var item: ProductItemModel! {
        didSet {
            configureARView()
        }
    }
    
    lazy var arView: ARView = {
        let view = RealityKit.ARView()
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
    
    private func configureARView() {
        guard ARFaceTrackingConfiguration.isSupported else { return }
        let configuration = ARFaceTrackingConfiguration()
        configuration.isLightEstimationEnabled = true

        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        switch item.imageName {
        case "CasualGlasses":
            let anchor = try! Glasses.loadCasualGlasses()
            arView.scene.anchors.append(anchor)
        case "SunGlasses":
            let anchor = try! Glasses.loadSunGlasses()
            arView.scene.anchors.append(anchor)
        default:
            break
        }
    }
}

extension OnFaceView: ARSessionDelegate {
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        
    }
}

extension OnFaceView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubview(arView)
    }
    
    func setupConstraints() {
        arView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
