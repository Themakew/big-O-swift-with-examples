import UIKit

/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */


/// Definition of Node
final class ListNode {
    var val: Int
    var next: ListNode?

    init() {
        self.val = 0
        self.next = nil
    }

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(val)"
        }
        return "\(val) " + String(describing: next) + " "
    }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // Edge case
        if head?.next == nil {
            return head
        }

        // Edge case
        if head == nil {
            return nil
        }

        // Distance of the current head to the future stack head
        let offset = k % count(head)

        // Edge case
        guard offset > 0 else {
            return head
        }

        var fast = head
        var slow = head

        // Setting fast pointer in the future stack head
        for _ in 1...offset { // O(n) - for loop
            fast = fast?.next
        }

        // Looping to update fast and slow pointers
        while fast?.next != nil { // O(n) - while loop
            fast = fast?.next
            slow = slow?.next
        }

        // Setting new head
        let newHead = slow?.next
        slow?.next = nil
        fast?.next = head

        return newHead
    }

    private func count(_ head: ListNode?) -> Int {
        var currentNode = head
        var result = 0

        while currentNode != nil {
            currentNode = currentNode?.next
            result+=1
        }

        return result
    }
}

let solution = Solution()
var node1: ListNode?

func buildStack() {
    let node5 = ListNode(5)
    let node4 = ListNode(4, node5)
    let node3 = ListNode(3, node4)
    let node2 = ListNode(2, node3)
    node1 = ListNode(1, node2)
}

buildStack()
solution.rotateRight(node1, 1) // 5 1 2 3 4

buildStack()
solution.rotateRight(node1, 2) // 4 5 1 2 3

buildStack()
solution.rotateRight(node1, 3) // 3 4 5 1 2

// TIME COMPLEXITY = O(n)
// SPACE COMPLEXITY = O(n)
