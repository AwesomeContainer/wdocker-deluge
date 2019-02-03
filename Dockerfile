# Awesome Container (Docker Windows): Deluge
# https://hub.docker.com/r/awesomecontainer/wdocker-deluge
# https://github.com/AwesomeContainer/wdocker-deluge

FROM mcr.microsoft.com/windows/servercore:1809

LABEL Description="Deluge" Vendor="Deluge" Version="1.3.13-win32-py2.7-0"
LABEL maintainer="AwesomeContainer"

EXPOSE 8112

RUN powershell -Command \
    Set-Variable -Name 'ErrorActionPreference' -Value 'Stop'; \
    Invoke-WebRequest -UseBasicParsing -Uri 'https://download.microsoft.com/download/d/d/9/dd9a82d0-52ef-40db-8dab-795376989c03/vcredist_x86.exe' -OutFile 'C:\vcredist_x86.exe'; \
    Start-Process c:\vcredist_x86.exe -ArgumentList '/q /norestart' -Wait ; \
    Invoke-WebRequest -UseBasicParsing -Uri 'http://download.deluge-torrent.org/windows/deluge-1.3.15-win32-py2.7.exe' -OutFile 'C:\deluge-installer.exe'; \
    Start-Process C:\deluge-installer.exe -ArgumentList '/S /D=C:\Deluge\' -Wait ; \
    New-Item c:\DelugeData -type directory ; \
    New-Item c:\Downloads -type directory ; \
    Remove-Item c:\vcredist_x86.exe,C:\deluge-installer.exe -Force

WORKDIR /Deluge

VOLUME c:\\DelugeData c:\\Downloads

CMD start C:\\Deluge\\deluged-debug.exe -c C:\\DelugeData && C:\\Deluge\\deluge-web.exe -c C:\\DelugeData