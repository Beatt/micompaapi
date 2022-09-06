# Descripción

Prueba técnica de mi compa FULLSTACK. Crear CRUD para registrar direcciones, apoyándonos de
Copomex para la ubicación, búsqueda y manejo de códigos postales, estados, municipios y colonias en México.


## Requerimientos

- Ruby v3.1.2
- PostgreSQL dev package
  - Ubuntu. `sudo apt-get install libpq-dev`
- Docker

## Tecnologías

- Rails
- Rspec
- Faraday
- Rack CORS
- Rubocop
- Husky
- Postgres
- Docker
- Copomex

## Instalación

- `git clone git@github.com:Beatt/micompaapi.git`
- `bundle install`
- `docker-compose up`
- Copiar **.env.development** y renombrar a **.env.development.local**
- Modificar **COPOMEX_TOKEN** de **.env.development.local**
- `rails s`

## Tests

`bundle exec rspec spec`

## Formatting code

`rubocop -a spec app`

_Nota. Hay casos donde la modificación se debe realizar a mano_

