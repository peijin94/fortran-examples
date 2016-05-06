#/usr/bin/env python

import numpy as np
import inte  #fortran compiled module
x=np.arange(2,3,0.01)
fx=np.sin(x)*np.exp(x)
print inte.simp_inte(fx,2,3) #inte 里的 simpson 积分函数
