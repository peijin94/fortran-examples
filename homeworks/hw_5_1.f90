!*************************
!author    pjer
!date      2016-5-4
!abstract  score manage
!*************************
    program hw_5_1 

    implicit none
    integer::i,number,num(1:5)=0
    real::grade(1:100)
    read(*,*),number
    read(*,*),(grade(i),i=1,number)
    do i=1,number
        if(grade(i)<60)then
            num(1)=num(1)+1
        else if(grade(i)<70)then
            num(2)=num(2)+1
        else if(grade(i)<80)then
            num(3)=num(3)+1
        else if(grade(i)<90)then
            num(4)=num(4)+1
        else
            num(5)=num(5)+1
        end if
    end do
    print*,"0-59.5 ",num(1)
    print*,"60-69.5",num(2)
    print*,"70-79.5",num(3)
    print*,"80-89.5",num(4)
    print*,"90-100 ",num(5)

    end program hw_5_1

