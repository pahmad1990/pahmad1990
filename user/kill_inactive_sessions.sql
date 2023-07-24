/* create command to kil inactive sessions*/
SELECT 'alter system kill session '''||vs.sid|| ', '||vs.serial#|| ''';'
  FROM v$session vs
 WHERE vs.USERNAME = 'pahmad' -- replace with the desired username
   AND logon_time < (TRUNC (SYSDATE) + 3 / 24)-- 0300HRS
   --AND vs.STATUS = 'INACTIVE'
   AND vs.STATUS in ('INACTIVE', 'SNIPPED') ;

/* ESB inactive sessions */
SELECT COUNT (1)
  FROM v$session vs
 WHERE vs.USERNAME = 'pahmad' -- replace with the desired username
   AND logon_time < (TRUNC (SYSDATE) + 3 / 24)-- 0300HRS
   --AND vs.STATUS = 'INACTIVE'
   AND vs.STATUS in ('INACTIVE', 'SNIPPED'); 
