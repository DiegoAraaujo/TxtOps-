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
        renomearPalavra()
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

        let palavras = conteudo.split { $0.isWhitespace }
        let nrepeticoes = palavras.filter { $0 == palavraBusca }.count

        print("A palavra '\(palavra)' aparece \(nrepeticoes) vezes no arquivo.")
    } catch {
        print("Erro ao ler o arquivo. Verifique o caminho.")
    }
}

func renomearPalavra() {
    print("Digite o caminho do arquivo de texto:")

    guard let caminho = readLine() else {
        print("Entrada inválida para o caminho do arquivo.")
        return
    }

    print("Digite a palavra a ser substituída:")

    guard let palavra = readLine() else {
        print("Entrada inválida para a palavra a ser substituída.")
        return
    }

    print("Digite a nova palavra:")

    guard let novaPalavra = readLine() else {
        print("Entrada inválida para a nova palavra.")
        return
    }

    do {
        let conteudo = try String(contentsOfFile: caminho)

        let novoConteudo = conteudo.replacingOccurrences(of: palavra, with: novaPalavra)

        try novoConteudo.write(toFile: caminho, atomically: true, encoding: .utf8)

        print("Todas as ocorrências de '\(palavra)' foram substituídas por '\(novaPalavra)'.")
    } catch {
        print("Erro ao processar o arquivo. Verifique o caminho.")
    }
}

main()
