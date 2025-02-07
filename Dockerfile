#using lightweight python image
FROM python:3.9-slim AS build
#making directory then open the directory
WORKDIR /app
#copy all the content from the current directory to app directory
COPY . /app/
#installing all the libraries inside the requirements file
RUN pip install --no-cache-dir -r requirements.txt
#specifying the running port
EXPOSE 5000
#run the container
CMD ["python", "app.py"]
