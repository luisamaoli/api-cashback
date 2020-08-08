# README

Desafio Backend - Api Cashback
O objetivo do desafio é construir uma api REST que implementa o serviço responsavel por controlar o cashback dos turistas. Contexto: A Binamik é uma empresa que irá gerenciar a venda de ingressos de diversos fornecedores, similarmenta á um marketplace. Nessas vendas ela deseja oferecer ao turista um cashback, o qual pode ser utilizado em compras futuras. Devemos conseguir rastrear qual fornecedor está dando quanto de cashback, sendo a binamik uma delas. Para isso precisamos de um sistema para gerenciar as seguintes transações:

1 - receber cashback
2 - gastar cashback
3 - consulta de saldo
Requisitos:

Todas as requisições devem ter como formato application/json.
Escreva a documentação que julgar necessário para que quem use a API não tenha duvidas de seu funcionamento.
Utilize o banco de dados que considerar mais aplicável ao problema.
O desafio deve ser preferencialmente implementado utilizando Ruby on Rails, porém caso haja preferencia por outra stack poderá ser utilizada.
Bonus:
Ter autenticação de login e senha por turista
Testes unitarios
Cenario:
Fornecedor 1 - Parque Ecologico:
valor do ingresso R$100,00 cashback de 2%

Fornecedor 2 - Rio da Prata:
valor do ingresso R$200,00 cashback de 3%

Fornecedor 3 - Lagoa Misteriosa:
valor do ingresso R$150,00 cashback de 0%

Binamik:
Compras no cartão de credito geram 1% de cashback do total da compra.

Compra do Turista 1:
2 ingressos do Parque Ecologico: R$200,00. Cashback R$4,00
2 ingressos do Rio da Prata = R$400,00. Cashback R$12,00
2 ingressos da Lagoa Misteriosa = R$300,00. Cashback R$0,00
Total da compra R$900,00. Cashback da Binamik R$9,00
Total de cashback da compra R$25,00
Compra do Turista 2:
3 ingressos do Parque Ecologico = R$300,00. Cashback R$6,00
3 ingressos da Lagoa Misteriosa = R$450,00. Cashback R$0,00
Total da compra R$750,00. Cashback da Binamik R$7,50
Total de cashback da compra R$13,50
