
import Foundation
import UIKit

public class SZSafeViewContainer<Content: UIView>: UITextField {
  
  public let content: Content
  
  public let size: CGSize
  
  public lazy var container: UIView? = {
    return SafeContainerFinder.findContainer(for: self)
  }()
  
  public override var intrinsicContentSize: CGSize {
    return size
  }
  
  public init(content: Content) {
    self.content = content
    self.size = content.intrinsicContentSize
    
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
    
    container.addSubview(content)
    content.translatesAutoresizingMaskIntoConstraints = false
    [
        content.topAnchor.constraint(equalTo: container.topAnchor),
        content.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        content.leftAnchor.constraint(equalTo: container.leftAnchor),
        content.rightAnchor.constraint(equalTo: container.rightAnchor)
    ].forEach { $0.isActive = true }
    self.isSecureTextEntry = true
    self.isUserInteractionEnabled = false
    container.isUserInteractionEnabled = false
    
    self.setContentHuggingPriority(content.contentHuggingPriority(for: .horizontal), for: .horizontal)
    self.setContentHuggingPriority(content.contentHuggingPriority(for: .vertical), for: .vertical)
    self.setContentCompressionResistancePriority(content.contentCompressionResistancePriority(for: .horizontal), for: .horizontal)
    self.setContentCompressionResistancePriority(content.contentCompressionResistancePriority(for: .vertical), for: .vertical)
    self.setContentHuggingPriority(UILayoutPriority(1.0), for: .horizontal)
  }
  
  public override func hitTest(
      _ point: CGPoint,
      with event: UIEvent?
  ) -> UIView? {
    guard let view = super.hitTest(point, with: event) else {
      return content
    }
    
    if view != self {
        return view
    }
    
    return content
  }
}

public enum SafeContainerFinder {
  
  public static func findContainer(for view: UIView) -> UIView? {
    var containerString = ""
    
    if #available(iOS 16, *) {
      containerString = "_UITextLayoutCanvasView"
    } else if #available(iOS 15, *) {
      containerString = "_UITextLayoutCanvasView"
    } else if #available(iOS 14, *) {
      containerString = "_UITextFieldCanvasView"
    } else if #available(iOS 13, *) {
      containerString = "_UITextFieldCanvasView"
    }

    let containers = view.subviews.filter { subview in
        type(of: subview).description() == containerString
    }

    return containers.first
  }
}
