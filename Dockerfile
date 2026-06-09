FROM python:3.11-slim AS build

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

# 1) Install compiler toolchain & MySQL client headers
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      default-libmysqlclient-dev \
      pkg-config \
      libmariadb-dev \
      netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*



# 2) Copy & install Python deps (now mysqlclient can compile)
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir -r requirements.txt
  
FROM python:3.11-slim-buster

WORKDIR /app

# 3) Copy the wait-for-db script, make it executable
COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

# 4) Copy in your Django code
COPY . .

EXPOSE 8000

CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000" , "--timeout", "300", "--workers", "3"]
