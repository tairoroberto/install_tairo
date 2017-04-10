Conn / as sysdba
set feedback off
set verify off
set serveroutput on
set termout on
exec dbms_output.put_line('Starting build select of columns to be altered');
drop table semantics$
/
create table semantics$(s_owner varchar2(40),
s_table_name varchar2(40),
s_column_name varchar2(40),
s_data_type varchar2(40),
s_char_length number)
/
insert into semantics$
select C.owner, C.table_name, C.column_name, C.data_type, C.char_length
from all_tab_columns C, all_tables T
where C.owner = T.owner
and T.owner in
('SCOTT')
-- All Oracle provided users
and C.table_name = T.table_name
and C.char_used = 'B'
-- only need to look for tables who are not yet CHAR semantics.
and T.partitioned != 'YES'
-- exclude partitioned tables
and C.table_name not in (select table_name from all_external_tables)
and C.data_type in ('VARCHAR2', 'CHAR')
-- You can exclude or include tables or shema's as you wish, by adjusting
-- "and T.owner not in" as per your requirements
/
commit
/
declare
cursor c1 is select * from semantics$;
v_statement varchar2(255);
v_nc number(10);
v_nt number(10);
begin
execute immediate
'select count(*) from semantics$' into v_nc;
execute immediate
'select count(distinct s_table_name) from semantics$' into v_nt;
dbms_output.put_line
('ALTERing ' || v_nc || ' columns in ' || v_nt || ' tables');
for r1 in c1 loop
v_statement := 'ALTER TABLE ' || r1.s_owner || '.' || r1.s_table_name;
v_statement := v_statement || ' modify (' || r1.s_column_name || ' ';
v_statement := v_statement || r1.s_data_type || '(' || r1.s_char_length;
v_statement := v_statement || ' CHAR))';
execute immediate v_statement;
end loop;
dbms_output.put_line('Done');
end;
/