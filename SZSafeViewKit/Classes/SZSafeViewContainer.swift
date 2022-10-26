
import Foundation
import UIKit

public class SZSafeViewContainer<Content: UIView>: UITextField {
  
  public let content: Content
  
  public lazy var container: UIView? = {
    return SafeContainerFinder.findContainer(for: self)
  }()
  
  public init(content: Content) {
    self.content = content
    
    super.init(frame: .zero)
    
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    guard let container = container else {
      return
    }
    
    content.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      content.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      content.centerYAnchor.constraint(equalTo: container.centerYAnchor),
      content.widthAnchor.constraint(equalTo: container.widthAnchor),
      content.heightAnchor.constraint(equalTo: container.heightAnchor)
    ])
  }
}

public enum SafeContainerFinder {
  
  public static func findContainer(for view: UIView) -> UIView? {
    var containerString = ""
    
    if #available(iOS 16, *) {
      containerString = "_UITextLayoutCanvasView"
    }
    
    if #available(iOS 15, *) {
      containerString = "_UITextLayoutCanvasView"
    }

    if #available(iOS 14, *) {
      containerString = "_UITextFieldCanvasView"
    }

    if #available(iOS 13, *) {
      containerString = "_UITextFieldCanvasView"
    }

    let containers = view.subviews.filter { subview in
        type(of: subview).description() == containerString
    }

    return containers.first
  }
}
