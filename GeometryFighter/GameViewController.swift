import UIKit
import SceneKit

class GameViewController: UIViewController {
    
    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
    }
    
    override var shouldAutomaticallyForwardAppearanceMethods: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func setupView() {
        scnView = self.view as! SCNView
        scnView.showsStatistics = true
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
        scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"
    }
    
    func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func spawnShape() {
        let shapeType = ShapeType.random()
        let geometry: SCNGeometry = {
            switch shapeType {
            case .box:
                return SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
            case .sphere:
                return SCNSphere(radius: 1.0)
            case .pyramid:
                return SCNPyramid(width: 1.0, height: 1.0, length: 1.0)
            case .torus:
                return SCNTorus(ringRadius: 2.0, pipeRadius: 1.0)
            case .capsule:
                return SCNCapsule(capRadius: 1.0, height: 1.0)
            case .cylinder:
                return SCNCylinder(radius: 1.0, height: 1.0)
            case .cone:
                return SCNCone(topRadius: 1.0, bottomRadius: 2.0, height: 1.0)
            case .tube:
                return SCNTube(innerRadius: 1.0, outerRadius: 2.0, height: 1.0)
            }
        }()
        let geometryNode = SCNNode(geometry: geometry)
        scnScene.rootNode.addChildNode(geometryNode)
        
        // for debug
        let text = SCNText(string: shapeType.description, extrusionDepth: 1.0)
        let textNode = SCNNode(geometry: text)
        textNode.position = SCNVector3(-2.0, 2.0, 0.0)
        textNode.transform = SCNMatrix4Scale(textNode.transform, 0.1, 0.1, 0.1)
        scnScene.rootNode.addChildNode(textNode)
    }
    
}
