# Use an official Python runtime as a parent image
FROM python:3.10-slim-bookworm

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Expose the port that Streamlit will run on
EXPOSE 8501
HEALTHCHECK CMD CURL --fail http://localhost:8501/_stcore/health

# Define the command to run your Streamlit app
CMD ["python", "-m", "streamlit", "run", "shuttlebot/frontend/app.py", \
"--server.port=8501", "--server.address=0.0.0.0"]