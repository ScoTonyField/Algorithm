def sigmoid(X):  
    # 计算sigmoid 
    den =1.0+ e **(-1.0* X)  
    gz =1.0/ den  
    return gz  
def compute_cost(theta,X,y): 
	'''
	:param theta 学习率
	:param X 样本特征
	:param y 样本标签
	'''
    # 计算cost function
    m = X.shape[0]# 训练样本数量
    theta = reshape(theta,(len(theta),1))  
    J =(1./m)*(-transpose(y).dot(log(sigmoid(X.dot(theta))))- transpose(1-y).dot(log(1-sigmoid(X.dot(theta)))))  
    grad = transpose((1./m)*transpose(sigmoid(X.dot(theta))- y).dot(X))  
    return J[0][0]#,grad  
def compute_grad(theta, X, y):  
    # 计算梯度
    theta.shape =(1,3)  
    grad = zeros(3)  
    h = sigmoid(X.dot(theta.T))  
    delta = h - y  
    l = grad.size  
    for i in range(l):  
        sumdelta = delta.T.dot(X[:, i])  
        grad[i]=(1.0/ m)* sumdelta *-1  
    theta.shape =(3,)  
    return  grad  
def predict(theta, X):  
    m, n = X.shape  
    p = zeros(shape=(m,1))  
    h = sigmoid(X.dot(theta.T))  
    for it in range(0, h.shape[0]):  
        if h[it]>0.5:  
            p[it,0]=1  
        else:  
            p[it,0]=0  
    return p 