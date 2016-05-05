!*************************
!author    pjer
!date      2016-5-4
!abstract  hash table
!*************************
	program main
		implicit none
		integer,parameter::n=10
        complex::sourse(10)
        type ::link
            integer::num
            type(link),pointer::next
        end type link
        type(link),target::linking(n)
        type(link),pointer::proc
		real::a,b
        complex::x
        integer::i

        call random_seed()
        call InitLink()
        do i=1,10
            call random_number(a)
            call random_number(b)
            sourse(i)=cmplx(int(a*100),int(b*100))
            call insert(sourse(i),i)
            write(*,*) sourse(i)
        end do
        read(*,*) x
        call hash_search(x)
        stop


		contains
		subroutine InitLink()
            integer::i
            do i=1,n 
                linking(i)%num=0
                nullify(linking(i)%next)
            end do
        end subroutine
        
        integer function hash(x)
            complex::x
            hash=mod(int(real(x)*aimag(x)),10)+1
            return
        end function
        
        subroutine insert(x,info)
            complex::x
            integer::info,L
            L=hash(x)
            proc=>linking(L)
            do while(proc%num/=0)
                proc=>proc%next                
            end do
            proc%num=info
            allocate(proc%next)
            proc=>proc%next
            proc%num=0
            nullify(proc%next)
        end subroutine
        
        subroutine hash_search(x)
            complex::x,y
            integer::L
            L=hash(x)
            proc=>linking(L)
            do while(proc%num/=0)
                y=sourse(proc%num)
                if ((abs(real(y-x))<1e-4).and.(abs(aimag(y-x))<1e-4)) then
                    write(*,"('Sourse(',I2,')=',2F6.2)") proc%num,x
                    return
                end if
                if (associated(proc%next))proc=>proc%next
            end do
            write(*,*)"Not found",x 
            return
        end subroutine

        end program