FROM flyway/flyway:10
COPY ./flyway/ /flyway/
# CMD ["flyway","migrate"]