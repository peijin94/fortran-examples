!  exe4.f90 
!
!  FUNCTIONS:
!  exe4 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: exe4
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    
    use module ST
    integer,save :: k,ii
    
    contains
    !一维朗格朗日插值
    real*8 function f(x,xk,yk,k)
    implicit none
    real*8 x
    integer k,i,j
    real*8 xk(k),yk(k),lk(k)
    f = 0
    do i=1,k
        lk(i)=1
        do j=1,k
            if(j.ne.i) then
                lk(i)=lk(i)*(x-xk(j))/(xk(i)-xk(j))
            endif
        enddo
        f=f+yk(i)*lk(i)
    enddo
    return
    end function f
    
    endmodule
    
    program exe4
    use ST
    implicit none
    
    ! Variables
    real*8,external ::ｆ
    integer,parameter :: N=3
    ! Body of exe4
    real*8 :: x1(5,3),fk(5,3),x(:)
    
    print*,"input the dimension N and the point number per dimension:"
    read(*,*) k,N
    allocate(x(k))
    allocate(fk(k))
    allocate(x1(k,N))
                
    call NL(x,x1,fk,k,N)
       
    end program exe4
    
    
    
    
    recursive subroutine NL(x,x1,fk,k,ii)
    use ST
    implicit none
    real*8 x(k,ii),fk(k,ii),x(ii)
    integer,save::ii
    integer ::ｉ
    
    if(ii.gt.1) then
        ii = ii-1
        call NL(x,x1,fk,k,ii)
    else
        f(x,x1,fk,k)
    endif
    
   endsubroutine

    
!    program main
!    implicit none
!    integer,parameter::k0=5,n0=3
!    real,external::fu
!    integer::n,m,k,ix,iy,iz,i,j
!    !nD,第mD,k个点
!    real::r(n0),rt(n0),r0(k0,n0),f(k0**n0),lf !lf返回值,f插值点函数值
!    !X=[-0.1,0.1,0.3,0.5,0.7]
!    !Y=[-0.2,0.0,0.2,0.4,0.6]
!    !Z=[-0.3,0.0,0.3,0.6,0.9]
!    !U=sqrt(x^2+y^2+z^2)
!    !插值点(0.2,0.3,0.7), (0.4,-0.1,0.8)
!    k=5
!    n=3
!    data((r0(i,j),i=1,5),j=1,3) &
!    /-0.1,0.1,0.3,0.5,0.7,-0.2,0.0,0.2,0.4,0.6,-0.3,0.0,0.3,0.6,0.9/
!    Do iz=1,k
!        Do iy=1,k
!            Do ix=1,k
!                rt(1)=r0(ix,1)
!                rt(2)=r0(iy,2)
!                rt(3)=r0(iz,3)
!                f(ix+(iy-1)*k+(iz-1)*k*k)=fu(rt,n)
!            end do
!        end do
!    end do
!    m=n
!    data r /0.2,0.3,0.7/
!    !print *,r
!    call LagrangeND(r,r0,f,n,m,k,lf)
!    print*,lf
!    print*,sqrt(0.2**2+0.3**2+0.7**2)
!    print*,"*************************************"
!    r(1)=0.4
!    r(2)=-0.1
!    r(3)=0.8
!    !print *,r
!    call LagrangeND(r,r0,f,n,m,k,lf)
!    print*,lf    
!    print*,sqrt(0.4**2+(-0.1)**2+0.8**2)
!100 format(A3,3f7.2,A10)
!    pause
!    end
!    
!    
!    recursive subroutine LagrangeND(r,r0,f,n,m,k,lf) 
!    implicit none
!    real,external::Lagrange
!    integer::n,m,k,i,j,mt 
!    real::r(n),r0(k,n),f(k**m),lf,ft0(k) 
!    real,allocatable::ft(:)
!    if(m==1)then
!        lf=Lagrange(r(1),r0(:,1),f,k)
!        return
!    end if
!    if(m>1)then
!        mt=m-1
!        allocate(ft(k**mt))
!        do i=1,k
!            do j=1,k**mt
!                ft(j)=f(j+(i-1)*(k**mt))
!            end do
!            call LagrangeND(r,r0,ft,n,mt,k,ft0(i))
!        end do
!        lf=Lagrange(r(m),r0(:,m),ft0,k)
!        return
!        deallocate(ft)
!    end if
!    end
!    
!    
!    real function Lagrange(x,x0,f,n) 
!    implicit none
!    integer::n,i,j
!    real::x,x0(n),f(n),la(n)
!    do i=1,n
!        la(i)=f(i)
!        do j=1,i-1
!            la(i)=la(i)*(x-x0(j))/(x0(i)-x0(j))
!        end do
!        do j=i+1,n
!            la(i)=la(i)*(x-x0(j))/(x0(i)-x0(j))
!        end do
!    end do
!    Lagrange=sum(la,1)
!    end
!    
!    
!    real function fu(r,n)
!    implicit none
!    integer::n,i
!    real::r(n),r2(n)
!    do i=1,n
!        r2(i)=r(i)**2
!    end do
!    fu=sqrt(sum(r2,1))
!    end
    

    
    
    