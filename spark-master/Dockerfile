FROM openjdk:8
ENV SPARK_VERSION 3.3.1
ENV SPARK_HOME /usr/local/share/spark
RUN curl -fL "https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop3.tgz" | tar xfz - -C /usr/local/share && \
    mv "/usr/local/share/spark-$SPARK_VERSION-bin-hadoop3" "$SPARK_HOME"
ENV PATH "$PATH:$SPARK_HOME/bin"
CMD ["sh", "-c", "/usr/local/share/spark/sbin/start-master.sh && sh -c /usr/local/share/spark/sbin/start-thriftserver.sh && tail -f /dev/null"]