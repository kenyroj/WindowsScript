@SET DEV01_SERVER=MDT-APBC-RD5-DEV01.mic.com.tw
@SET DEV02_SERVER=MDT-APBC-RD5-DEV02.mic.com.tw
@SET DEV03_SERVER=MDT-APBC-RD5-DEV03.mic.com.tw
@SET GERRIT_SERVER=MDT-GERRIT01.mic.com.tw
@SET FILE_SERVER=MDT-APBC-RD5-FILE01.mic.com.tw
@SET LOCAL_VM=192.168.56.102
@SET USERNAME=aken.hsu
@SET PASSWORD=1q2w3e4r

:: Setting for the Development server
NET USE \\%DEV01_SERVER%\ /DELETE
NET USE \\%DEV02_SERVER%\ /DELETE
NET USE \\%DEV03_SERVER%\ /DELETE

NET USE K: /delete
NET USE K: \\%DEV02_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no

NET USE U: /delete
NET USE U: \\%DEV01_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no

NET USE V: /delete
NET USE V: \\%DEV03_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the Gerrit server
NET USE \\%GERRIT_SERVER%\ /DELETE

NET USE L: /delete
NET USE L: \\%GERRIT_SERVER%\ReleaseImage /user:%USERNAME% %PASSWORD% /persistent:no

NET USE O: /delete
NET USE O: \\%GERRIT_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the File server
NET USE \\%FILE_SERVER%\ /DELETE

NET USE M: /delete
NET USE M: \\%FILE_SERVER%\bsp_server /user:%USERNAME% %PASSWORD% /persistent:no

NET USE N: /delete
NET USE N: \\%FILE_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no

NET USE S: /delete
NET USE S: \\%FILE_SERVER%\Share /user:%USERNAME% %PASSWORD% /persistent:no

::NET USE Z: /delete
::NET USE Z: "\\%LOCAL_VM%\KENyroj Home" /user:kenyroj 7410 /persistent:no

PAUSE