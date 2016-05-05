# fortran examples
## usage
### download
命令行中输入
```bash
git clone git@github.com:Pjer-zhang/fortran-examples.git
````
或者直接在网页上下载zip程序包
### usage tip
对于依赖module的程序在程序内写use $(module_name)，编译的时候需要再次编译模块文件，命令如下
```bash
gfortran $(module_name).f90 main.f90
```
例如
```bash
gfortran ../subroutines/typedef.f90 ../subroutines/integrate.f90 hw_9_1.f90
```
## files
### homework
 - hw_2_3.f90 逻辑运算符运算
 - hw_2_4.f90 二元一次方程求解
 - hw_3_1.f90 分段函数求值
 - hw_3_2.f90 条件选择
 - hw_3_4.f90 goto语句循环
 - hw_4_1.f90 数列函数求值 (use module)
 - hw_4_2.f90 泰勒展开求sin (use module)
 - hw_5_1.f90 成绩分段统计
 - hw_5_2.f90 矩阵操作
 - hw_6_0.f90 辗转相除
 - hw_6_1.f90 三维向量叉乘
 - hw_6_2.f90 平方序列求和
 - hw_6_3.f90 e指数函数泰勒展开
 - hw_6_4.f90 素数判断 素数因素分解
 - hw_6_5.f90 求水仙数
 - hw_7_0.f90 不定方程求整数解（勾股数）
 - hw_8_2.f90 文件中顺序插入
 - hw_9_1.f90 数值积分(use module)
 - hw_9_2.f90 函数求零点(use module)

### subroutines(modules)
 - integrate.f90     积分常用函数（函数模块）
 - typedef.f90       定义类型和常数 （定义模块）
 - zerosolve.f90     函数求零点模块（函数模块）
 - sortreal.f90      排序模块（希尔排序，选择排序）