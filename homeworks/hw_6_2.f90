!*************************
!author    pjer
!date      2016-5-4
!abstract  seris sum
!*************************
    program Console10

    implicit none
    integer s
    write(*,*) "S1=",s(1,100,0)
    write(*,*) "S1=",s(1,100,5)
    end program Console10
    
    integer function s(m,n,k)
      implicit none
      integer m,n,k,i
      s=0
      do i=m,n
          s=s+(i-k)**2
      enddo
    end
        

   

