use Dec20Batch
select execquery.last_execution_time As RunDate,'Dec20Batch' as DB, execsql.text as script into #query1
from sys.dm_exec_query_stats as execquery
cross apply sys.dm_exec_sql_text(execquery.sql_handle) as execsql
where cast(execquery.last_execution_time as date)= '2023-2-21'

select DB,Script,Convert(NVARCHAR,Max(RunDate),120) RunDate
from #query1
where DB='Dec20Batch'
group by DB,script
having max(RunDate)>'2023-2-21'
order by RunDate Desc
for XML path('query'),root('queries'),elements

insert into #query1(RunDate,DB,script)
