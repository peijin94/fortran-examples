!*************************
!author    pjer
!date      2016-5-4
!abstract  about prime
!*************************
    program hw_6_4

    implicit none
    integer i,j,prime,a(1:10),n
    a(1:10)=1
    do i=100,120
        do j=2,i-1
            if(prime(j)==1.and.prime(i-j)==1)then
                print*,i,"=",j,"+",i-j
                exit
            endif
        enddo
    enddo
    read(*,*),n
    call break(a,n)
    do i=1,10
        if(a(i)>1) print*,a(i)
    end do
    
    
    end program hw_6_4
    
    subroutine break(a,n)   !break subroutine
    integer n,a(1:10),i,j,prime
    j=1;i=2
    do while(i<=n) 
        if (mod(n,i)==0) then
            if(prime(i)==0) goto 10
                a(j)=i
                n=n/i
                j=j+1
       else
10            i=i+1
       end if
     enddo
    end
    
    function prime(n)    !PrimeQ function
    integer prime,i,n
    prime=0
    do i=2,n-1
        if(mod(n,i)==0) goto 10
    enddo
    prime=1
10  end    
    
    
    
    

