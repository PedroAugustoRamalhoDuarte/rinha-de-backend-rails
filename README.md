# Rinha de Backend em Rails

## TODO

- profilling (Qual parte que realmente ta gargalando?)
- Cache (Podemos cachear de alguma forma? Principalmente o saldo para não ter que fazer queries sempre?)
    - Cachear fazendo update
    - Cacher com triggers do psql
- Remover partes não utilizadas do rails

## Profiling

### Database

#### Habilitar query Stats com PGhero

docker run -it --add-host=host.docker.internal:host-gateway -e DATABASE_URL="postgres://rinha_de_backend:postgres@host.docker.internal:5432/rinha_de_backend_production" -p 8080:8080 ankane/pghero
