## Machine Learning_LR

#### 1-基本介绍

逻辑回归（Logistics Regression）是经典的二分类方法，其隶属于广义线性模型，与线性回归有着莫大的关系。在分类问题里，我们的目标变量表示的是对应的类别，如0或1，即我们假设y|x服从伯努利分布。

在忽略y的取值为0或1时，套用线性回归进行建模则会导致拟合取值不一定出现在（0,1）范围内，显然，当预测值没有出现在这个范围内时，预测变没有意义。

为此我们改变一下假设函数的形式来解决这个问题。比如可以选择下面这个函数：
$$
h_\theta(x)=g(\theta^Tx)=\frac{1}{1+e^{-\theta^Tx}}
$$
其中
$$
g(z)=\frac{1}{1+e^{-z}}
$$
称为逻辑函数（Logistic Function）。

![Sigmoid 曲线](https://bkimg.cdn.bcebos.com/pic/c9fcc3cec3fdfc03f23fbf16d73f8794a5c226dc?x-bce-process=image/resize,m_lfit,w_220,h_220,limit_1)

逻辑函数相对于sign函数有更好的导数性质以及更加符合认知。
$$
\begin{align}
\hat{g}(z)&=\frac{d}{dz}\times\frac{1}{1+e^{-z}}
\\&=\frac{1}{(1+e^{-z})^2}\times e^{-z}
\\&=\frac{1}{(1+e^{-z})^2}\times (1-\frac{1}{1+e^{-z}})
\\&=g(z)(1-g(z))
\end{align}
$$

### 2-似然函数

我们令
$$
\begin{align}
P(y=1|x;\theta)&=h_\theta(x)\\
P(y=0|x;\theta)&=1-h_\theta(x)\\

\end{align}
$$
假设有m个独立的训练样本，那么就可以写出如下形式的似然函数：
$$
\begin{align}
L(\theta)&=p(\hat{y}|X;\theta)\\
&=\prod_{i=1}^{m}p(y^{(i)}|x^{(i)};\theta)\\
&=\prod_{i=1}^{m}(h_{\theta}(x^{(i)}))^{y^{i}}(1-h_{\theta}(x^{(i)}))^{1-y^{i}}
\end{align}
$$
显然求对数似然函数的最大值点更容易求得：
$$
\begin{align}
l(\theta)&=logL(\theta)\\
&=\sum_{i=1}^{m}[y^{(i)}logh(x^{(i)})+(1-y^{(i)})log(1-h(x^{(i)}))]
\end{align}
$$
怎么求对数似然函数的最大值点？跟线性回归中使用的方法类似，我们用梯度上升法。迭代的公式为
$$
\begin{align}
\theta:&=\theta+\alpha\nabla_{\theta}l(\theta)\\
\nabla_{\theta}l(\theta)&=(y\times \frac{1}{g(\theta^Tx)}-(1-y)\times \frac{1}{1-g(\theta^Tx)})\nabla_{\theta}g(\theta^Tx)\\
&=(y\times \frac{1}{g(\theta^Tx)}-(1-y)\times \frac{1}{1-g(\theta^Tx)})g(\theta^{T}x)(1-g(\theta^{T}x))\nabla_{\theta^Tx}\\
&=(y-h_{\theta}(x))x_j
\end{align}
$$
于是梯度上升的规则为：
$$
\theta_j:=\theta_j+\alpha(y^{i}-h_{\theta}(x_j^{(i)}))
$$

#### 3-总结

优点：

- 参数代表每个特征对输出的影响，可解释性强。
- 实施简单，非常高效（计算量小、存储占用低），可以在大数据场景中使用。
- 可以使用online learning的方式更新轻松更新参数，不需要重新训练整个模型。
- 解决过拟合的方法很多，如L1、L2正则化。
- L2正则化就可以解决多重共线性问题。

缺点：

- 因为它本质上是一个线性的分类器，所以处理不好特征之间相关的情况。
- 特征空间很大时，性能不好。
- 容易欠拟合，精度不高。