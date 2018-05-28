//
//  GameViewController.swift
//  SceineKitDemo
//
//  Created by Satoshi Komatsu on 2018/05/27.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var sceneView: SCNView!
    var scene: SCNScene!
    var cameraNode: SCNNode!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        sceneView = view as! SCNView
        
        sceneView.showsStatistics = true
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = true
        
        setupScene()
    }
    
    func setupScene() {
        scene = SCNScene()
        sceneView.scene = scene
        setupCamera()
    }
    
    func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera =  SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
        
        addSphere()
        addSquare()
    }
    
    func addSphere() {
        let geometry = SCNSphere(radius: 1.0)
        let sphereNode = SCNNode(geometry: geometry)
        let material = SCNMaterial()
        
        material.diffuse.contents = UIColor.red
        geometry.firstMaterial = material
        
        sphereNode.position = SCNVector3(x: 0, y: 1, z: 0)
        scene.rootNode.addChildNode(sphereNode)
    }
    
    func addSquare() {
        let geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        let squareNode = SCNNode(geometry: geometry)
        squareNode.geometry = geometry
        scene.rootNode.addChildNode(squareNode)
    }
}
