def is_symmetric(root):
    if not root:
        return True
        def are_symmetric(left, right):
            if not left and not right:
                return True 
            if not left or not right or left.val != right.val:
                return False 
            return are_symmetric(left.left, right.right) and are_symmetric(left.right, right.left)
        return are_symmetric(root.left, root.right)