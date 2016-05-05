!*************************
!author    pjer
!date      2016-5-5
!abstract  numerial sum
!*************************
	program main
		use typedef
		implicit none
		integer :: i,n,m
		real(sp) :: x,sum
		data sum,m /0.0,1/
		write(*,*) 'input n and x:'
		read(*,*) n,x

		do i=1,n
			m=m*i
			sum = sum + x**(i-1)/m
		enddo 

		write(*,*) '1+1/x+...+x**(n-1)/n!',sum
	end program