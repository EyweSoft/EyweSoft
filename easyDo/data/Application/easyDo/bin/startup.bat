@echo off

%1 mshta vbscript:CreateObject("WScript.Shell").Run("%~s0 ::",0,FALSE)(window.close)&&exit
set JAVA_HOME=..\..\JDK
set CLASSPATH=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOMe%\lib\tools.jar;
set Path=%JAVA_HOME%\bin;

start "Eywe" cmd /c "java -jar ..\easyApp\easyDo.jar &"
start "Eywe Doc View" cmd /c "java -Dspring.config.location=..\config\application.properties -jar ..\easyApp\easyDoFileView.jar"

pause