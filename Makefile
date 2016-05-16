#the compiler

FC = gfortran
FLAGS= -O2

DIR_SRC = ./homeworks
DIR_SUB = ./subroutines

SRC = $(wildcard $(DIR_SRC)/*.f90)


all : hw23 hw24 hw31 hw32 hw34 hw41 hw42

hw23 : hw_2_3.o
	$(FC) $(FLAGS) -o $@ $^
	mv hw_2_3.o ./obj/hw_2_3.o
hw_2_3.o : $(DIR_SRC)/hw_2_3.f90
	$(FC) $(FLAGS) -c $^


hw24 : hw_2_4.o
	$(FC) $(FLAGS) -o $@ $^
	mv hw_2_4.o ./obj/hw_2_4.o
hw_2_4.o : $(DIR_SRC)/hw_2_4.f90
	$(FC) $(FLAGS) -c $^

hw31 : hw_3_1.o
	$(FC) $(FLAGS) -o $@ $^
	mv hw_3_1.o ./obj/hw_3_1.o
hw_3_1.o : $(DIR_SRC)/hw_3_1.f90
	$(FC) $(FLAGS) -c $^

hw32 : hw_3_2.o
	$(FC) $(FLAGS) -o $@ $^
	mv hw_3_2.o ./obj/hw_3_2.o
hw_3_2.o : $(DIR_SRC)/hw_3_2.f90
	$(FC) $(FLAGS) -c $^

hw34 : hw_3_4.o
	$(FC) $(FLAGS) -o $@ $^
	mv hw_3_4.o ./obj/hw_3_4.o
hw_3_4.o : $(DIR_SRC)/hw_3_4.f90
	$(FC) $(FLAGS) -c $^

hw41 : typedef.o hw_4_1.o 
	$(FC) $(FLAGS) -o $@ $^
	mv hw_4_1.o ./obj/hw_4_1.o
hw_4_1.o : $(DIR_SRC)/hw_4_1.f90
	$(FC) $(FLAGS) -c $^

hw42 :  typedef.o hw_4_2.o
	$(FC) $(FLAGS) -o $@ $^
	mv hw_4_2.o ./obj/hw_4_2.o
hw_4_2.o : $(DIR_SRC)/hw_4_2.f90
	$(FC) $(FLAGS) -c $^
typedef.o : $(DIR_SUB)/typedef.f90
	$(FC) $(FLAGS) -c $^


clean:
	rm -f *.o *.mod *.MOD
	rm -f ./obj/*.o ./obj/*.mod
