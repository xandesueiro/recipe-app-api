# Aplicativo em Django: recipe-app-api

- Recipe app api source code - trainning python and django

## Dockerfile

- a list of instructions and dependencies you need to make up the image

## docker-composer.yml

    > docker-compose up
    > docker-compose run app sh -c "python manage.py test && flake8"

- manage different services that we make up of the project

## Iniciar ambiente local

- No diretorio o app, tem que ter instalado um ambiente virtual: /env
    > python -m venv env
- Execute:
    > pwd
    > Terá como saída o "caminho-do-diretorio"
- source "caminho-do-diretorio"/env/Scripts/activate
    > Ex: source /x/developer/code/devops/recipe-app-api/env/Scripts/activate

## Rodando a aplicação

- Subir server (1) e na sequencia fazer fazer testes na aplicação (2)
    > (1) docker-compose up
    > (2) docker-compose run app sh -c "python manage.py test && flake8"

- <http://localhost:8000/api/recipe/> :
    > http://localhost:8000/api/recipe/tags
    > http://localhost:8000/api/recipe/ingredients
    > http://localhost:8000/api/recipe/recipes
