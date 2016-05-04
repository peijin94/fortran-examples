!  exe6.f90 
!
!  FUNCTIONS:
!  exe6 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: exe6
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program exe6

     implicit none
     character,allocatable :: ch(:)
     character*100 :: c
     integer :: i=0
     integer :: l,lenth,j,m
    open(10,file="word1.txt")
    open(11,file="word2.txt")
    open(12,file="cipher.txt")
    do while(.not.eof(10))
        read(10,"(a)") c
        l = len(trim(c))
        i = i+l
    enddo
    print*,i
    rewind(10)
    do while(.not.eof(11))
        read(11,"(a)") c
        l = len(trim(c))
        i = i+l
    enddo    
    rewind(11)
    
    print*,i
    lenth = i
    allocate(ch(i))
    i = 1
    do while(.not.eof(10))
        read(10,"(a)") c
        print*,trim(c)
        l = len(trim(c))
        m = 1
        do j=i,i+l-1
            ch(j:j)=trim(c(m:m))
            m = m+1
        enddo        
        print*,ch(i:l)
        i = i+l
        
    enddo
    do while(.not.eof(11))
        read(11,"(a)") c
        print*,trim(c)
        l = len(trim(c))
        m = 1
        do j=i,i+l-1
            ch(j:j)=trim(c(m:m))
            m = m+1
        enddo        
        print*,i
        print*,ch(i:i+l-1)
        i = i+l
    enddo
    print*,ch(1:lenth)
    close(10)
    close(11)
    call ciph(ch,lenth)
    write(12,*) ch
    
    close(12)
    
     
    !call cipher()


    
   
    ! Variables

    ! Body of exe6
    pause
    end program exe6

     subroutine ciph(ch,lenth)
     implicit none
     
     character ch(lenth)
     character c,temp   
     integer :: i=1,ascii,r=0,cc,rlenth,lenth
     character,allocatable :: chr(:),chc(:)

     do i=1,lenth
         ascii=ichar(ch(i))
         if(ascii.lt.65.or.(ascii.gt.90.and.ascii.lt.97).or.ascii.gt.122) then
             r=r+1
         endif
     enddo
     rlenth=r
     allocate(chr(rlenth))
     allocate(chc(lenth-rlenth))
     r = 1
     cc = 1
     do i=1,lenth
         ascii=ichar(ch(i))
         if(ascii.lt.65.or.(ascii.gt.90.and.ascii.lt.97).or.ascii.gt.122) then
             chr(r)=ch(i)
             r = r+1
         else
             select case(ascii)
             case(65:90)
                 ascii=77+(77-ascii)+1
                 chc(cc)= char(ascii)
             case(97:122)
                 ascii=109+(109-ascii+1)
                 chc(cc)= char(ascii)
             endselect
             cc = cc+1
         endif
     enddo
     call bubble_sort(chr,rlenth) 
     call bubble_sort(chc,lenth-rlenth)
     ch(1:(lenth-rlenth))=chc(1:(lenth-rlenth))
     ch(lenth-rlenth+1:lenth)=chr(1:rlenth)
     return
   
         
 end subroutine
    
    subroutine bubble_sort(a,n)
     implicit none
     character :: a(n),temp
     integer i,j,n
     
     do i=N-1,1,-1
         do j=1,I
             if(ichar(a(j)).gt.ichar(a(j+1))) then
                 temp=a(j)
                 a(j)=a(j+1)
                 a(j+1)=temp
             endif
         enddo
     enddo
     return
    end subroutine
    
             