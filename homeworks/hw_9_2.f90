!*************************
!author    pjer
!date      2016-5-4
!abstract  find zeros
!*************************

	program main
	use typedef
	use zerosolve
	implicit none

	interface func
		function f(x)
		use typedef
		real(sp):: f,x 
		end function
	end interface

	real(sp):: x,x1,x2
    x=0;x1=+0.5;x2=-0.5

    write(*,*) cutl(f,x1,x2)
    write(*,*) nrec(x)
    write(*,*) bdiv(f,x1,x2)

	end program

	function f(x)
		use typedef
    	real(sp) x,f
    	f=x**5-x**4+4*x**2-6*x+1
	end function