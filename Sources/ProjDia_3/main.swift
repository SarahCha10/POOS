/*PROJETO DE POOS - Dia 3*/


import Foundation

// 1)Protocolo Manutenção
protocol Manutencao {
    var nomeItem: String { get }
    var historico: [String] { get }
    
    func realizarReparo(data: String, regular: Bool)
}

// 2) Equipamentos
class Equipamento: Manutencao {
    
    var nomeItem: String
    var historico: [String] = []
    var funcionando: Bool
    
    init(nomeItem: String, funcionando: Bool) {
        self.nomeItem = nomeItem
        self.funcionando = funcionando
    }
    
    func realizarReparo(data: String, regular: Bool) {
        if funcionando == false {
            print("Não foi possível fazer o reparo")
        } else {
            historico.append("Data: \(data) - Regular: \(regular)")
            print("Reparo feito")
        }
    }
}

// 3) Protocolo Aula
protocol Aula {
    var nome: String { get }
    var instrutor: String { get }
    var categoria: String { get }
    var descricao: String { get }
}

// 4) Turma Coletiva
class TurmaColetiva: Aula {
    
    var nome: String
    var instrutor: String
    var categoria: String
    var descricao: String
    
    var alunos: [String] = []
    var capacidadeMin: Int
    var capacidadeMax: Int
    
    init(nome: String, instrutor: String, categoria: String, descricao: String, capacidadeMin: Int, capacidadeMax: Int) {
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
        self.capacidadeMin = capacidadeMin
        self.capacidadeMax = capacidadeMax
    }
    
    func inscrever(aluno: String) {
        if alunos.contains(aluno) {
            print("Aluno já está na turma")
        } else if alunos.count >= capacidadeMax {
            print("Turma cheia")
        } else {
            alunos.append(aluno)
            print("Aluno inscrito")
        }
    }
}

// 5) Treino com Personal
class TreinoPersonal: Aula {
    
    var nome: String
    var instrutor: String
    var categoria: String
    var descricao: String
    
    var aluno: String?
    
    init(nome: String, instrutor: String, categoria: String, descricao: String) {
        self.nome = nome
        self.instrutor = instrutor
        self.categoria = categoria
        self.descricao = descricao
    }
    
    func adicionarAluno(nome: String) {
        if aluno == nil {
            aluno = nome
            print("Aluno adicionado")
        } else {
            print("Já existe aluno nesse treino")
        }
    }
}