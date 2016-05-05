!*************************
!author    pjer
!date      2016-5-4
!abstract  file insert
!*************************

program main

    implicit none
    integer::a(20)=0
    integer::i,n=0,m,x=10
    open(20,file="insert.txt")
    do while(.not.eof(20))
        n=n+1
        read(20,*) a(n)
    enddo
    do i=1,n
        if(a(i)<x) m=i+1
    end do
    rewind(20)
    write(20,"(i2)") (a(i),i=1,m-1)
    write(20,"(i2)")  x
    write(20,"(i2)") (a(i),i=m,n)
    close(20)

    end program