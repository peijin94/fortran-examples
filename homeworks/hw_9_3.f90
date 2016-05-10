	    program main
	    use interp
	    real:: ix,iy
	    real:: xd(3),yd(3)

	    data xd /1.,2.,3./
	    data yd /2.,3.,1./

	    read(*,*) ix
	    call lag_interp(xd,yd,ix,iy)
	    write(*,*) iy

	    end