!  exe2.f90 
!
!  FUNCTIONS:
!  exe2 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: exe2
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    module Student
     implicit none
     type cell
         character*10 :: id
         real*4 :: course1
         real*4 :: course2
         real*4 :: total
     endtype
     
     type treee
         real*4 :: t
         integer :: repeat
         type(treee),pointer :: left
         type(treee),pointer :: right
     endtype 
     
     
    endmodule
    
    module bin_tree
     use Student
     implicit none
     private
     type(treee),pointer :: tree,action
     integer,save :: numbers = 0
     public add,TraceTree
    contains
    
    subroutine add(t)
     implicit none 
     real,intent(in) :: t
     integer :: err
     type(treee), pointer :: newt
     integer :: level
     level = 1
     numbers = numbers+1
     allocate(newt,stat=err)
     if(err.ne.0) then
        print*,"memory attribute error"
        stop
     endif
     
     newt%repeat = 1
     newt%t = t
     nullify(newt%right,newt%left)
     if(numbers .eq.1) then
         action=>newt
         tree=>newt
         return
     endif
     
     action=>tree
     
     do while(.true.)
         level = level+1
         if(t.gt.action%t) then
             if(associated(action%right)) then
                 action=>action%right
             else
                 action%right=>newt
                 action=>newt
                 exit
             endif
         elseif(t.lt.action%t) then
             if(associated(action%left)) then
                 action=>action%left
             else
                 action%left=>newt
                 action=>newt
                 exit
             endif
         else if(abs(t-action%t).lt.0.01) then
             action%repeat = action%repeat+1
             deallocate(newt)
             return
         endif
     enddo
     return
     
    endsubroutine
    
    
    subroutine TraceTree()
     implicit none
     call show_tree(tree)
     return
    end subroutine TraceTree
    
    recursive subroutine show_tree(show)
     implicit none
     type(treee),pointer :: show
     if(associated(show)) then
         call show_tree(show%left)
         call show_data(show)
         call show_tree(show%right)
     endif
     return
    endsubroutine
    
    subroutine show_data(show)
     implicit none
     character*8 filename
     type(treee),pointer :: show
     integer ::i
     real :: temp
!     filename = "temp.txt"
!     open(10,file = filename)
!     do while(.not.eof(10))
!         read(*,*) temp
!    enddo
     
     do i=1,show%repeat
         write(*,*) show%t
     enddo
     close(10)
     return
    endsubroutine
    endmodule bin_tree
    
    
        

    
    program exe2
    use Student
    use bin_tree
    implicit none

    ! Variables
    type(cell),allocatable :: S(:)
    
    integer :: N,err,i

    ! Body of exe2
    print*,"input N:"
    read(*,*) N
    allocate(S(N),stat=err)
    if(err.ne.0) then
        print*,"memory attribute error"
        stop
    endif
    do i=1,N
        print*,"input id,course1 score,course2 score:"
        read(*,*) S(i)%id,S(i)%course1,S(i)%course2
        S(i)%total = S(i)%course1+S(i)%course2
        call add(S(i)%total)
    enddo
    
     !do i=1,N
     !   write(*,*) S(i)%id,S(i)%course1,S(i)%course2,S(i)%total
     !enddo
     
     call TraceTree()
    
    
    
    
    
    deallocate(S,stat=err)
    if(err.ne.0) then
        print*,"memory free error"
        stop
    endif
    pause
    end program exe2

