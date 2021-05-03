# 🟢 SOLUÇÃO EM DJANGO

## 🍪🥂🥩 Projeto recipe-app-api

  > Advanced REST API with Python, Django REST Framework and Docker using Test Driven Development (TDD)
  ==> Treinamento realizado na plataforma Udemy <http://udemy.com>
  ==> Créditos para **Mark Winterbottom / LondonAppDeveloper** - Full-Stack Software Engineer

- Projeto original
Github: <git@github.com:LondonAppDeveloper/recipe-app-api.git>

## Observações gerais

| Software /Linguagem / Arquivo  | Observação  |
| :---------------: |:---------------:|
| Dockerfile      | uma lista de instruções e dependências que voc~e precisará para construir uma imagem |
| docker-composer.yml   | gerencia diferentes serviços contruídos para o projeto  |
| Travis   | solução para rodar esteira CI/CD (.travis.yml) - similar ao Gitalab  |

## Configurações e execução da aplicação

- Baixe a aplicação para seu máquina

  ```shell
  $git clone git@github.com:xandesueiro/recipe-app-api.git
  $cd recipe-app-api
  $ls -la
  ```

- Gere e execute o ambiente virtual

  ```shell
  $python -m venv env
  $pwd
  #<caminho-do-projeto>
  $source <caminho-do-projeto>/env/Scripts/activate
  ```

- Instale o Django e o Django Framework

  ```shell
  $cd env/Scripts/
  $python.exe -m pip install --upgrade pip #garantir versão mais atualizada do Pip
  $cd ../env/
  $pip install django --user #--user é opcional (somente se der erro de permissionamento)
  $pip install djangorestframework --user #--user é opcional (somente se der erro de permissionamento)
  $django-admin --version
  ```

## Subindo tabelas do banco de dados (1a vez)

  ```shell
  $docker-compose run app sh -c "python manage.py makemigrations core"
  ```

## Rodando a aplicação

  ```shel
  $docker compose up
  $docker-compose run app sh -c "python manage.py test && flake8"
  ```

  > Para testar
  >> É necessário gerar um token e utilizar com o plugin Modheader do Google Chrome

- <http://localhost:8000/api/user/create/> : paar criar um usuario e senha
- <http://localhost:8000/api/user/token> : para gerar um token
- Authorization
- Token 8419b3f56e0e0bd373e30bc464e0fa506f1b1c85 #(exemplo)

- <http://localhost:8000/api/recipe/>

  - <http://localhost:8000/api/recipe/tags>
    - <http://localhost:8000/api/recipe/tags/?assigned_only=1> #(aparece as tags que estão ao menos em uma receita)
    - <http://localhost:8000/api/recipe/tags/?assigned_only=0> #(lista todas as tags, independente de estar associada a uma receita)

  - <http://localhost:8000/api/recipe/ingredients>
    - <http://localhost:8000/api/recipe/ingredients/?assigned_only=1> #(aparece os ingredientes que estão ao menos em uma receita)
    - <http://localhost:8000/api/recipe/ingredients/?assigned_only=0> #(lista todas os ingredientes, independente de estar associada a uma receita)

  - Testando upload de imagem
    - <http://localhost:8000/api/recipe/recipes/2/>
      - <http://localhost:8000/api/recipe/recipes/2/upload-image>
        - <http://localhost:8000/media/uploads/recipe/556525a5-2923-4866-8500-3f9b6de813a7.jpg>

## Interagindo com  container

  ```shell
  $docker ps
  $docker exec -it  recipe-app-api_db_1 sh -c "cat /etc/hostname" #sem "entrar" no container
  $docker exec -it  recipe-app-api_db_1 sh -c "ls -la" #sem "entrar" no container
  $docker exec -it recipe-app-api_db_1 bash #entrando no container
  $psql -V
  #psql -h 127.0.0.1 -U <user> -d <meubanco>
  $psql -h 127.0.0.1 -U postgres -d app
  $\dt #listar tabelas
  $\d tabela
  $SELECT * FROM tabela;
  $\q #sair
  ```
