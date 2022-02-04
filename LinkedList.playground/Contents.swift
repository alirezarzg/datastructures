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
        let tail = findPreTail()?.next
        tail?.next = node
        node.next = nil
//        var h = head
//        while h?.next != nil {
//            h = h?.next
//        }
//        h?.next = node
//        node.next = nil
    }
    func removeHead() -> Node<T>? {
        let pHead = self.head
        head = head?.next
        return pHead
    }
    
    func removeTail() -> Node<T>? {
        let preTail = findPreTail()
        let tail = preTail?.next
        preTail?.next = nil
        return tail
    }
    
    func findPreTail() -> Node<T>? {
        guard head != nil else { return nil }
        var h = head
        while h?.next?.next != nil {
            h = h?.next
        }
        return h
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
    lL.addAfterTail(Node(5))
    lL.addAfterTail(Node(6))
    lL.addAfterTail(Node(7))
    print(lL)
    
    lL.removeHead()
    print(lL)
    
    lL.removeTail()
    print(lL)
}

main()
