select substring(a.EVENT_TIME,1,8) as eventdate,substring(a.EVENT_TIME,9,6) as eventtime,
b.Node_No,substring(a.DEVICE_ID,8,2) as ecu_id,a.DOOR_NO,
a.CARD_NO,a.DOOR_POSI,a.READER_NO,a.INPUT_TYPE,a.DOOR_MODE,a.PERMIT_MODE,a.PERMIT_RESULT,a.INSERT_DATE 
from TB_ACCESS_EVENT a
inner join TB_DEVICE b
on (a.device_id = b.device_id);