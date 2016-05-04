!*************************
!author    pjer
!date      2016-5-4
!abstract  numerical integration
!*************************
	program main
		use typedef
		use integration

		interface func
			function f(x)
				use typedef
				implicit none
				real(sp) :: x
				real(sp) :: f
			end function
		end interface
		write(*,*) rect_inte(f,0.0,1.0,1000)-exp(1.)
		write(*,*) trap_inte(f,0.0,1.0,1000)-exp(1.)
		write(*,*) simp_inte(f,0.0,1.0,1000)-exp(1.)
	end program

	function f(x)
		f=1+exp(x);
	end
