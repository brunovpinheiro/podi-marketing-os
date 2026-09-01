# Brand — Podi

Camada mais alta do Podi Marketing OS. **Nada abaixo pode contradizer este arquivo.**

Se um pedido conflita com o que está aqui, a IA sinaliza o conflito em vez de alterar
a identidade. Ver `docs/governanca.md`.

---

## Marca

**Podi** — app e comunicação dos shoppings. Assinatura conjunta com **Tacla Labs** no
topo de toda peça (logo Podi à esquerda, Tacla Labs à direita).

Logos oficiais em `brand/assets/header/`. **Sempre a versão light mode** (arte escura
sobre fundo claro): o "Tacla" do logo é preto, então em fundo escuro o logo vai dentro
de uma placa branca — nunca se troca o arquivo por CSS.

## Cor de marca — e a regra que ela impõe

**`#48DB84`** (verde Podi). Contraste sobre branco: **1,79:1** — reprova em qualquer texto.

| Situação | Cor certa | Contraste |
|---|---|---|
| Texto **em cima** do verde | `#101010` | 10,6:1 — texto branco sobre o verde é **proibido** |
| Texto/link de marca **sobre branco** | `#0C6E3B` | 6,4:1 |
| Texto/link de marca no **dark mode** | `#6FE9A2` | 11,5:1 sobre `#1A1A1A` |

O `#48DB84` só entra como **fundo** — botão, tag, régua de destaque. **Nunca como cor
de texto.** Esta regra não é negociável em nenhum material, de e-mail a impresso.

Paleta completa e tokens derivados: `design-system/newsletter/tokens.md`.

## As duas frentes

Mesma marca, mesma paleta. O que muda é público, tom e obrigação legal.

| | Cliente final | Endomarketing |
|---|---|---|
| Público | Consumidor dos shoppings, usuário do app | Colaboradores Podi |
| Objetivo | Promoções, eventos, novidades do app, aniversariantes | Cases de uso, resultados, bastidores |
| Tom | Direto, aspiracional, 1 CTA por bloco | Próximo, celebratório, foco em pessoas |
| Rodapé | Completo: razão social, endereço, motivo do recebimento, **descadastro**, privacidade e termos | Contato de comunicação interna / RH; sem descadastro |

**A diferença que não pode errar:** material para cliente final sem link de descadastro
é problema de entregabilidade e de LGPD.

## Fotografia

Direção fotográfica oficial: [`photography/STYLE-LOCK-PODI.md`](photography/STYLE-LOCK-PODI.md).
Vale para qualquer foto de marca, em qualquer material. O bloco `STYLE LOCK` se copia sem
editar uma palavra — é ele que faz as imagens parecerem do mesmo ensaio.

Lá o verde é figurino e objeto dentro da foto, não texto: a regra de contraste acima
continua valendo integralmente.

## Ativos e links fixos

Ver `brand/links-oficiais.md`. Não se inventa URL, não se cria arte nova para o que já tem.

## Sobre a duplicação para Optimall

Este repositório está configurado **só para a marca Podi**. Quando o design estiver
fechado, ele será duplicado e a paleta trocada para Optimall — a estrutura e as regras
continuam idênticas. Por isso: **nunca escreva cor solta.** Toda cor sai dos tokens.
