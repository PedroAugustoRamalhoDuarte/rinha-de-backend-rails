# Rinha de Backend em Rails


## TODO

- profilling (Qual parte que realmente ta gargalando?)
- Cache (Podemos cachear de alguma forma? Principalmente o saldo para não ter que fazer queries sempre?)
  - Cachear fazendo update
  - Cacher com views do psql
- Remover partes não utilizadas do rails

# Habilitar query Stats com PGhero
docker run -ti -e DATABASE_URL="postgres://rinha_de_backend:postgres@localhost/rinha_de_backend_production" -p 8080:8080 ankane/pghero
 
