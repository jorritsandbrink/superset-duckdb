# Create admin user.
docker exec -it superset-duckdb superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin

# Upgrade database to latest.
docker exec -it superset-duckdb superset db upgrade

# Setup roles.
docker exec -it superset-duckdb superset init

# Create database connection for DuckDB.
docker exec -it superset-duckdb superset set_database_uri \
    -d DuckDB-memory \
    -u duckdb:///:memory: