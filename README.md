# Talend-multipleTableLookup
Talend Job is to Open HTTP endpoint to lookup multiple tables with `table join` in PostgreSQL database.

![alttext](./images/TalendJob.PNG?raw=true)


## Import and Build in Talend OpenStudio
This [Talend project](./POSTGRESQL_LOOKUP_MULTIPLE_TABLES) can be imported and build in Talend open studio for ESB.

![alttext](./images/ImportProject.PNG?raw=true)

## Prerequisites

### PostgreSQL database
A PostgreSQL database needs to be preconfigured. The database schema `(with sample data)` is included in [database-PostgreSQL](./database-PostgreSQL) directory.

`Sample device_model table`

![alttext](./images/postgres-DeviceModel-table.PNG?raw=true)

`Sample device_blacklist table`

![alttext](./images/postgres-DeviceBlacklist-table.PNG?raw=true)


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
Talend Job will open an HTTP endpoint which can be used to lookup both `device_model` table and `device_blackist` table  to determine whether the `service_id (service)` is blacklisted for the `device_model`.
HTTP `GET` request with `service_id` and `model_code` as a search parameters will be sent for `device_blacklist` table lookup.

`Example Request`
`http://localhost:8088/device_blacklist?service_id=2&model_code=apple%205SE`

The response will contain `device_blacklist status` for the given `service_id` and `model_code`.

## Response

### Blacklisted scenario: 
#### Status is set as true when the pair of service_id and the model_id related to the model_code is in the device_blacklist table.
`Jmeter`

![alttext](./images/Jmeter-success_response.PNG?raw=true)

### Not blacklisted scenario: 
#### Status is set as false when the aboce condition is not met.
`Jmeter`

![alttext](./images/Jmeter-unsuccess_response.PNG?raw=true)
