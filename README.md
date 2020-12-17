# Talend-singleTableLookup
Talend Job is to Open HTTP endpoint to lookup a table in PostgreSQL database.

![alttext](./images/TalendJob.PNG?raw=true)


## Import and Build in Talend OpenStudio
This [Talend project](./POSTGRESQL_LOOKUP_SINGLE_TABLE) can be imported and build in Talend open studio for ESB.

![alttext](./images/ImportProject.PNG?raw=true)

## Prerequisites

### PostgreSQL database
A PostgreSQL database needs to be preconfigured. The database schema `(with sample data)` is included in [database-PostgreSQL](./database-PostgreSQL) directory.

`Sample service_details table`

![alttext](./images/postgres-ServiceDetails-table.PNG?raw=true)


## Project configuration

Context variables needs to be configured according to the envirionment as mentioned below

| Context Variable | Description  |
--- | ---
| postgresHost | PostgreSQL database host IP| 
| postgresPort | PostgreSQL database port| 
| postgresUser | PostgreSQL database username| 
| postgresPass | PostgreSQL database password| 
| postgresDatabase | PostgreSQL database name| 

`Example Configuration`

![alttext](./images/Talend-Context-Var.PNG?raw=true)

## How it works
Talend Job will open an HTTP endpoint which can be used to lookup `service_details` table by `service_code` parameter
HTTP `GET` request with `service_code` as a search parameter will be sent for `service_details` table lookup.

`Example Request`
`http://localhost:8088/service_details?service_code=wn104`

The response will contain `service_details` table data.

## Response

### Data available scenario : Response contains all the service details
`Jmeter`

![alttext](./images/Jmeter-success_resp.PNG?raw=true)

### Data unavailable scenario: Response contains only service code.
`Jmeter`

![alttext](./images/Jmeter-unsuccess_resp.PNG?raw=true)
