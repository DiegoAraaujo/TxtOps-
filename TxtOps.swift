import Foundation

print("----------------------Bem-vindo ao TxtOps!-------------------------")
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
        buscarpalavra()
    case "3":
        replaceWord()
    default:
        print("ERRO: Você deve digitar uma das opções acima!")
    }
}

func contarPalavras() { 
    print("Digite o caminho do arquivo:")

    guard let caminho = readLine(), !caminho.isEmpty else {
        print("ERRO: O caminho do arquivo não foi fornecido ou é inválido.")
        return
    }

    do {
        let conteudo = try String(contentsOfFile: caminho)
        let palavras = conteudo.split { $0.isWhitespace }
        print("O arquivo contém \(palavras.count) palavras.")
    } catch {
        print("Erro ao ler o arquivo: \(error.localizedDescription). Verifique o caminho.")
    }
}

func buscarPalavra() {
    print("Digite o caminho do arquivo de texto:")

    guard let caminho = readLine() else {
        print("Entrada inválida para o caminho do arquivo.")
        return
    }

    print("Digite a palavra a ser buscada:")

    guard let palavra = readLine() else {
        print("Entrada inválida para a palavra.")
        return
    }

    do {
        let conteudo = try String(contentsOfFile: caminho).lowercased()

        let palavraBusca = palavra.lowercased()

        let words = conteudo.split { $0.isWhitespace }
        let occurrences = words.filter { $0 == palavraBusca }.count

        print("A palavra '\(palavra)' aparece \(occurrences) vezes no arquivo.")
    } catch {
        print("Erro ao ler o arquivo. Verifique o caminho.")
    }
}

main()
