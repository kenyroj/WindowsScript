@ECHO OFF

SET GREP_OPT=
SET GREP_OPT=%GREP_OPT% --color=always
SET GREP_OPT=%GREP_OPT% -e irq_wakeup
SET GREP_OPT=%GREP_OPT% -e gic_show_resume_irq
SET GREP_OPT=%GREP_OPT% -e "suspend entry"
SET GREP_OPT=%GREP_OPT% -e "Suspending console(s)"

grep %GREP_OPT% %1 | grep -v deep | grep -v "TedC"
