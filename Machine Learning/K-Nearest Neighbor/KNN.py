import numpy as pd
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.datasets.samples_generator import make_blobs


class KdNode:
    def __init__(self,axis,point,left,right):
        self.axis = axis
        self.point = point
        self.left = left
        self.right = right

class KdTree:
    def load_data(self, data):
        # 加载数据
        self.data = data

    def init_args(self):
        """
        通过递归的方法创建 KdTree
        """
        data = self.data
        # 数据的维度
        k = len(data[0])
        # 数据集的长度
        self.node_num = len(data)
        # 根节点
        self.root = create_node(0, data)
        # 递归创建节点
        def create_node(axis, data_set):
            # 递归终止条件，数据结构为空
            if not data_set:
                return None
            # 排序取中点
            data_set.sort(key=lambda x: x[axis])
            point_pos = len(data_set) // 2
            point_media = data_set[point_pos]
            next_axis = (axis + 1) % k
            return KdNode(axis, point_media,
                          create_node(next_axis, data_set[0:point_pos]),
                          create_node(next_axis, data_set[point_pos + 1:]))

    # # 前序遍历树
    # def pre_order(self, ele):
    #     if not ele:
    #         return
    #     self.pre_order(ele.left)
    #     print(ele.point)
    #     self.pre_order(ele.right)

# KNN
class KNN:
    def __init__(self, kdtree, point):
        """
        :param kdtree 已加载好数据的 kdtree
        :param point 目标点
        """
        self.kdtree = kdtree
        self.point = point

    def add_node(self, point, num=-1):
        """
        :param num
        如果要求的最近点的数目大于已有最近点的数目，则直接向最近点中加入这个点，此时 num = -1
        如果要求的最近点的数目已经满足已有最近点的数目，则与距离最远的比较，距离比他大就不变，比他小就替换掉
        """
        # 给 tupple 取名字。比如_Result((1, 2)) 输出_Result(dist=1, point=2)
        _Result = namedtuple('_Result', 'dist point')
        # 计算距离
        dist = compute_dist(self.point, point)
        # 组成点和距离的 tupple
        r = _Result(dist, point)
        # 加入这个点
        self.close_nodes.append(r)
        # 排序
        self.close_nodes.sort(key=lambda x: x.dist)

        # 判断这个点的是否进入最近点集合中
        if num == -1:
            return
        else:
            self.close_nodes = self.close_nodes[:num]

    def find_nearest_with_num(self, num=1):
        if num > self.kdtree.node_num:
            print('要找的节点数目，大于树节点的数目')
            return
        self.close_nodes = []
        k = len(self.point)
        target_point = self.point

        def travel(current):
            if not current:
                # 如果当前点是 None
                return
            axis = current.axis
            current_point = current.point
            # 选择更近的一个点
            near_point, far_point = [current.left, current.right] if target_point[axis] <= current_point[axis] else [current.right, current.left]

            travel(near_point)
            # 递归遍历回归以后
            if len(self.close_nodes) < num:
                self.add_node(current_point)
            else:
                # 检查当前节点及远边节点满不满足加入的条件
                max_dist = self.close_nodes[num - 1].dist
                # 这里算的是垂直轴的距离，如果最远点比这个垂直轴的距离还要小，那么当前点和另一边的点
                # 一定更远
                if max_dist <= abs(current_point[axis] - target_point[axis]):
                    return

                self.add_node(current_point, num)
                travel(far_point)

        # 遍历根节点
        travel(self.kdtree.root)
        return self.close_nodes


