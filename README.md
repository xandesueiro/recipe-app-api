# 🟢 SOLUÇÃO EM DJANGO

## 🍪🥂🥩 Projeto recipe-app-api

  > Advanced REST API with Python, Django REST Framework and Docker using Test Driven Development (TDD)
  ▷ Treinamento realizado na plataforma Udemy <http://udemy.com>
  ▷ Créditos para **Mark Winterbottom / LondonAppDeveloper** - Full-Stack Software Engineer

- Projetos originais
▷ Github **recipe-app-api**: <git@github.com:LondonAppDeveloper/recipe-app-api.git>
▷ Github **recipe-app-api-proxy**: <https://gitlab.com/LondonAppDev/recipe-app-api-proxy>
  > projeto proxy é complementar ao projeto principal recipe-app-api

- Projeto pessoal
▷ Gitlab refletindo (**mirroring**) para o Github:
  - Github: <git@github.com:xandesueiro/recipe-app-api.git>
  - Github: <git@github.com:xandesueiro/recipe-app-api-proxy.git>

## Observações gerais

| Software /Linguagem / Arquivo  | Observação  |
| :---------------: |:---------------:|
| Dockerfile      | uma lista de instruções e dependências que voc~e precisará para construir uma imagem |
| docker-composer.yml   | gerencia diferentes serviços contruídos para o projeto  |
| Travis   | solução para rodar esteira CI/CD (.travis.yml) - similar ao Gitalab  |

## Configurações e execução da aplicação

- Baixe as aplicações para seu máquina

  ```shell
  git clone git@github.com:xandesueiro/recipe-app-api.git
  cd recipe-app-api
  ls -la

  cd ..
  git clone git@github.com:xandesueiro/recipe-app-api-proxy.git

  cd ../recipe-app-api

  ```

- Gere e execute o ambiente virtual

  ```shell
  #dentro do diretorio da aplicacao recipe-app-api
  python -m venv env
  pwd
  #<caminho-do-projeto>
  source <caminho-do-projeto>/env/Scripts/activate
  ```

- Instale o Django e o Django Framework

  ```shell
  #dentro do diretorio da aplicacao recipe-app-api
  cd env/Scripts/
  python.exe -m pip install --upgrade pip #garantir versão mais atualizada do Pip
  cd ../env/
  pip install django --user #--user é opcional (somente se der erro de permissionamento)
  pip install djangorestframework --user #--user é opcional (somente se der erro de permissionamento)
  django-admin --version
  ```

## Construindo as imagens docker

  ```shell
  #dentro do diretorio da aplicacao recipe-app-api
  docker build .

  cd ../recipe-app-api-proxy
  #dentro do diretorio da aplicacao recipe-app-api-proxy
  docker build -t proxy .
  ```

## Subindo tabelas do banco de dados (1a vez)

  ```shell
  #dentro do diretorio da aplicacao recipe-app-api
  cd ../recipe-app-api
  docker-compose run app sh -c "python manage.py makemigrations core"
  ```

## Rodando a aplicação

  ```shell
  #dentro do diretorio da aplicacao recipe-app-api
  docker-compose run app sh -c "python manage.py test && flake8"
  docker-compose -f docker-compose-proxy.yml up
  ```

  > Para testar **recipe-app-api**
  >> É necessário gerar um token e utilizar com o plugin Modheader do Google Chrome

- <http://localhost:8000/admin/> : testar funcionamento do app
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
