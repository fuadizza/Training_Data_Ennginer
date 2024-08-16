FROM apache/airflow:2.7.1-python3.9

RUN pip install --upgrade pip

# Install additional Python packages if needed
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy DAGS to the appropriate directory
COPY dags/ /opt/airflow/dags/

# Set the Airflow environment variables
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False
ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor

# Entry point for running Airflow
CMD ["airflow", "db", "init"]
CMD ["airflow", "webserver"]

