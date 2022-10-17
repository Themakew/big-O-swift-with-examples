import UIKit

// https://www.youtube.com/watch?v=gE0GopCq378&ab_channel=mycodeschool

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.

 For example, given

    A = [1, 2, 9, 7, 6]
    B = [3, 4, 9, 7, 6]
 the function should return 9, the merge point value.

 */


/// Helper class
class Node {
    var data: Int
    var next: Node?

    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

/// Helper function
/// - Parameter head: first node to begin counting
/// - Returns: length of linked list
func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }

    var len = 0
    var current = head

    while current != nil { // O(n) - while loop
        len += 1
        current = current?.next
    }

    return len
}

/// Naive solution
/// - Parameters:
///   - headA: first node of linked list A
///   - headB: first node of linked list B
/// - Returns: first node value in merge point
func solution(headA: Node?, headB: Node?) -> Int? { // O(m*n)
    let m = length(headA) // O(m)
    let n = length(headB) // O(n)

    var currentA = headA

    for _ in 0...m-1 { // O(m) - for loop
        var currentB = headB

        for _ in 0...n-1 { // O(n) - for loop
            let A = currentA?.data
            let B = currentB?.data

            if A == B {
                return currentA?.data
            }
            currentB = currentB?.next
        }
        currentA = currentA?.next
    }
    return nil
}

// Building linked list: 1 -> 2 -> 3 -> 4 -> 5 -> 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// Building linked list: 10 -> 11 -> 12 -> 13 -> 4 -> 5 -> 6
let node11 = Node(11, node4)
let node10 = Node(3, node11)

solution(headA: node1, headB: node10) // 3

// TIME COMPLEXITY = O(n*m), bigger than O(nˆ2), however is a quadratic solution as well
// SPACE COMPLEXITY = O(n+m), linear
