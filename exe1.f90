!  exe1.f90 
!
!  FUNCTIONS:
!  exe1 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: exe1
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program exe1

    implicit none
    
    ! Variables
    integer :: n
    real :: yc,xc,yr,xr,vc,vr,deltv,deltt,total,t,anglec,angler,dis,dis1,xc1,yc1
    
    ! Body of exe1
    vr = 0
    vc = 5.0
    deltv = 0.001
    deltt = 0.001
    t = 0
    xc1=59.0
    yc1= 25.5
    angler = -0.5
    do while(.true.)
        xc = 0; yc = 0
        xr = 10.;yr = 50.
        t = 0
        total = sqrt(50.**2+25.**2)/vr
        do while(abs(t-total).gt.0.01)
            t = t+deltt
            anglec = (yr-yc)/(xr-xc)
            yc = vc*deltt*anglec/(sqrt(1.+anglec**2))+yc
            xc = vc*deltt/(sqrt(1.+anglec**2))+xc
            yr = vr*deltt*angler/(sqrt(1.+angler**2))+yr
            xr = vr*deltt/(sqrt(1+angler**2))+xr
            dis = sqrt((yc-yr)**2+(xc-xr)**2)
            !print*,"anglec",anglec
            !print*,"xc",xc,"yc",yc
            !print*,"xr",xr,"yr",yr
            !print*,"dis",dis
            if (xc.gt.xr) then
                exit
            endif
        enddo
        if (xc.lt.xr.and.abs(dis-1).gt.0.1) then
            print"(A,F8.3)","小孩的速度至少应为：",vr
            print"(A,A,F5.2,5x,A,F5.2)","牛的位置","y",yc,"x",xc
            pause
            exit
        endif
        vr = vr + deltv
      
    enddo
    end program exe1

