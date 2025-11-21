FROM python:3.12-alpine

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the exporter script
COPY HAProxy-stick-tables-exporter.py .

# Expose metrics port
EXPOSE 9366

# Run the exporter
ENTRYPOINT ["python3", "HAProxy-stick-tables-exporter.py"]
CMD ["-m", "9366"]
