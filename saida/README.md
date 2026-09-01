# saida/ — newsletters montadas

É aqui que o Claude grava o e-mail pronto: `saida/<slug>/index.html`.

**O que você monta fica só no seu computador.** Nada daqui é enviado para lugar nenhum
automaticamente — não tem risco de sobrescrever o trabalho de outra pessoa nem de mexer
no padrão sem querer.

## O que fazer com o arquivo pronto

1. Conferir no navegador (ver "Preview local" no [README](../README.md) da raiz).
2. Testar o disparo pela ferramenta de envio ou por Litmus / Email on Acid.
3. Subir as imagens no servidor e trocar os caminhos relativos pelas URLs finais.

## Diferença para `examples/`

| Pasta | O que é |
|---|---|
| `saida/` | Seu trabalho — fica no seu computador |
| `examples/` | Acervo de referência do time, cuidado por quem mantém o padrão |

Quando um envio ficar bom o bastante para virar referência, mande para quem cuida do
padrão — a decisão de entrar em `examples/` é dele.
