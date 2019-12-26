SET NAS_NAME=AKenHomeNAS
SET USER=kenyroj
SET PASSWD=lyykbfqs

NET USE L: /delete
NET USE L: "\\%NAS_NAME%\KENyrojDATA" /user:%USER% %PASSWD% /persistent:no

NET USE K: /delete
NET USE K: \\%NAS_NAME%\0.KTV /user:%USER% %PASSWD% /persistent:no

NET USE M: /delete
NET USE M: "\\%NAS_NAME%\0.Video" /user:%USER% %PASSWD% /persistent:no

NET USE P: /delete
NET USE P: "\\%NAS_NAME%\1.Album" /user:%USER% %PASSWD% /persistent:no

NET USE N: /delete
NET USE N: "\\%NAS_NAME%\2.ISOImg_App" /user:%USER% %PASSWD% /persistent:no

NET USE Q: /delete
NET USE Q: "\\%NAS_NAME%\OldShenData" /user:%USER% %PASSWD% /persistent:no

NET USE R: /delete
NET USE R: "\\%NAS_NAME%\FanChenData" /user:%USER% %PASSWD% /persistent:no
