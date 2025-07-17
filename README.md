#  BOM HAMBÚRGUER - Order App (Flutter)

Este é um projeto de teste para desenvolvedores Flutter. A aplicação permite que usuários façam pedidos de sanduíches e adicionais, calculem descontos e finalizem o pedido com um pagamento fictício.

##  Funcionalidades

- Listagem de sanduíches e extras
- Adição de um sanduíche ao carrinho
- Exibição do carrinho com total do pedido
- Aplicação automática de descontos:
  - sanduiche + batata frita + refrigerante → **20%**
  - sanduiche + refrigerante → **15%**
  - sanduiche + batata frita → **10%**
- Validação: não é permitido adicionar mais de um item do mesmo tipo
- Pagamento fictício, apenas requer nome do cliente
- Armazenamento local

##  Itens disponíveis

### Sanduíches:
1. X-Burger – R$ 5,00  
2. X-Egg – R$ 4,50  
3. X-Bacon – R$ 7,00  

### Extras:
4. Batata frita – R$ 2,00  
5. Refrigerante – R$ 2,50  

## Como rodar o projeto

1. Clone o repositório:
git clone https://github.com/marysoarez/bom_hamburguer.git

2. Acesse a pasta do projeto:
cd bom_hamburguer

3. Instale as dependências:
flutter pub get

4. Rode o app:
```bash
flutter run

## Tecnologias utilizadas
Flutter
Dart
SQFlite

### Requisitos Atendidos
Listagem de Itens
Carrinho de compras com cálculo de desconto
Validações e mensagens de erro
Pagamento ficticio com nome do cliente
Persistencia local


###Projeto feito como teste técnico
Desenvolvido por Maryangela S. Soares da Silva


