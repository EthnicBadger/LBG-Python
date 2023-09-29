#Use Python 3.6 as a base image
FROM python:3.11
# Copy contents into image
 COPY . .
# install pip dependencies from requirements file
 RUN pip3 install -r requirements.txt
 
#set environment veriable
ENV PORT=8080

# Create an entrypoint
ENTRYPOINT python3 lbg.py --PORT ${PORT}