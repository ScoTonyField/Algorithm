# Thinking on TopK Problem

### Problem:

现在有 10 亿的数据（每个数据四个字节），请快速挑选出最大的十个数，并在小规模数据上验证算法的正确性。

#### Solution 1:

Improved QuickSort Algorithm

#### Solution 2:

- 优先队列

- 背景介绍：

  许多应用程序都需要处理有序元素，但不一定要求全部有序，或者是不一定要求一次就将它们进行排序。很多情况下我们会收集一些元素，处理当前Key-Value最大的元素，然后在收集更多的元素，再处理当前Key-Value最大的元素。

- 操作描述：

  删除最大元素和插入元素

- 