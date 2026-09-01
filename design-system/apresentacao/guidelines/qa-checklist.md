# QA — rodar antes de entregar qualquer apresentação

## Canvas

- [ ] Todo slide tem 1920 × 1080 e nada foi cortado por `overflow:hidden`
- [ ] Nenhum conteúdo fora da margem de segurança de 96px
- [ ] Nenhuma barra de rolagem horizontal no navegador
- [ ] O último slide é o `15-encerramento` (ou uma variação dele)

## Cor

- [ ] Nenhuma cor escrita direto no slide — tudo por `var(--token)`
- [ ] `#48DB84` não aparece como `color:` em lugar nenhum
- [ ] `#9934FF` não aparece como `color:` de texto em lugar nenhum
- [ ] Nenhum detalhe roxo solto sobre o verde
- [ ] Texto sobre o verde é `#101010`, nunca branco
- [ ] No máximo 3 detalhes roxos por slide

## Tipografia

- [ ] Só Inter, no máximo dois pesos (400 e 700)
- [ ] Nenhum texto de leitura abaixo de 24px
- [ ] O título de cada slide cabe em duas linhas

## Imagens

- [ ] Todas em `assets/` da própria pasta, com caminho relativo
- [ ] Todas com `alt` descrevendo o que a imagem mostra
- [ ] Exportadas em 2x da exibição (ver `../tokens.md`)
- [ ] Nenhuma distorcida ou cortada para caber
- [ ] Logo Podi pelo `<use href="#logo-podi">`, nunca por PNG nem `filter`
- [ ] Logo branco sobre o verde e sobre o preto; `logo--verde` sobre fundo claro
- [ ] Rodapé assinado pelo logo, nunca pela palavra "Podi"
- [ ] Logo de cliente na versão light mode

## Conteúdo

- [ ] Nenhum `{{PLACEHOLDER}}` sobrou
- [ ] Todo número tem label e fonte do dado
- [ ] O link do app é `https://podi.podiapp.com.br/podi-e931a`
- [ ] Uma ideia por slide, nenhum slide acima de ~60 palavras

## Export

- [ ] PDF gerado em paisagem, margens nenhuma, fundos ligados
- [ ] Um slide por página no PDF, nada cortado, nenhum fundo faltando
- [ ] O deck abre sozinho a partir da pasta, sem depender de nada externo

## Comandos

```bash
f=saida/<slug>/index.html
grep -c '{{' $f                                     # 0 — placeholders
grep -n 'color:[^;"]*\(9934FF\|48DB84\|--accent)\)' $f   # só a regra .logo--verde
grep -c 'color:var(--accent-2)' $f                  # só chip de ícone e aspas do 10
grep -o '<img[^>]*>' $f | grep -cv 'alt='           # 0
grep -o 'src="[^"]*"' $f | grep -v '^src="assets/'  # nada
grep -c 'podi.com.br/app' $f                        # 0 — endereço não existe
```
