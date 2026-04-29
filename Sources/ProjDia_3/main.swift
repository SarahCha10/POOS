/*PROJETO DE POOS - Dia 3*/
import Foundation

class Aluno {
    var nome: String
    var email: String
    var planoPermitePersonal: Bool
    
    init(nome: String, email: String, planoPermitePersonal: Bool) {
        self.nome = nome
        self.email = email
        self.planoPermitePersonal = planoPermitePersonal
    }
}

class Instrutor {
    var nome: String
    var id: Int
    
    init(nome: String, id: Int) {
        self.nome = nome
        self.id = id
    }
}

class Equipamento {
    var nome: String
    var funcionando: Bool
    
    init(nome: String, funcionando: Bool) {
        self.nome = nome
        self.funcionando = funcionando
    }
    
    func fazerManutencao() -> Bool {
        if funcionando == false {
            return false
        }
        return true
    }
}

class Academia {
    
    private var alunos: [String: Aluno] = [:]
    private var instrutores: [Int: Instrutor] = [:]
    private var equipamentos: [String: Equipamento] = [:]
    
    func cadastrarAluno(aluno: Aluno) {
        if alunos[aluno.email] != nil {
            print("Aluno com esse email já existe")
            return
        }
        alunos[aluno.email] = aluno
        print("Aluno cadastrado com sucesso")
    }
    
    func cadastrarInstrutor(instrutor: Instrutor) {
        if instrutores[instrutor.id] != nil {
            print("Instrutor já existe")
            return
        }
        instrutores[instrutor.id] = instrutor
        print("Instrutor cadastrado")
    }
    
    func cadastrarEquipamento(equipamento: Equipamento) {
        equipamentos[equipamento.nome] = equipamento
    }
    
    func manutencaoGeral() {
        var falhas: [String] = []
        
        for (nome, equipamento) in equipamentos {
            let sucesso = equipamento.fazerManutencao()
            
            if sucesso == false {
                falhas.append(nome)
            }
        }
        
        if falhas.isEmpty {
            print("Todos os equipamentos estão OK")
        } else {
            print("Equipamentos com falha:")
            for nome in falhas {
                print(nome)
            }
        }
    }
    
    func agendarPersonal(emailAluno: String, idInstrutor: Int) {
        guard let aluno = alunos[emailAluno] else {
            print("Aluno não encontrado")
            return
        }
        
        guard let instrutor = instrutores[idInstrutor] else {
            print("Instrutor não encontrado")
            return
        }
        
        if aluno.planoPermitePersonal == false {
            print("Plano do aluno não permite personal")
            return
        }
        
        print("Agendamento realizado entre \(aluno.nome) e \(instrutor.nome)")
    }
}