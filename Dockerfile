# Use a Windows Server Core base image compatible with Windows Server 2019
# FROM mcr.microsoft.com/windows/servercore:ltsc2019


# # Install Python (example using Chocolatey)
# RUN powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; \
#     [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
#     iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
# RUN choco install -y python

#Use a slim Python base image for smaller size
FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]



# # Use Windows Server Core LTSC 2019 as the base image
# FROM mcr.microsoft.com/windows/servercore:ltsc2019

# # Use PowerShell as default shell
# SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# # Download and install Python 3.9
# RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
#     Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.9.5/python-3.9.5-amd64.exe -OutFile python-3.9.5-amd64.exe ; \
#     Start-Process python-3.9.5-amd64.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait ; \
#     Remove-Item python-3.9.5-amd64.exe

# # Verify Python installation
# RUN python --version

# # Set the working directory

# WORKDIR /app

# # Copy application files
# COPY . /app

# # Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Set the default command
# CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


