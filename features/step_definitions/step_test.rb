#GET
Dado("que eu esteja logado") do
 @auth = {username: "inmetrics", password: "automacao"}
end

Quando("eu chamo o endpoint da inmetrics") do
    @response = HTTParty.get("https://inm-api-test.herokuapp.com/empregado/list_all", basic_auth: @auth)
end

Então("eu espero o retorno dos funcionarios") do
 expect(@response.code).to eq(200) 
end

#POST
Quando("eu preparar um body") do
    @body = {
        admissao: "07/02/1999",
        cargo: "Jogador de Futebol",
        comissao: "50.000,00",
        cpf: "065.874.598-44",
        departamentoId: 1,
        nome: "Neymar",
        salario: "4.000,00",
        sexo: "i",
        tipoContratacao: "clt"
    }.to_json

    @response = HTTParty.post("https://inm-api-test.herokuapp.com/empregado/cadastrar", basic_auth: @auth, headers: {'Content-Type' => 'application/json'}, body: @body)
end
  
Então("valido o retorno do cadastro") do
  expect(@response.code).to eq(202) 
end

#GET BY ID
Quando("eu fizer uma busca por ID") do
  step("eu preparar um body")
  @response = HTTParty.get("https://inm-api-test.herokuapp.com/empregado/list/#{@response['empregadoId']}", basic_auth: @auth)
end

Então("eu espero o retorno deste funcionario") do
  expect(@response.code).to eq(202)
end

#PUT
Quando("eu alterar um funcionario") do
  @body = {
    admissao: "07/02/1999",
    cargo: "Funcionario Alterado",
    comissao: "50.000,00",
    cpf: "065.874.598-44",
    departamentoId: 1,
    nome: "Funcionario Alterado da aula de hoje",
    salario: "4.000,00",
    sexo: "i",
    tipoContratacao: "clt"
}.to_json

  @response = HTTParty.put("https://inm-api-test.herokuapp.com/empregado/alterar/77", basic_auth: @auth, headers: {'Content-Type' => 'application/json'}, body: @body)
end

Então("eu valido este funcionario alterado") do
  expect(@response.code).to eq(202)
end

#DELETE
Quando("eu fizer um delete em um funcionario") do
  step("eu preparar um body")
  @response = HTTParty.delete("https://inm-api-test.herokuapp.com/empregado/deletar/#{@response['empregadoId']}", basic_auth: @auth)
end

Então("eu espero que o funcionario seja deletado") do
  expect(@response.code).to eq(202)
end