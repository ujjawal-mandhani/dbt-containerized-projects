FROM python:3.10 
RUN apt-get update && apt install telnet nano unixodbc -y
RUN apt --fix-broken install -y && apt install libsasl2-modules-gssapi-mit libsasl2-dev libsasl2-2 -y
RUN pip install dbt-core dbt-postgres dbt-oracle dbt-spark[thrift] dbt-spark[PyHive]
#    "dbt-spark[ODBC]" 
COPY ./dbt-project/ /home/dbt-project
COPY .dbt /root/.dbt/
WORKDIR /home/
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]