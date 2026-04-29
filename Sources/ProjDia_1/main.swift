/*PROJETO DE POOS - Dia 1*/

// 1) Conjuntos Fechados
enum NivelExperiencia {
    case iniciante
    case intermediario
    case avancado
}

enum CategoriaAula {
    case musculacao
    case spinning
    case yoga
    case funcional
    case luta
}

// 2) Informações dos Planos
struct PlanoAssinatura {
    let nome: String
    let valorMensalidade: Double
    let incluirPersonal: Bool
    let limiteAulasColetivas: Int
    let duracaoMeses: Int
}

// 3) Catálogo de Planos
let catalogoPlanos: [String: PlanoAssinatura] = [
    "Mensal": PlanoAssinatura(nome: "Mensal", valorMensalidade: 189.90, 
    incluirPersonal: false, limiteAulasColetivas: 10, duracaoMeses: 1),
    "Trimestral": PlanoAssinatura(nome: "Trimestral", valorMensalidade: 159.90, 
    incluirPersonal: false, limiteAulasColetivas: 15, duracaoMeses: 3),
    "Anual": PlanoAssinatura(nome: "Anual", valorMensalidade: 129.90, 
    incluirPersonal: true, limiteAulasColetivas: 20, duracaoMeses: 12)
]

// 4) Cadastro de Indivíduos
class Pessoa {
    var nome: String
    var email: String
    var funcao: String
    
    init(nome: String, email: String, funcao: String) {
        self.nome = nome
        self.email = email
        self.funcao = funcao
    }
    
    func exibirDados() {
        print("--- Dados do Usuário ---")
        print("Nome: \(nome)")
        print("E-mail: \(email)")
        print("Função: \(funcao)")
    }
}

// 5) Entidades herdadas de Pessoas
class Aluno: Pessoa {
    var matricula: Int
    var plano: PlanoAssinatura
    var nivel: NivelExperiencia
    
    init(nome: String, email: String, matricula: Int, plano: PlanoAssinatura, nivel: NivelExperiencia) {
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel
        super.init(nome: nome, email: email, funcao: "Aluno")
    }
    
    func atualizarPlano(novoPlano: PlanoAssinatura) {
        self.plano = novoPlano
    }
    
    override func exibirDados() {
        super.exibirDados()
        print("Matrícula: \(matricula)")
        print("Plano: \(plano.nome)")
        print("Nível: \(nivel)")
    }
}

class Instrutor: Pessoa {
    var especialidade: CategoriaAula
    
    init(nome: String, email: String, especialidade: CategoriaAula) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email, funcao: "Instrutor")
    }
    
    override func exibirDados() {
        super.exibirDados()
        print("Especialidade: \(especialidade)")
    }
}