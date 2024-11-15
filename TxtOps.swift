import Foundation

print("----------------------Bem-vindo ao TextCLI!-------------------------")
print("Serviços disponíveis:")
print("| 1 = Contar palavras | 2 = Buscar palavra | 3 = Substituir palavra |")

func main() {
    print("Digite o número do serviço desejado:")
    
    guard let servico = readLine(), !servico.isEmpty else {
        print("ERRO: Não foi possível ler a entrada. Por favor, digite uma opção válida.")
        return
    }

    switch servico {
    case "1":
        contarPalavras()
    case "2":
        searchWord()
    case "3":
        replaceWord()
    default:
        print("ERRO: Você deve digitar uma das opções acima!")
    }
}
main()
