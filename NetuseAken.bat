@SET DEV01_SERVER=MDT-APBC-RD5-DEV01.mic.com.tw
@SET DEV02_SERVER=MDT-APBC-RD5-DEV02.mic.com.tw
@SET DEV03_SERVER=MDT-APBC-RD5-DEV03.mic.com.tw
@SET GERRIT_SERVER=MDT-GERRIT01.mic.com.tw
@SET JENKINS_SERVER=MDT-JENKINS01.mic.com.tw
@SET FILE_SERVER=MDT-APBC-RD5-FILE01.mic.com.tw
@SET TEST_SERVER=MDT-APBC-RD5-TEST01.mic.com.tw
@SET LOCAL_VM=192.168.56.105
@SET USERNAME=aken.hsu
@SET PASSWORD=1q2w3e4r
@SET MDTNAME=mdtuser
@SET MDTPASSWD=Aa122333


:: Setting for the Development server
NET USE \\%DEV01_SERVER%\ /DELETE
NET USE \\%DEV02_SERVER%\ /DELETE
NET USE \\%DEV03_SERVER%\ /DELETE

NET USE K: /delete
NET USE K: \\%DEV03_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no

NET USE U: /delete
NET USE U: \\%DEV01_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no

NET USE V: /delete
NET USE V: \\%DEV02_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the Jenkins server
NET USE \\%JENKINS_SERVER%\ /DELETE

NET USE L: /delete
NET USE L: \\%JENKINS_SERVER%\ReleaseImageRoot /user:%USERNAME% %PASSWORD% /persistent:no

NET USE O: /delete
NET USE O: \\%JENKINS_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the Gerrit server
NET USE \\%GERRIT_SERVER%\ /DELETE

::NET USE P: /delete
::NET USE P: \\%GERRIT_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no

NET USE Q: /delete
NET USE Q: \\%GERRIT_SERVER%\ReleaseImage /user:%USERNAME% %USERNAME% /persistent:no

NET USE R: /delete
NET USE R: \\%GERRIT_SERVER%\%MDTNAME% /user:%MDTNAME% %MDTPASSWD% /persistent:no

NET USE I: /delete
NET USE I: \\%GERRIT_SERVER%\ReleaseImage /user:%MDTNAME% %MDTPASSWD% /persistent:no


:: Setting for the File server
NET USE \\%FILE_SERVER%\ /DELETE
    
NET USE M: /delete
NET USE M: \\%FILE_SERVER%\bsp_server /user:%USERNAME% %PASSWORD% /persistent:no

NET USE P: /delete
NET USE P: \\%FILE_SERVER%\%USERNAME% /user:%USERNAME% %PASSWORD% /persistent:no

NET USE S: /delete
NET USE S: \\%FILE_SERVER%\Share /user:%USERNAME% %PASSWORD% /persistent:no


:: Setting for the Test server
NET USE \\%TEST_SERVER%\ /DELETE

NET USE T: /delete
NET USE T: \\%TEST_SERVER%\%MDTNAME% /user:%MDTNAME% %MDTPASSWD% /persistent:no


NET USE V: /delete
NET USE V: \\192.168.123.1\mdtuser /user:mdtuser Aa122333 /persistent:no
NET USE W: /delete
NET USE W: \\192.168.123.167\mdtadmin /user:mdtadmin 122333Aa /persistent:no
NET USE X: /delete
NET USE X: \\192.168.123.167\Public /user:mdtadmin 122333Aa /persistent:no
REM NET USE X: \\192.168.123.167\Public /user:mdtguest aabbccc /persistent:no

NET USE Y: /delete
NET USE Y: \\10.99.254.68\dqe /persistent:no


PAUSE