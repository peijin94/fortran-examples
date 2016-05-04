!*************************
!author    pjer
!date      2016-5-4
!abstract  solve module
!*************************
	module zerosolve
	use typedef

	contains
	function nrec(x)
		implicit none
		real(sp) x,t,f,nrec,xx
		xx=x+1
   		do while(abs(x-xx)>=1e-6)
        	xx=(x**5-x**4+4*x**2+1)/6
        	t=xx;xx=x;x=t
    	end do
    	nrec =xx
	end function

	function cutl(f,x1,x2)
		implicit none
        real(sp) cutl,x1,x2,x,f
        if (sign(f(x1),f(x2))==f(x1)) then
        	 write(*,*) "wrong!"
        	 else
        		x=x2-f(x2)*(x2-x1)/(f(x2)-f(x1))
        		do while((abs(x2-x1)>=1e-5).and.(abs(f(x))>=1e-6))
            		if (sign(f(x1),f(x))==f(x1)) then
            		    x1=x
            		else 
            	   		x2=x
            		end if
            		x=x2-f(x2)*(x2-x1)/(f(x2)-f(x1))
        		end do
        end if
        cutl = x2;
	end function

	function bdiv(f,x1,x2)
		implicit none
        real(sp) bdiv,x1,x2,x,f
        if(sign(f(x1),f(x2))==f(x1)) then
        write(*,*) "wrong!"
        else
        x=(x1+x2)/2
        do while((abs(x2-x1)>=1e-5).and.(abs(f(x))>=1e-6))
            if (sign(f(x1),f(x))==f(x1)) then
                x1=x
            else 
                x2=x
            end if
            x=(x1+x2)/2
        end do
        end if
        bdiv=x2;
	end function

	end module zerosolve