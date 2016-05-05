!*************************
!author    pjer
!date      2016-5-4
!abstract  matrix calc
!*************************

	program main
		integer n,i
		real m(1:5,1:4),sum_mat(1:5),exchange_m(1:4),max_v
		integer num,index_m
		num=0
		sum_mat=0
		n=5 
		open(unit=8,file='matrix.txt')
		!read matrix from file
		read(8,*), ((m(i,j),j=1,4),i=1,5)
		do i=1,n
		write(*,*) (m(i,:))
		end do
		write(*,*) "-------------------------------------------------" 
		sum_mat=sum(m,2) !列优先，对行求和用第二求和顺序
		max_v=maxval(sum_mat)
		do i=1,n
			if (max_v .eq. sum_mat(i))  index_m = i
		end do
		exchange_m=m(index_m,:)
		m(index_m,:)=m(1,:)
		m(1,:)=exchange_m
		do i=1,n
		write(*,*) (m(i,:))
		end do
		write(*,*) "debug"
		write(*,*) ""
	end program