## dbt-containerized-projects
#### Architectural Diagram
![Architectural Diagram](./src/Architecture_diagram.png "Diagram")
### Requirements
docker, docker-compose
### Setup
```bash
docker-compose up
```
### dbt-commands
```bash
dbt compile 
dbt debug
dbt run 
dbt seed 
```
### database
#### Postgres
**Image of postgres DB**

![postgres](./src/postgres.png "postgres")
**DBT command for dbt run**

![postgres](./src/dbt_postgres.png "command")
#### Oracle
You need to create a Schema DBT_STAGING
and have to run below query to give sufficient permission
```sql
ALTER USER DBT_STAGING quota 100M on USERS;
```
**Image of oracle db**

![Oracle](./src/oracle.png "Oracle DB")
**DBT command for dbt run**

![Oracle](./src/oracle_command.png "Oracle")
#### Spark Cluster

**Note** In order to run spark cluster these below scripts must be start(these already automated in docker file)

* /usr/local/share/spark/sbin/start-master.sh
* /usr/local/share/spark/sbin/start-thriftserver.sh

Only master node is created 
with below details 
**Image of Master Spark Cluster**

![Spark Master](./src/spark.png "Spark Master")

**DBT command for dbt run**

![Spark Command](./src/spark-command.png "Spark Command")

**Image of Cluster Default Database**

![Spark Db](./src/spark-db.png "Spark Db")