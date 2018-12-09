# README

Dependências: 
- Ruby 2.5.1
- Rails 5.2.1
- Mongodb

Para rodar o projeto:

- Faça o clone do projeto e entre na pasta do mesmo.
- Inicie o serviço do mongodb.
- Instale as gems com bundle install.
- Execute o projeto com rails server.
- Para rodar os testes execute o rspec com o comando 'rspec' no terminal

Documentação da API:
- https://documenter.getpostman.com/view/4002613/RzfiG82P

Solução:
- Utilizei JWT para fazer a autenticação da API. O usuário necessita estar logado para utilizar o crawler.
- Para logar é necessário criar um usuário é necessário fazer uma requisição do tipo POST (/api/v1/users) com o seguinte body:
  {
    "user": {
      "email": "denispolicarpocampos@gmail.com",
      "password": "12345678" 
    }
  }
  
 - Depois de criar o usuário é necessário obter o token de acesso através de (/api/v1/user_token). Para isso enviamos o body:
  {
    "auth": {
      "email": "denispolicarpocampos@gmail.com",
    }
  }
  
  - Na resposta da requisição um jwt será retornado. Esse código deverá ser colocado nos headers (Authorization) do JSON da requisição (/api/v1/quotes/:search_tag) para visualizar as quotes.

- Através do endpoint /api/v1/quotes/:search_tag são obtidas as quotes da primeira página do site.
- Caso a quote já tenha sido procurada ela não será salva no banco e ele retonará o resultado armazenado nele.
- A API está documentada no link acima com maiores informações de uso do sistema.
