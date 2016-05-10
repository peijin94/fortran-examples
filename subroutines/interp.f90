!*************************
!author    pjer
!date      2016-5-10
!abstract  interpolation
!*************************
	module interp
	contains 
	subroutine lag_interp(xd,yd,xi,yi)
		integer:: i,j
		real:: xd(:),yd(:)
		real:: xi,yi
		real:: li
		integer:: len
		len=size(xd)

		yi=0
		do i = 1,len
			li = 1.0
			do j = 1,len
			    if ( j/=i ) then
			    	li=li*(xi-xd(j))/(xd(i)-xd(j))
			    endif
			enddo
			yi=yi+yd(i)*li
		enddo 
	end subroutine

	end module