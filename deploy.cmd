@echo off
set INI_FILE="deploy.ini"
rem deply.iniは直接書かないとうまく動かない。%INI_FILE%と合わせること
for /f "eol=;tokens=1,2 delims==" %%i in (deploy.ini) do (
  set %%i=%%j
)
if not defined FTP_SERVER_HOST (
  echo FTP_SERVER_HOST=DUMMY > %INI_FILE%
  echo "you must to fill %INI_FILE%"
  exit
)
@call hexo clean
@call hexo gzip
"C:\Program Files (x86)\WinSCP\WinSCP.exe" %FTP_SERVER_HOST% /synchronize .\public /adminscrivener.cowcowhomes.com/
.\gdrive.exe sync upload .\source\image\ 1gMOz4dX75PRZ4E1DyHftNw7xGZOKIO3w
