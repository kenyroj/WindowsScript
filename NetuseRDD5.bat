@SET DEV_SERVER=MDT-APBC-RD5-DEV01.mic.com.tw
@SET BUILD_SERVER=10.88.26.14
@SET FILE_SERVER=10.88.26.15
@SET USERNAME=YOUR_ID
@SET PASSWORD=123456

:: Setting for the Development server
NET USE \\%DEV_SERVER%\ /DELETE

NET USE K: /delete
NET USE K: \\%DEV_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the Build server
NET USE \\%BUILD_SERVER%\ /DELETE


:: Setting for the File server
NET USE \\%FILE_SERVER%\ /DELETE

NET USE L: /delete
NET USE L: \\%FILE_SERVER%\Jenkins /user:%USERNAME% %PASSWORD% /persistent:no

NET USE M: /delete
NET USE M: \\%FILE_SERVER%\bsp_server /user:%USERNAME% %PASSWORD% /persistent:no

NET USE S: /delete
NET USE S: \\%FILE_SERVER%\Share /user:%USERNAME% %PASSWORD% /persistent:no

