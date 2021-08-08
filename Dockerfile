FROM python:3

# Allow statements and log messages to immediately appear in Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . .

# install dependencies
RUN pip install -r requirements.txt
RUN pip install gunicorn

# Run the web service on container startup.  We're using gunicorn
#   with one work process and 8 threads.  
# For env with multiple CPU cores, increase the number of workers
#   equal to the number of cores
# Timeout is set to 0 to disable the timeouts of the workers and allow Cloud
#   Run to handle instance scaling.

#  Command to run when the app starts
CMD exec gunicorn --bind :$PORT --workers 1  --threads 8 --timeout 0 main:app
