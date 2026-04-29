/*PROJETO DE POOS - Dia 2*/

import Foundation

// 1) Protocolo Manutenção
protocol Manutencao {
    var nomeMaquina: String { get }
    var historicoMaquina: [String] { get }

    func realizarManutencao(data: String) -> Bool
    func estaEmDia() -> Bool
}

// 2) Entidade Manutenção
class Aparelho: Manutencao {

    let nomeMaquina: String
    private(set) var historicoMaquina: [String] = []
    private let id: Int
    private(set) var estaFuncionando: Bool = true

    init(nome: String) {
        self.nomeMaquina = nome
        self.id = Int.random(in: 100...6000)
    }

    func realizarManutencao(data: String) -> Bool {
        if !estaFuncionando {
            historicoMaquina.append("Falha em \(data): máquina defeituosa")
            return false
        }
        historicoMaquina.append("Manutenção realizada em \(data)")
        return true
    }

    func estaEmDia() -> Bool {
        return estaFuncionando
    }

    func quebrar() {
        estaFuncionando = false
    }

    func consertar() {
        estaFuncionando = true
    }
}

// 3) Protocolo Aula
protocol Aula {
    var nome: String { get }
    var instrutor: String { get }
    var categoria: String { get }
    var descricao: String { get }
}

// 4) Entidade Turma Coletiva
class TurmaColetiva: Aula {

    let nome: String
    let instrutor: String
    let categoria: String
    let descricao: String

    let capacidadeMinima: Int
    let capacidadeMaxima: Int

    private(set) var alunos: [String] = []

    init(nome: String,
         instrutor: String,
         categoria: String,
         descricao: String,
         capacidadeMinima: Int,
         capacidadeMaxima: Int) {

        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
        self.capacidadeMinima = capacidadeMinima
        self.capacidadeMaxima = capacidadeMaxima
    }

    func inscreverAluno(_ aluno: String) -> Bool {
        if alunos.contains(aluno) {
            return false
        }
        if alunos.count >= capacidadeMaxima {
            return false
        }
        alunos.append(aluno)
        return true
    }

    func turmaValida() -> Bool {
        return alunos.count >= capacidadeMinima
    }
}

// 5) Treino com Personal herdada de Aula
class TreinoPersonal: Aula {

    let nome: String
    let instrutor: String
    let categoria: String
    let descricao: String

    let aluno: String
    let horario: String

    init(nome: String,
         instrutor: String,
         categoria: String,
         descricao: String,
         aluno: String,
         horario: String) {

        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
        self.aluno = aluno
        self.horario = horario
    }
}