!*************************
!author    pjer
!date      2016-5-4
!abstract  equation solve
!*************************
    program hw_2_4

    implicit none
    integer a,b,c
    real x,d,e
    read(*,*) a,b,c
    d=b*b-4.0*a*c
    
    if(a==0)then
        if(b==0)then
            if(c==0)then
                print*,"all number satisfy"
            else
                print*,"no number satisfy"
            end if
        else
            print*,"x=",-real(c)/b
        end if
    else
        if(d==0)then
            print *,"x1=x2=",real(-b)/(2.0*a)
        else if(d>0)then
            e=sqrt(d)
            print *,"x1=",(-b+e)/(2.0*a),"x2=",(-b-e)/(2.0*a)
        else if(d<0)then
            e=sqrt(-d)
            print *,"x1=",(-b)/(2.0*a),"+i",e/(2.0*a)
            print *,"x2=",(-b)/(2.0*a),"-i",e/(2.0*a)
        end if
    end if

    end program hw_2_4

