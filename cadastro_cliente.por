Algoritmo "CadastroDeCliente"
// Autor: Ismael Jorge Brandão
// Professor: Ricardo
// Objetivo: Realizar um cadastro de um cliente
// Versão 3.0
Var
    // variaveis de mexer na tela
    TELA_OPC,RGT_OPCAO,COD_RGT,i,CONT_LOOP3,CLI_DD,CLI_NUM,PASSAR,CLI_CEP: inteiro
    ENTER,OPC_CONF_CLI : caractere
    SOMA_SALAR,CLI_CPF: real
    //variaveis
    CONT,CLI_TEL,VER_REGIST,TOT_GST,TEL1,TEL2,RGT_OPCAO1: inteiro
    CLI_NOME,CLI_CDE,CLI_CARGO,CLI_UF,CLI_DT,VAL_CPF,VAL_DD,VAL_NUM,NOME_CID,VAL_CEP,VAL_SALA,VAL_TEL: caractere
    CLI_SALARIO: real
    LOOP1,LOOP2,LOOP3,LOOP_REP1: logico
    //vetor CARACTER
    NOMES_UF : vetor[1..26] de caractere
    VET_CID: vetor[1..67] de caractere
    N_CID: vetor[1..10] de caractere
    VET_NOMES: vetor[1..10] de caractere
    VET_CARGO: vetor[1..10] de caractere
    VET_UF: vetor[1..10] de caractere
    NOME_MAIUSCULO: vetor[1..30] de caractere
    VET_DT: vetor[1..10] de caractere
    // vetor INTEIRO
    // VET_DT: vetor[1..10] de inteiro
    VET_TEL: vetor[1..10] de inteiro
    // VET_DT: vetor[1..10] de inteiro
    VET_DD: vetor[1..67] de inteiro
    COD_DD: vetor [1..10] de inteiro
    VET_NUM: vetor [1..10] de inteiro
    VET_CEP :vetor[1..10] de inteiro


    //vetor REAL
    VET_SALARIO: vetor[1..10] de real
    VET_CPF: vetor[1..10] de real

procedimento Registro_Especifico(VER_REGIST:inteiro)
inicio
 // se quiser mostra so 1 registro especifico
    se (VER_REGIST <> 0) entao
        se (VET_NOMES[VER_REGIST] = "") entao
            escreval()
            escreval("=================================================================")
            escreval("*                    ATENÇÃO: CÓDIGO INVÁLIDO!                  *")
            escreval("=================================================================")
        senao
            escreval("---------------------------------------------------------------")
            escreval("================================================================")
            escreval("|COD: [",VER_REGIST,"]"," Nome..: ",VET_NOMES[VER_REGIST])
            escreval("================================================================")
            escreval("Endereço..........: Nº ",VET_NUM[VER_REGIST]," CEP: ",VET_CEP[VER_REGIST])
            escreval("Cidade............: ",N_CID[VER_REGIST]) //MUDA ESSE CID
            escreval("UF................: ",VET_UF[VER_REGIST])
            escreval("Telefone:.........:"," (",COD_DD[VER_REGIST],")",VET_TEL[VER_REGIST])
            escreval("CPF:..............: ",VET_CPF[VER_REGIST])
            escreval("Data de Nascimento: ",VET_DT[VER_REGIST])
            escreval("Cargo.............: ",VET_CARGO[VER_REGIST])
            escreval("Sálario...........: R$ ",VET_SALARIO[VER_REGIST])
            escreval("----------------------------------------------------------------")
        fimse
    senao
        escreval()
        escreval("=================================================================")
        escreval("*                    ATENÇÃO: CÓDIGO INVÁLIDO!                  *")
        escreval("=================================================================")
    fimse
fimprocedimento

// Todos os registros cadastrados
procedimento Total_Registro(TOTAL,TOT_GT: inteiro)
inicio


    limpatela
        // Mostrar na tela
        escreval("-----------------------------------------------------------------")
        escreval("                      TODOS OS REGISTROS")
        escreval("-----------------------------------------------------------------")
        escreval("Total de registros: ",TOT_GT)
        para i <- 1 ate TOTAL faca
            se (VET_NOMES[i] <> "") entao
                escreval("===============================================================")
                escreval("COD [",i, " ]"," Nome...: ",VET_NOMES[i])
                escreval("===============================================================")
                escreval("Endereço..........: Nº ",VET_NUM[i]," CEP: ",VET_CEP[i])
                escreval("UF................: ",VET_UF[i])
                escreval("Cidade............: ",N_CID[i])
                escreval("Telefone:.........: ","(",COD_DD[i]," )",VET_TEL[i])
                escreval("CPF:..............:",VET_CPF[i])
                escreval("Data de Nascimento: ",VET_DT[i])
                escreval("Cargo.............: ",VET_CARGO[i])
                escreval("Sálario...........: R$",VET_SALARIO[i])
                escreval("---------------------------------------------------------------")
            fimse
        fimpara
       se (TOT_GST = 0) entao
           escreval("=================================================================")
           escreval("                     Não há registro aqui  ")
           escreval("=================================================================")
       fimse
fimprocedimento


// Função caractere

funcao  valNome(val_nome: caractere): logico
inicio
    se compr(val_nome) <= 10 entao
        retorne verdadeiro
    senao
        retorne falso
    fimse

fimfuncao

// Função UF

funcao val_uf(uf: caractere): logico
var
   i: inteiro
inicio
    para i <- 1 ate 26 faca
        se uf = NOMES_UF[i] entao
            retorne verdadeiro
        fimse
    fimpara
fimfuncao

// Função data
funcao val_data(x: caractere): caractere
var
dia, mes, ano, idade ,ANO_BISSEXTO: inteiro
inicio

    dia <- caracpnum(copia(x,1,2))
    mes <- caracpnum(copia(x,4,2))
    ano <- caracpnum(copia(x,7,4))

    idade  <- 2025 - ano

    se idade > 90 entao
        retorne  "Idade inválida: o limite máximo permitido é de 90 anos."
    senao
        se idade < 18 entao
            retorne  "Idade inválida: é necessário ter pelo menos 18 anos."
	    fimse
    fimse
    se (mes = 1) e (dia > 0) e (dia <= 31) e (ano > 0) entao
        retorne "Data valida"
    senao
       se (mes = 2) e (dia > 0) e (dia <= 29)  e (ano > 0) entao
            ANO_BISSEXTO <- ano % 4
            se (ANO_BISSEXTO <> 0) e (dia = 29) entao
                retorne "Data Invalida"
            senao
                retorne "Data valida"
            fimse
        senao
            se (mes = 3) e (dia > 0) e (dia <= 31) e (ano > 0) entao
                retorne "Data valida"
            senao
                se (mes = 4) e (dia > 0) e (dia <= 30) e (ano > 0) entao
                    retorne "Data valida"
                senao
                    se (mes = 5) e (dia > 0) e (dia <= 31) e (ano > 0) entao
                        retorne "Data valida"
                    senao
                        se (mes = 6) e (dia > 0) e (dia <= 30)  e (ano > 0) entao
                            retorne "Data valida"
                        senao
                            se (mes = 7) e (dia > 0) e (dia <= 31) e (ano > 0) entao
                                retorne "Data valida"
                            senao
                                se (mes = 8) e (dia > 0) e (dia <= 31) e (ano > 0) entao
                                    retorne "Data valida"
                                senao
                                    se (mes = 9) e (dia > 0) e (dia <= 30) e (ano > 0) entao
                                        retorne "Data valida"
                                    senao
                                        se (mes = 10) e (dia > 0) e (dia <= 31) e (ano > 0) entao
                                            retorne "Data valida"
                                        senao
                                            se (mes = 11) e (dia > 0) e (dia <= 30) e (ano > 0) entao
                                                retorne "Data valida"
                                            senao
                                                se (mes = 12) e (dia > 0) e (dia <= 31) e (ano > 0) entao
                                                    retorne "Data valida"
                                                senao
                                                    retorne "Data invalida"
                                                fimse
                                            fimse
                                        fimse
                                    fimse
                                fimse
                            fimse
                        fimse
                    fimse
                fimse
            fimse
        fimse
    fimse

fimfuncao


// TELA INICIAL 1 TELA
procedimento Tela1()
inicio
        escreval("=================================================================")
        escreval("                SISTEMAS DE CADASTRO DE CLIENTES")
        escreval("=================================================================")
        escreval("[1] Ver Registros de Clientes")
        escreval("[2] Adicionar Novo Cliente")
        escreval("[3] Sair do Sistema")
        escreval("=================================================================")
fimprocedimento

// Deixar a primeira Letra Maiuscula
funcao letras_Maiusculas(NOME:caractere): caractere
var
    I,ESPACO: inteiro
    NOME2: caractere
inicio
    ESPACO <- 0
    para I <- 1 ate compr(NOME) faca
        // Vai deixar uma letra Maiuscula se espaço for 0
        se espaco = 0 entao
            NOME_MAIUSCULO[I] <- copia(NOME,I,1))
        senao
            NOME_MAIUSCULO[I] <- maiusc(copia(NOME,I,1))
            ESPACO <- ESPACO - 1
        fimse
        // aqui e no começo da palavra
        se I = 1 entao
            NOME_MAIUSCULO[I] <- maiusc(copia(NOME,i,1))
        fimse
        se NOME_MAIUSCULO[I] = " " entao
            ESPACO <- ESPACO + 1
        fimse
        I <- I + 1
    fimpara
    NOME2 <- ""
    para I <- 1 ate compr(NOME) faca
        NOME2 <- NOME2 + NOME_MAIUSCULO[I]
    fimpara
    retorne NOME2
fimfuncao

// VALIDAÇÃO DE CPF

funcao ValidaCPF(CPF: caractere): logico
var
    NUM1 ,NUM2, NUM3 ,NUM4,NUM5 ,NUM6 ,NUM7 ,NUM8 ,NUM9 ,NUM10 ,NUM11 : inteiro
    RESULTADO1,RESULTADO2 ,DIGITO1, DIGITO2: inteiro
inicio

    NUM1 <-  caracpnum(copia(CPF,1,1))
    NUM2 <-  caracpnum(copia(CPF,2,1))
    NUM3 <-  caracpnum(copia(CPF,3,1))
    NUM4 <-  caracpnum(copia(CPF,4,1))
    NUM5 <-  caracpnum(copia(CPF,5,1))
    NUM6 <-  caracpnum(copia(CPF,6,1))
    NUM7 <-  caracpnum(copia(CPF,7,1))
    NUM8 <-  caracpnum(copia(CPF,8,1))
    NUM9 <-  caracpnum(copia(CPF,9,1))
    NUM10 <- caracpnum(copia(CPF,10,1))
    NUM11 <- caracpnum(copia(CPF,11,1))
    // VALIDAÇÃO DIGITO 1
    RESULTADO1 <-  NUM1*10 + NUM2*9 + NUM3*8 + NUM4*7 + NUM5*6 + NUM6*5 + NUM7*4 + NUM8*3 + NUM9*2
    DIGITO1 <- (RESULTADO1 * 10) % 11

    // VALIDAÇÃO DIGITO 2
    RESULTADO2 <-  NUM1*11  + NUM2*10 + NUM3*9 + NUM4*8 + NUM5*7 + NUM6*6 + NUM7*5 + NUM8*4 + NUM9*3 + NUM10*2
    DIGITO2 <- (RESULTADO2 * 10) % 11


    se (DIGITO1 = NUM10) e (DIGITO2 = NUM11) entao
        retorne verdadeiro
    senao
        retorne falso
    fimse

fimfuncao





// INICIO DO PROGRAMA
inicio
    // NOMES UF ------
    NOMES_UF[1] <- "AC"
    NOMES_UF[2] <- "AL"
    NOMES_UF[3] <- "AP"
    NOMES_UF[4] <- "AM"
    NOMES_UF[5] <- "BA"
    NOMES_UF[6] <- "CE"
    NOMES_UF[7] <- "DF"
    NOMES_UF[8] <- "ES"
    NOMES_UF[9] <- "GO"
    NOMES_UF[10] <- "MA"
    NOMES_UF[11] <- "MT"
    NOMES_UF[12] <- "MS"
    NOMES_UF[13] <- "MG"
    NOMES_UF[14] <- "PA"
    NOMES_UF[15] <- "PB"
    NOMES_UF[16] <- "PR"
    NOMES_UF[17] <- "PE"
    NOMES_UF[18] <- "PI"
    NOMES_UF[19] <- "RJ"
    NOMES_UF[20] <- "RS"
    NOMES_UF[21] <- "RO"
    NOMES_UF[22] <- "RR"
    NOMES_UF[23] <- "SC"
    NOMES_UF[24] <- "SP"
    NOMES_UF[25] <- "SE"
    NOMES_UF[26] <- "TO"
    // ---------------
    // NÚMERO DD
    VET_DD[1]  <- 11
    VET_DD[2]  <- 12
    VET_DD[3]  <- 13
    VET_DD[4]  <- 14
    VET_DD[5]  <- 15
    VET_DD[6]  <- 16
    VET_DD[7]  <- 17
    VET_DD[8]  <- 18
    VET_DD[9]  <- 19
    VET_DD[10] <- 21
    VET_DD[11] <- 22
    VET_DD[12] <- 24
    VET_DD[13] <- 27
    VET_DD[14] <- 28
    VET_DD[15] <- 31
    VET_DD[16] <- 32
    VET_DD[17] <- 33
    VET_DD[18] <- 34
    VET_DD[19] <- 35
    VET_DD[20] <- 37
    VET_DD[21] <- 38
    VET_DD[22] <- 41
    VET_DD[23] <- 42
    VET_DD[24] <- 43
    VET_DD[25] <- 44
    VET_DD[26] <- 45
    VET_DD[27] <- 46
    VET_DD[28] <- 47
    VET_DD[29] <- 48
    VET_DD[30] <- 49
    VET_DD[31] <- 51
    VET_DD[32] <- 53
    VET_DD[33] <- 54
    VET_DD[34] <- 55
    VET_DD[35] <- 61
    VET_DD[36] <- 62
    VET_DD[37] <- 63
    VET_DD[38] <- 64
    VET_DD[39] <- 65
    VET_DD[40] <- 66
    VET_DD[41] <- 67
    VET_DD[42] <- 68
    VET_DD[43] <- 69
    VET_DD[44] <- 71
    VET_DD[45] <- 73
    VET_DD[46] <- 74
    VET_DD[47] <- 75
    VET_DD[48] <- 77
    VET_DD[49] <- 79
    VET_DD[50] <- 81
    VET_DD[51] <- 82
    VET_DD[52] <- 83
    VET_DD[53] <- 84
    VET_DD[54] <- 85
    VET_DD[55] <- 86
    VET_DD[56] <- 87
    VET_DD[57] <- 88
    VET_DD[58] <- 89
    VET_DD[59] <- 91
    VET_DD[60] <- 92
    VET_DD[61] <- 93
    VET_DD[62] <- 94
    VET_DD[63] <- 95
    VET_DD[64] <- 96
    VET_DD[65] <- 97
    VET_DD[66] <- 98
    VET_DD[67] <- 99

// CIDADE
   VET_CID[1]  <- "São Paulo "
    VET_CID[2]  <- "Vale do Paraíba, Litoral Norte de SP"
    VET_CID[3]  <- "Baixada Santista, Litoral Sul de SP"
    VET_CID[4]  <- "Bauru, Marília, São José do Rio Preto"
    VET_CID[5]  <- "Sorocaba, Registro, Itapetininga"
    VET_CID[6]  <- "Ribeirão Preto, Araraquara, Franca"
    VET_CID[7]  <- "São José do Rio Preto, Catanduva, Barretos"
    VET_CID[8]  <- "Presidente Prudente, Araçatuba, Bauru"
    VET_CID[9]  <- "Campinas, Piracicaba, Limeira"
    VET_CID[10] <- "Rio de Janeiro "
    VET_CID[11] <- "Campos dos Goytacazes, Norte Fluminense"
    VET_CID[12] <- "Volta Redonda, Sul Fluminense"
    VET_CID[13] <- "Espírito Santo "
    VET_CID[14] <- "Sul do Espírito Santo"
    VET_CID[15] <- "Belo Horizonte e região metropolitana"
    VET_CID[16] <- "Zona da Mata e Vale do Rio Doce"
    VET_CID[17] <- "Vale do Rio Doce e Jequitinhonha"
    VET_CID[18] <- "Triângulo Mineiro e Alto Paranaíba"
    VET_CID[19] <- "Sul de Minas"
    VET_CID[20] <- "Oeste de Minas"
    VET_CID[21] <- "Norte de Minas"
    VET_CID[22] <- "Curitiba e região metropolitana"
    VET_CID[23] <- "Centro-Sul do Paraná"
    VET_CID[24] <- "Norte do Paraná"
    VET_CID[25] <- "Noroeste do Paraná"
    VET_CID[26] <- "Oeste do Paraná"
    VET_CID[27] <- "Sudoeste do Paraná"
    VET_CID[28] <- "Norte de Santa Catarina"
    VET_CID[29] <- "Florianópolis e Sul de SC"
    VET_CID[30] <- "Oeste de SC"
    VET_CID[31] <- "Porto Alegre e região metropolitana"
    VET_CID[32] <- "Sul do RS"
    VET_CID[33] <- "Norte do RS"
    VET_CID[34] <- "Oeste do RS"
    VET_CID[35] <- "Distrito Federal (Brasília)"
    VET_CID[36] <- "Goiânia e entorno"
    VET_CID[37] <- "Tocantins (Palmas e região)"
    VET_CID[38] <- "Sudoeste de Goiás"
    VET_CID[39] <- "Cuiabá e região"
    VET_CID[40] <- "Centro-Norte de MT"
    VET_CID[41] <- "Mato Grosso do Sul"
    VET_CID[42] <- "Acre"
    VET_CID[43] <- "Rondônia"
    VET_CID[44] <- "Salvador e região metropolitana"
    VET_CID[45] <- "Sul da Bahia"
    VET_CID[46] <- "Norte da Bahia"
    VET_CID[47] <- "Recôncavo e litoral norte da Bahia"
    VET_CID[48] <- "Oeste da Bahia"
    VET_CID[49] <- "Sergipe"
    VET_CID[50] <- "Recife e região metropolitana"
    VET_CID[51] <- "Alagoas"
    VET_CID[52] <- "Paraíba"
    VET_CID[53] <- "Rio Grande do Norte"
    VET_CID[54] <- "Fortaleza e entorno"
    VET_CID[55] <- "Piauí (Sul e Centro)"
    VET_CID[56] <- "Sertão de Pernambuco"
    VET_CID[57] <- "Ceará (interior)"
    VET_CID[58] <- "Piauí (Norte)"
    VET_CID[59] <- "Belém e região metropolitana"
    VET_CID[60] <- "Manaus e região"
    VET_CID[61] <- "Oeste do Pará"
    VET_CID[62] <- "Sudeste do Pará"
    VET_CID[63] <- "Roraima"
    VET_CID[64] <- "Amapá"
    VET_CID[65] <- "Oeste do Amazonas"
    VET_CID[66] <- "Maranhão (Sul)"
    VET_CID[67] <- "Maranhão (Norte e Oeste)"

    //---------
    TOT_GST <- 0
    CONT <- 1
    LOOP1 <- verdadeiro

    enquanto (LOOP1 = verdadeiro) faca
        limpatela
        // 1 tela
        Tela1()
        escreva("Digite a Opção Desejada: ")
        leia(TELA_OPC)
        // Vou colocar pra ver os registros aqui
        se (TELA_OPC = 1)  entao
            //mostrar registro
            LOOP3 <- verdadeiro
            enquanto LOOP3 =  verdadeiro faca
                limpatela
                escreval("==================================================================")
                escreval("                       REGISTRO DO CLIENTE")
                escreval("==================================================================")

                escreval()
                escreval("[1] Todos Registros [2] Registro Especifico [3] Voltar ao Menu")
                escreval()
                escreval("==================================================================")
                escreva("Digite a Opção Desejada: ")
                leia(RGT_OPCAO)
                se (RGT_OPCAO = 1) entao
                    Total_Registro(CONT,TOT_GST)
                    escreva("Aperte 'ENTER' Para continuar >>> ")
                    leia(ENTER)
                senao
                    se (RGT_OPCAO = 2) entao
                        limpatela
                        escreval("=================================================================")
                        escreval("*                      CONSULTAR REGISTRO                       *")
                        escreval("=================================================================")
                        escreval("||                                                             ||")
                        escreval()
                        escreva("Digite o código do registro desejado: ")
                        leia(RGT_OPCAO1)
                        Registro_Especifico(RGT_OPCAO1)
                        escreva("Aperte Enter para continuar >>> ")
                        leia(ENTER)
                    senao
                        se (RGT_OPCAO = 3) entao
                            LOOP3 <- falso
                            limpatela
                        senao

                            limpatela
                            escreval("----------------------------------------------------------------")
                            escreval("|                                                              |")
                            escreval("|                                                              |")
                            escreval("|                                                              |")
                            escreval("|                                                              |")
                            escreval("|               DIGITE APENAS NÚMEROS DE 1 A 3                 |")
                            escreval("|                                                              |")
                            escreval("|                                                              |")
                            escreval("|                                                              |")
                            escreval("|                                                              |")
                            escreval("----------------------------------------------------------------")
                            escreva("Aperte enter para continuar >>> ")
                            leia(ENTER)
                        fimse
                    fimse
                fimse
            fimenquanto
        senao
            se (TELA_OPC = 2) entao
            // . Adicionar ao cliente uma opção de saida.
                limpatela
                escreval("==============================================================")
                escreval("||                   CADASTRO DE USUÁRIO                   ||")
                escreval("==============================================================")
                escreval("Para voltar ao menu, digite: SAIR")
                escreval("==============================================================")
                LOOP3 <- verdadeiro
                LOOP_REP1 <- verdadeiro

                enquanto LOOP_REP1 = verdadeiro faca
                    escreval("Codigo do Cliente.: ", CONT)
                    enquanto LOOP3 = verdadeiro faca
                        escreva("Nome completo...............: ")
                        leia(CLI_NOME)
                        se compr(CLI_NOME) = 0 entao
                            escreval("Preencha este campo.")
                        senao
                            se ((CLI_NOME) = "Sair") ou ((CLI_NOME) = "sair") ou ((CLI_NOME) = "SAIR")  entao
                                LOOP_REP1 <- falso
                                LOOP3 <- falso
                            senao
                                se valNome(CLI_NOME) = verdadeiro entao
                                    escreval("Nome inválido: Muito curto.")
                                senao
                                    CLI_NOME <- letras_Maiusculas(CLI_NOME)
                                    LOOP3 <- falso
                                fimse
                            fimse
                        fimse
                    fimenquanto
                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    // CEP
                    enquanto LOOP3 = verdadeiro faca
                        escreva("CEP.........................: ")
                        leia(VAL_CEP)
                        se ((VAL_CEP) = "Sair") ou ((VAL_CEP) = "sair") ou ((VAL_CEP) = "SAIR")  entao
                            LOOP_REP1 <- falso
                            LOOP3 <- falso
                        fimse
                        se compr(VAL_CEP) = 8 entao
                            PASSAR <- 0
                            CLI_CEP <- caracpnum(VAL_CEP)
                            PASSAR <- PASSAR + CLI_CEP
                            se PASSAR <> 0 entao
                                // CLI_CEP <- caracpnum(VAL_CEP)
                                LOOP3 <- falso
                            senao 
                                escreval("CEP inválido: digite apenas números.")
                            fimse

                        senao
                            se compr(VAL_CEP) > 8 entao
                                escreval("CEP inválido: número muito grande, digite os 8 dígitos.")
                            senao
                                escreval("CEP inválido: número muito pequeno, digite os 8 dígitos.")
                            fimse
                        fimse

                    fimenquanto
                   
                     se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    enquanto LOOP3 = verdadeiro faca
                        escreva("Número......................: ")
                        leia(VAL_NUM)
                        se ((VAL_NUM) = "Sair") ou ((VAL_NUM) = "sair") ou ((VAL_NUM) = "SAIR")  entao
                                    LOOP_REP1 <- falso
                                    LOOP3 <- falso
                        senao
                            PASSAR <- 0
                            CLI_NUM <- caracpnum(VAL_NUM)
                            PASSAR <- PASSAR + CLI_NUM
                            se PASSAR <> 0 entao
                                LOOP3 <- falso
                            senao 
                                escreval("Número Invalido : Digite Apenas números.")
                            fimse
                        fimse
                    fimenquanto

                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 

                    enquanto LOOP3 = verdadeiro faca
                        escreva("UF..........................: ")
                        leia(CLI_UF)
                        CLI_UF <- maiusc(CLI_UF)
                        se ((CLI_UF) = "Sair") ou ((CLI_UF) = "sair") ou ((CLI_UF) = "SAIR")  entao
                            LOOP_REP1 <- falso
                            LOOP3 <- falso
                        senao
                            se val_uf(CLI_UF) = verdadeiro entao
                                LOOP3 <- falso
                            senao
                                escreval("Não existe essa UF")
                            fimse
                        fimse
                    fimenquanto

                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 

                    
                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    //ideia DD
                    enquanto LOOP3 = verdadeiro faca
                        escreva("DDD.........................: ")
                        leia(VAL_DD)
                        se ((VAL_DD) = "Sair") ou ((VAL_DD) = "sair") ou ((VAL_DD) = "SAIR")  entao
                            LOOP_REP1 <- falso
                            LOOP3 <- falso
                        senao
                            se compr(VAL_DD) >=3  entao 
                                escreval("Por favor, digite apenas 2 dígitos para o DD.")
                            senao
                                CLI_DD <- caracpnum(VAL_DD)
                                para I <- 1 ate 67 faca
                                    se CLI_DD = VET_DD[I] entao
                                        NOME_CID <- VET_CID[I]
                                        LOOP3 <- falso
                                    fimse
                                fimpara
                                se LOOP3 = verdadeiro entao
                                    escreval("DD inválido. Por favor, informe um DD válido.")
                                fimse  
                            fimse
                        fimse
                    fimenquanto
                    //TELEFONE
                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    //TELEFONE
                    enquanto LOOP3 = verdadeiro faca
                        escreva("Telefone....................: ")
                        leia(VAL_TEL)
                        se ((VAL_TEL) = "Sair") ou ((VAL_TEL) = "sair") ou ((VAL_TEL) = "SAIR")  entao
                                LOOP_REP1 <- falso
                                LOOP3 <- falso
                        senao
                            se compr(VAL_TEL) = 9 entao
                                CLI_TEL <- caracpnum(VAL_TEL)
                                PASSAR <- 0
                                PASSAR <- PASSAR + CLI_TEL
                                se PASSAR <> 0 entao
                                    TEL1 <-  caracpnum(copia(VAL_TEL,1,1))
                                    TEL2 <-  caracpnum(copia(VAL_TEL,2,1))
                                    se (TEL1 = 9) e (TEL2 = 9) entao
                                        LOOP3 <- falso
                                    fimse
                                fimse
                            senao
                               escreval("O telefone deve conter exatamente 9 dígitos.")    
                            fimse
                        fimse
                    fimenquanto

                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    // CPF
                    enquanto LOOP3 = verdadeiro faca
                        escreva("CPF.........................: ")
                        leia(VAL_CPF)
                            se ((VAL_CPF) = "Sair") ou ((VAL_CPF) = "sair") ou ((VAL_CPF) = "SAIR")  entao
                                LOOP_REP1 <- falso
                                LOOP3 <- falso
                            senao
                                se compr(VAL_CPF) = 11 entao
                                    se (validaCPF(VAL_CPF) = verdadeiro) entao
                                        CLI_CPF <- caracpnum(VAL_CPF)
                                        LOOP3 <- falso
                                    senao
                                        escreval("INVALIDO")
                                    fimse
                                senao
                                    se compr(VAL_CPF) < 11 entao
                                        escreval("CPF inválido: Muito curto, digite 11 dígitos..")
                                    senao
                                        se compr(VAL_CPF) > 11 entao
                                            escreval("CPF inválido: Muito grande, digite 11 dígitos. ")
                                        fimse
                                    fimse
                                fimse
                            fimse
                    fimenquanto

                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    // teste DATA
                    enquanto LOOP3 = verdadeiro faca
                        escreva("Data de Nascimento..(OBS: /): ")
                        leia(CLI_DT)
                        se ((CLI_DT) = "Sair") ou ((CLI_DT) = "sair") ou ((CLI_DT) = "SAIR")  entao
                            LOOP_REP1 <- falso
                            LOOP3 <- falso
                        senao
                            se compr(CLI_DT) > 10 entao
                                escreval("Data inválida: você preencheu mais números do que o necessário.")
                            senao
                                se compr(CLI_DT) < 10 entao
                                escreval("Data inválida: verifique os números e a barra (/).")
                                senao
                                    se val_data(CLI_DT) = "Data valida" entao
                                        LOOP3 <- falso
                                    senao
                                        escreval(val_data(CLI_DT))
                                    fimse
                                fimse
                            fimse
                        fimse
                    fimenquanto
                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao 
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    enquanto LOOP3 = verdadeiro faca
                        escreva("Cargo.......................: ")
                        leia(CLI_CARGO)
                        se ((CLI_CARGO) = "Sair") ou ((CLI_CARGO) = "sair") ou ((CLI_CARGO) = "SAIR")  entao
                            LOOP_REP1 <- falso
                            LOOP3 <- falso
                        senao
                            se compr(CLI_CARGO) <= 5 entao
                                escreval("Nome inválido: muito curto.")
                            senao
                                CLI_CARGO <- letras_Maiusculas(CLI_CARGO)
                                LOOP3 <- falso
                            fimse
                        fimse
                    fimenquanto

                    se LOOP_REP1 = verdadeiro entao
                        LOOP3 <- verdadeiro
                    senao
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                    enquanto LOOP3 = verdadeiro faca

                        escreva("Salário.....................: ")
                        leia(VAL_SALA)
                        se ((VAL_SALA) = "Sair") ou ((VAL_SALA) = "sair") ou ((VAL_SALA) = "SAIR")  entao
                            LOOP_REP1 <- falso
                            LOOP3 <- falso
                        senao
                            CLI_SALARIO <- caracpnum(VAL_SALA)
                            SOMA_SALAR <- CLI_SALARIO + SOMA_SALAR
                            se SOMA_SALAR <> 0 entao
                                LOOP3 <- falso
                            senao
                                escreval("Sálario Invalido : Digite Apenas números.")
                            fimse
                        fimse
                    fimenquanto
                         
                    se LOOP_REP1 = verdadeiro entao
                        LOOP2 <- verdadeiro
                        LOOP_REP1 <- falso
                    senao
                        LOOP_REP1 <- falso
                        escreval("--------------------------------------------------------------")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|               VOLTANDO PARA O MENU PRINCIPAL               |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("|                                                            |")
                        escreval("--------------------------------------------------------------")
                        escreva("Aperte enter para continuar >>> ")
                        leia(ENTER)
                        interrompa
                    fimse 
                fimenquanto
                enquanto (LOOP2 = verdadeiro) faca
                    escreval("================================================================")
                    escreval("     Informe [S] para Confirmar ou [N] para Voltar ao Menu")
                    escreval("================================================================")
                    escreval()
                    escreval("Digite a Opção: ")
                    leia(OPC_CONF_CLI)

                    se (OPC_CONF_CLI = "s") ou (OPC_CONF_CLI = "S") entao
                        // Adicionar nos Vetores.
                        VET_NOMES[CONT] <- CLI_NOME
                        VET_CEP[CONT] <- CLI_CEP
                        VET_NUM[CONT] <- CLI_NUM
                        VET_UF[CONT] <- CLI_UF
                        VET_TEL[CONT] <- CLI_TEL
                        COD_DD[CONT] <- CLI_DD
                        N_CID[CONT] <- NOME_CID
                        VET_CPF[CONT] <- CLI_CPF
                        VET_DT[CONT] <- CLI_DT
                        VET_CARGO[CONT] <- CLI_CARGO
                        VET_SALARIO[CONT] <- CLI_SALARIO
                        CONT <- CONT + 1
                        TOT_GST <- TOT_GST + 1
                        LOOP2 <- falso
                    fimse
                    se (OPC_CONF_CLI = "n") ou (OPC_CONF_CLI = "N") entao
                        limpatela
                        LOOP2 <- falso
                    fimse
                fimenquanto
            senao
                se (TELA_OPC = 3) entao
                    limpatela
                    escreval("*----------------------------------------------------------------*")
                    escreval("                          FIM DO PROGRAMA")
                    escreval("                 Obrigado por utilizar o sistema!")
                    escreval("*----------------------------------------------------------------*")
                    LOOP1 <- falso
                senao
                    limpatela
                    escreval("----------------------------------------------------------------")
                    escreval("|                                                              |")
                    escreval("|                                                              |")
                    escreval("|                                                              |")
                    escreval("|                                                              |")
                    escreval("|               DIGITE APENAS NÚMEROS DE 1 A 3                 |")
                    escreval("|                                                              |")
                    escreval("|                                                              |")
                    escreval("|                                                              |")
                    escreval("|                                                              |")
                    escreval("----------------------------------------------------------------")
                    escreva("Aperte enter para continuar >>> ")
                    leia(ENTER)
        fimse
            fimse
        fimse
    fimenquanto
Fimalgoritmo
