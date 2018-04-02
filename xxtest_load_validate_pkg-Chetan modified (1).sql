CREATE OR REPLACE PACKAGE xxtest_load_validate_pkg is
	PROCEDURE xxtest_load_data_proc;
	PROCEDURE xxtest_validate_proc;
        PROCEDURE xxtest_insert_proc;
        PROCEDURE xxtest_update_proc;
        PROCEDURE xxtest_delete_proc;
END xxtest_load_validate_pkg;

CREATE OR REPLACE PACKAGE BODY xxtest_load_validate_pkb IS

PROCEDURE xxtest_main_proc( x_errbuf               OUT      VARCHAR2
                           , x_retcode             OUT      NUMBER
                           , p_mode                IN       VARCHAR2
                          )
AS

--the if conditions should come after the begin clause

		v_ename        xxtest_person_tbl.ename%type;
	    v_enumber      xxtest_person_tbl.enumber%type;
	    v_salary       xxtest_person_tbl.salary%type;
	    v_deptid       xxtest_person_tbl.deptid%type;
	    v_refename     xxtest_person_tbl.ename%type;
	    v_refenumber   xxtest_person_tbl.enumber%type;
	    v_refsalary    xxtest_person_tbl.salary%type;
	    v_saldiff      number;
	    v_salpercent   number;

cursor CUR_MAIN (p_name in varchar2)
is 
	select ename,enumber,salary,deptid 
	from xxtest_person_tbl 
	where ename =p_name;
	
	
	   
		CURSOR CUR1_MAIN(p_name IN  VARCHAR2)
			IS 
			select 
				ename,
				enumber,
				salary from xxtest_person_tbl where salary IN (select max(salary) from xxtest_person_tbl where deptid IN (select deptid from xxtest_person_tbl where ename=p_name);
	BEGIN
	
	IF p_mode = 'LOAD' THEN

       xxtest_load_data_proc;
    
END IF;  
 
IF p_mode = 'VALIDATE' THEN

       xxtest_validate_proc;

END IF;

IF p_mode = 'INSERT' THEN

      xxtest_insert_proc();

END IF;

IF p_mode = 'UPDATE' THEN

      xxtest_update_proc();

END IF;

IF p_mode = 'DELETE' THEN

      xxtest_delete_proc();

END IF;

	OPEN cur_main;
	   fetch cur_main into v_ename,v_enumber,v_salary,v_deptid;
	CLOSE cur_main;
        OPEN cur1_main;
	   fetch cur1_main 
                INTO v_refename,v_refenumber,v_refsalary;
	CLOSE cur1_main;
	      v_saldiff := v_refsalary - v_salary;
	      v_salpercent := (v_saldiff/v_refsalary) * 100;
	   insert into xxtest_emp_custom values(v_ename,v_enumber,v_salary,v_deptid,v_refename,v_refenumber,v_refsalary,v_saldiff,v_salpercent);	
END xxtest_main_proc;
       
       
PROCEDURE xxtest_load_data_proc IS
			v_ename     Assign.ename%TYPE;
      			v_enumber   Assign.enumber%TYPE;
      			v_salary    Assign.salary%TYPE;
      			v_depid     Assign.depid%TYPE;

    		CURSOR CUR_C 
			IS 
			SELECT 
				ename,
				enumber,
				salary,
				depid 
			FROM xxtest_person_tbl;

	BEGIN

  	OPEN CUR_C;
     	LOOP
        	FETCH CUR_C 
        		INTO v_ename,v_enumber,v_salary,v_depid;
        	EXIT when CUR_C%NOTFOUND;
        	INSERT 
        		INTO XXTEST_PERSON_TBL
                          (ename,
                           empno,
                           sal,
                           deptno,
                           process_flag) 
        	VALUES
                     	(v_ename,
              		v_enumber,
              		v_salary,
              		v_depid,
              		'N');
       END LOOP;
       CLOSE CUR_C;

      END XXTEST_LOAD_DATA_PROC;

	PROCEDURE XXTEST_VALIDATE_PROC AS
		CURSOR CUR_V 
			is 
			SELECT 
				ename,	
				empno,
				sal,
				deptno,
				process_flag,
				err_msg,
				request_id 
				from XXTEST_PERSON_TBL;
        BEGIN
			FOR i IN CUR_V LOOP

				IF (i.ename is NULL) THEN 
					v_err_msg:= v_err_msg||'Employee Name Not Found '||SQLERRM;
		 			v_process_flag:='E';
				END IF;
	   			IF (i.empno is NULL) THEN
	     				v_err_msg:= v_err_msg||||'Employee Number Not Found '||SQLERRM;
		 			v_process_flag:='E';
				END IF;
	   			IF (i.sal is NULL) THEN
	     				v_err_msg:= v_err_msg||'Salary Not Found '||SQLERRM;
					v_process_flag:='E';
				END IF;
	   			IF (i.deptno is NULL) THEN
	     				v_err_msg:= v_err_msg||'Department Number Not Found '||SQLERRM;
					v_process_flag:='E';	
	  			END IF;
	 	       END LOOP;
	  	       FOR j IN CUR_V LOOP 	   -- why a different loop
     				IF (j.deptno=10 and j.sal<1500 or j.sal>2500 ) THEN
           				v_err_msg:= v_err_msg||'Salary is not allaigned'||SQLERRM;
		   			v_process_flag:='E';
		   				ELSIF(j.process_flag='E') THEN
						    else
		        			v_process_flag:='V';
     				END IF;
 
      				IF (j.deptno=20 and j.sal<1300 or j.sal>2500) THEN
            				v_err_msg:= v_err_msg||'Salary is not allaigned'||SQLERRM;
           				v_process_flag:='E';	
        			            ELSIF (v_process_flag='E') THEN
     					 	  ELSE
		        				v_process_flag:='V';	   
          			END IF;
      				IF (j.deptno=30 and j.sal<13000) THEN
           				v_err_msg:= v_err_msg||'Salary is not allaigned'||SQLERRM;
		   			v_process_flag:='E';
		   				ELSIF (j.process_flag='E')
      							else
		   						v_process_flag:='V';
      				END IF;
                       UPDATE xxtest_emp_custom 
				   SET ename  =v_ename,
			               enumber=v_enumber,
                                       salary =v_salary,
                                       deptid =v_deptid,
                                 WHERE enumber IS (select eumber from xxtest_person table where v_process_flag='V');
 

      			END LOOP;
	  END xxtest_validate_proc;
END xxtest_load_validate_pkg;


	PROCEDURE xxtest_insert_proc(
	   	p_ename       IN     xxtest_emp_custom.ename%TYPE,
	   	p_enumber     IN     xxtest_emp_custom.enumber%TYPE,
	        p_salary      IN     xxtest_emp_custom.salary%TYPE,
	   	p_deptid      IN     xxtest_emp_custom.deptid%TYPE)
                P_refename    IN     xxtest_emp_custom.refename%type;
	        p_refenumber  IN     xxtest_emp_custom.refenumber%type;
	        p_refsalary   IN     xxtest_emp_custom.refsalary%type;
	        p_saldiff     IN     xxtest_emp_custom.saldiff%type;
	        p_salpercent  IN     xxtest_emp_custom.salpercent%type;
IS
	BEGIN

  		INSERT INTO xxtest_xxtest_emp_custom("ENAME", "ENUMBER", "SALARY", "DEPTID","REFENAME","REFENUMBER","REFSALARY","REFSALDIFF","REFSALPERCENT")
  		VALUES (p_ename, p_enumber,p_salary, p_deptid,p_refename,p_refenumber,p_refsalary,p_saldiff,p_salpercent);

  	COMMIT;

END;



	PROCEDURE xxtest_update_proc(
		p_ename       IN     xxtest_emp_custom.ename%TYPE,
	        p_enumber     IN     xxtest_emp_custom.enumber%TYPE,
	        p_salary      IN     xxtest_emp_custom.salary%TYPE,
	   	p_deptid      IN     xxtest_emp_custom.deptid%TYPE)
                P_refename    IN     xxtest_emp_custom.refename%type;
	        p_refenumber  IN     xxtest_emp_custom.refenumber%type;
	        p_refsalary   IN     xxtest_emp_custom.refsalary%type;
	        p_saldiff     IN     xxtest_emp_custom.saldiff%type;
	        p_salpercent  IN     xxtest_emp_custom.salpercent%type;
     		
    
  
AS
  BEGIN
        UPDATE xxtest_xxtest_emp_custom
              SET ename      = p_ename,
                  enumber    = p_enumber,
                  salary     = P_salary,
                  deptid     = p_deptid,
                  refename   = p_refename,
                  refenumber = p_refenumber,
                  refsalary  = p_refsalary,
                  saldiff    = p_saldiff,
                  salpercent = p_salpercent;
              
       WHERE deptid = p_deptid;-- wrong, use empid
   END;

  



 PROCEDURE xxtest_delete_proc(p_enumber IN xxtest_xxtest_emp_custom.enumber%TYPE)
IS
  BEGIN

     DELETE from xxtest_xxtest_emp_custom where enumber = p_enumber;

     COMMIT;

  END;

  
