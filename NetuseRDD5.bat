@SET DEV_SERVER=MDT-APBC-RD5-DEV01.mic.com.tw
@SET GERRIT_SERVER=MDT-GERRIT01.mic.com.tw
@SET FILE_SERVER=MDT-APBC-RD5-FILE01.mic.com.tw
@SET USERNAME=YOUR_ID
@SET PASSWORD=123456

:: Setting for the Development server
NET USE \\%DEV_SERVER%\ /DELETE

NET USE K: /delete
NET USE K: \\%DEV_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the Gerrit server
NET USE \\%GERRIT_SERVER%\ /DELETE

NET USE L: /delete
NET USE L: \\%GERRIT_SERVER%\ReleaseImage /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the File server
NET USE \\%FILE_SERVER%\ /DELETE

NET USE M: /delete
NET USE M: \\%FILE_SERVER%\bsp_server /user:%USERNAME% %PASSWORD% /persistent:no

NET USE S: /delete
NET USE S: \\%FILE_SERVER%\Share /user:%USERNAME% %PASSWORD% /persistent:no

