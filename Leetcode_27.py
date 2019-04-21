# 27-移除元素-简单-数组
# 时间：2019/4/21
# 作者：叶智

class Solution:
    def removeElement(self,nums,val):
        for i in range(len(nums)-1,-1,-1):
            if nums[i] == val:
                nums.pop(i)
        return len(nums)

nums = [0,4,4,2,5,2,4,0,4]
val = 4

test = Solution()
test.removeElement(nums,val)


