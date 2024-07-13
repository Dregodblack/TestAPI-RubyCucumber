#language: pt
#utf-8

Funcionalidade: Buscar, Incluir, Alterar e Remover funcionarios

#GET
Cenario: Lista todos os funcionarios
    Dado que eu esteja logado 
    Quando eu chamo o endpoint da inmetrics
    Então eu espero o retorno dos funcionarios

#GET BY ID
Cenario: Lista de funcionario pelo ID
    Dado que eu esteja logado 
    Quando eu fizer uma busca por ID
    Então eu espero o retorno deste funcionario

#POST
Cenario: Cadastro de funcionarios
    Dado que eu esteja logado
    Quando eu preparar um body
    Então valido o retorno do cadastro

#PUT
Cenario: Alterando um funcionario 
    Dado que eu esteja logado 
    Quando eu alterar um funcionario 
    Então eu valido este funcionario alterado

#DELETE
Cenario: Deletando um funcionario
    Dado que eu esteja logado 
    Quando eu fizer um delete em um funcionario
    Então eu espero que o funcionario seja deletado