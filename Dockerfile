From python:3.10 
RUN apt-get update && apt install telnet nano unixodbc -y
RUN apt --fix-broken install -y && apt install libsasl2-modules-gssapi-mit libsasl2-dev libsasl2-2 -y
RUN pip install dbt-core dbt-postgres dbt-oracle dbt-spark[thrift] dbt-spark[PyHive]
#    "dbt-spark[ODBC]" 
COPY ./dbt-project/ /home/dbt-project
COPY ./infinite/ /home/infinite
COPY .dbt /root/.dbt/
# RUN curl -fL "https://databricks-bi-artifacts.s3.us-east-2.amazonaws.com/simbaspark-drivers/odbc/2.7.5/SimbaSparkODBC-2.7.5.1012-Debian-64bit.zip" -o /home/SimbaSparkODBC-2.7.5.1012-Debian-64bit.zip && unzip -o /home/SimbaSparkODBC-2.7.5.1012-Debian-64bit.zip && dpkg -i simbaspark_2.7.5.1012-2_amd64.deb
CMD ["python3", "/home/infinite/infinite.py"]