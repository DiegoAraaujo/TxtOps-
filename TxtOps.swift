import Foundation

print("----------------------Bem-vindo ao TextCLI!-------------------------")
print("serviços disponíveis:")
print("| 1 = Contar palavras | 2 =  Buscar palavra | 3 = Substituir palavra |")

func main() {
    let servico = readLine() 

    if servico != nil {  
        let comando = servico!  
        switch comando {
        case "1":
            //contarPalavras()
        case "2":
            //buscarpalavras()
        case "3":
            //alterarpalavras()
        default:
            print("ERRO: Você deve digitar uma das opções acima!")
        }
    } else {
        print("ERRO: Não foi possível ler a entrada.")
    }
}

// Chamando a função principal
main()