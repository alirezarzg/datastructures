import PlaygroundSupport

class Node<T>: CustomStringConvertible {
    var value: T
    var next: Node?
    
    init(_ value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> \(next)"
    }
}

class LinkedList<T>: CustomStringConvertible {
    var head: Node<T>?
    
    init(head: Node<T>?) {
        self.head = head
    }
    
    var description: String {
        guard let head = head else { return "Empty List" }
        return "\(head)"
    }
}

extension LinkedList {
    func addAtStart(_ node: Node<T>) { //addBeforeHead
        node.next = head
        head = node
    }
    
    func addAfterTail(_ node: Node<T>) {
        var h = head
        while h?.next != nil {
            h = h?.next
        }
        h?.next = node
        node.next = nil
    }
    func removeHead() -> Node<T>? {
        let pHead = self.head
        head = head?.next
        return pHead
    }
    
    func removeTail() -> Node<T>? {
        return nil
    }
}

func main() {
    defer { PlaygroundPage.current.finishExecution() }
    
    let tail = Node(3, next: nil)
    let node = Node(2, next: tail)
    let head = Node(1, next: node)
    let lL = LinkedList(head: head)
    print(lL)
    
    lL.addAtStart(Node(0))
    print(lL)
    
    lL.addAfterTail(Node(4))
    print(lL)
    
    lL.removeHead()
    print(lL)
}

main()
