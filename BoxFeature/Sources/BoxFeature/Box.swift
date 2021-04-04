
import Foundation

public final class Box<T> {
  
  public typealias Listener = (T) -> ()
  
  public var value: T {
    didSet {
      listeners.values.forEach({$0(value)})
    }
  }
  
  private var listeners: [String: Listener]
  
  public init(_ value: T) {
    self.value = value
    self.listeners = [String:Listener]()
  }
  
  public func bind(key: String, listener: @escaping Listener) {
    listeners[key] = (listener)
    listener(value)
  }
  
  public func removeBind(key: String) {
    listeners[key] = nil
  }
}
