!  exe5.f90 
!
!  FUNCTIONS:
!  exe5 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: exe5
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program exe5

    implicit none

    ! Variables
    integer,external :: line
    integer a,b
    complex z1,z2,z3
    ! Body of exe5
    a = 7
    b = 6
    call lcmm(a,b)
    
    z1 = (1.0,1.0)
    z2 = (2.0,2.0)
    z3 = (3.0,3.0)
    print*,line(z1,z2,z3)
    pause
    end program exe5
    
    recursive integer function gcdit(a,b) result(ans)
     implicit none
     integer a,b
     if(b.eq.0) then
         ans = a
         return
     else
         ans = gcdit(b,mod(a,b))
         return 
     endif
    endfunction
    
    subroutine gcd(a,b,c)
     implicit none
     integer temp
     integer a,b,c
     do while(b.ne.0) 
         temp = mod(a,b)
         a = b
         b = temp
     enddo
     
     c = a
     return
    endsubroutine
    
    
    

   
   integer function gcdminus(a,b)
    implicit none
    integer a,b
    do while(a.ne.b)
        if (a.gt.b) then
            a = a-b
        else
            b = b-a
        endif
    enddo
    gcdminus = a
    return
   endfunction
   
  
   integer function gcdlist(a,b)
    implicit none
    integer a,b,i,t
    do i=1,a
        if(mod(a,i).eq.0 .and. mod(b,i).eq.0) then
            gcdlist = i
        endif
    enddo
    return
    endfunction
    
    
    
    
    
    
    
    
    subroutine lcmm(a,b)
     implicit none
     integer a,b,c,ta,tb,lcm
     integer,external :: gcdit,gcdminus,gcdlist
     ta = a
     tb = b
     call gcd(ta,tb,c)
     lcm = a*b/c
     print*,lcm
     ta = a
     tb = b
     c = gcdit(ta,tb)
     lcm = a*b/c
     print*,lcm
     ta = a
     tb = b
     c = gcdminus(ta,tb)
     lcm = a*b/c
     print*,lcm
     
     ta = a
     tb = b
     c = gcdlist(ta,tb)
     lcm = a*b/c
     print*,lcm
     return
    endsubroutine
    
    integer function line(z1,z2,z3)
     implicit none
     complex z1,z2,z3
     real x1,x2,x3,y1,y2,y3,k1x,k1y,k2x,k2y,v
     real,parameter :: ZERO=1e-6
     x1 = real(z1)
     y1 = imag(z1)
     x2 = real(z2)
     y2 = imag(z2)
     x3 = real(z3)
     y3 = imag(z3)
     
     k1x = x2-x1
     k1y = y2-y1
     k2x = x3-x2
     k2y = y3-y2
     
     v = k1x*k2y-k1y*k2x
     if (v.lt.ZERO) then
         line = 1
     else
         line = 0
     endif
     return
    endfunction
    
     
     