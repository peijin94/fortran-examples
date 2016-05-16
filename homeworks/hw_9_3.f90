	     program main
	       use interp
	     real,allocatable :: ix(:),iy(:)
	     real:: xd(3),yd(3)

 	     data xd /1.,2.,3./
	     data yd /2.,3.,1./
 
         write(*,*) '***************'
         write(*,*) 'input num data'
         write(*,*) '***************'
         read(*,*) numdata
         write(*,*) 'input data'
	     allocate(ix(numdata))
         allocate(iy(numdata))
         read(*,*) ix
	     call lag_interp(xd,yd,ix,iy)
	     write(*,*) iy

	     end
