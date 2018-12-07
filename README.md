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

Documentação da API:
- https://documenter.getpostman.com/view/4002613/RzfiG82P

Solução:
- Utilizei JWT para fazer a autenticação da API. O usuário necessita estar logado para utilizar o crawler.
- Para utilizar o sistema o usuário deve criar sua conta e fazer a autenticação.
- Através do endpoint /api/v1/quotes/:search_tag são obtidas as quotes da primeira página do site.
- Caso a quote já tenha sido procurada ela não será salva no banco e ele retonará o resultado armazenado nele.