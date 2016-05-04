!*************************
!author    pjer
!date      2016-5-4
!abstract  sort_data
!*************************
	module sortreal
	contains
	SUBROUTINE pick_sort(arr)
	USE typedef
	IMPLICIT NONE
	REAL(SP), DIMENSION(:), INTENT(INOUT) :: arr
	INTEGER(I4B) :: i,j,n
	REAL(SP) :: a
	n=size(arr)
	do j=2,n
		a=arr(j)
		do i=j-1,1,-1
			if (arr(i) <= a) exit
			arr(i+1)=arr(i)
		end do
		arr(i+1)=a
	end do
	END SUBROUTINE pick_sort

	SUBROUTINE shell_sort(arr)
	USE typedef
	IMPLICIT NONE
	REAL(SP), DIMENSION(:), INTENT(INOUT) :: arr
	INTEGER(I4B) :: i,j,inc,n
	REAL(SP) :: v
	n=size(arr)
	inc=1
	do
		inc=3*inc+1
		if (inc > n) exit
	end do
	do
		inc=inc/3
		do i=inc+1,n
			v=arr(i)
			j=i
			do
				if (arr(j-inc) <= v) exit
				arr(j)=arr(j-inc)
				j=j-inc
				if (j <= inc) exit
			end do
			arr(j)=v
		end do
		if (inc <= 1) exit
	end do
	END SUBROUTINE shell_sort

	end module sortreal