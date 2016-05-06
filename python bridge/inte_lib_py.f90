	real function rect_inte(fx,a,b)
	real:: a,b,h
	integer i,n
	real:: fx(:)
	n=size(fx)
	h=(b-a)/n
	rect_inte = sum(fx)*h;
	!write(*,*) "result = ",rect
	end

	real function trap_inte(fx,a,b)
	real:: a,b,h
	integer i,n
	real:: fx(:)
	n=size(fx)
	h=(b-a)/n
	rect_inte = (sum(fx(1:n-1))+sum(fx(2:n)))*h/2;
	end

	real function simp_inte(fx,a,b)
	real:: a,b,h
	integer i,n
	real:: fx(:)
	n=size(fx)
	h=(b-a)/n
	rect_inte = (fx(1)+fx(n)+2*sum(fx(2:n-1:2))+4*sum(fx(2:n:2)))*h;
	end
