	module integration
	use typedef
	contains
	function rect_inte(f,a,b,n)
	real(sp):: a,b,h,x,f
	integer i,n
	h=(b-a)/n
	rect_inte = 0;
	do i=1,n
		x=a+(i-1)*h
		rect_inte = rect_inte + f(x)*h
	end do
	end
	
	function trap_inte(f,a,b,n)
	real(sp):: a,b,h,x,xx,f
	integer i,n
	h=(b-a)/n
	trap_inte = 0;
	do i=1,n
		x=a+(i-1)*h
		xx=a+(i)*h
		trap_inte = trap_inte + (f(x)+f(xx))*h/2
	end do
	end

	function simp_inte(f,a,b,n)
	real(sp):: a,b,h,x,xx,xxx,f
	integer i,n
	h=(b-a)/n
	simp_inte = 0;
	do i=1,n
		x=a+(i-1)*h
		xx=a+i*h
		xxx=(x+xx)/2
		simp_inte = simp_inte + 1./6.*(f(x)+f(xx)+4*f(xxx))*h
	end do
	end
	end module integration