# Rinha de Backend em Rails

## Profiling

### Database

#### Habilitar query Stats com PGhero

docker run -it --add-host=host.docker.internal:host-gateway -e DATABASE_URL="postgres://rinha_de_backend:postgres@host.docker.internal:5432/rinha_de_backend_production" -p 8080:8080 ankane/pghero
