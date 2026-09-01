# saida/ — o que você montou

É aqui que o Claude grava o material pronto:

| O que | Onde |
|---|---|
| Newsletter montada (`/newsletter-podi`) | `saida/<slug>/index.html` |
| Prompt de foto de marca (`/foto-podi`) | `saida/fotos/NNN-slug.md` |

**O que você monta fica só no seu computador.** Nada daqui é enviado para lugar nenhum
automaticamente — não tem risco de sobrescrever o trabalho de outra pessoa nem de mexer
no padrão sem querer.

## O que fazer com o arquivo pronto

*(newsletter)*

1. Conferir no navegador (ver "Preview local" no [README](../README.md) da raiz).
2. Testar o disparo pela ferramenta de envio ou por Litmus / Email on Acid.
3. Subir as imagens no servidor e trocar os caminhos relativos pelas URLs finais.

## Diferença para `examples/`

| Pasta | O que é |
|---|---|
| `saida/` | Seu trabalho — fica no seu computador |
| `examples/` | Acervo de referência do time, cuidado por quem mantém o padrão |

Os prompts de foto em `saida/fotos/` são o histórico do ensaio: guardando-os, dá para
repetir uma foto meses depois e reaproveitar a mesma seed.

Quando um envio ficar bom o bastante para virar referência, mande para quem cuida do
padrão — a decisão de entrar em `examples/` é dele.
