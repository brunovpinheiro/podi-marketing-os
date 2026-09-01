#!/usr/bin/env bash
# Verifica se o clone local está atrás do repositório remoto.
#
# Rodado pelas skills -podi antes de montar qualquer coisa: como a pasta saida/
# fica fora do Git, quem só escreve newsletter nunca tem motivo para tocar no
# repositório — e um clone parado há meses monta e-mail com template velho, sem
# nenhum sinal visível de que está errado.
#
# Sem argumento: só verifica.  Com --atualizar: verifica e já traz a versão nova.
#
# Saída 0 = pode seguir.  Saída 1 = desatualizado (ou a atualização não foi possível).
# Qualquer condição que impeça a verificação (sem git, sem remoto, offline) também
# sai 0: a checagem é uma rede de proteção, não pode virar bloqueio de trabalho.

set -uo pipefail
cd "$(dirname "$0")/.." || exit 0

MODO="${1:-verificar}"   # verificar | --atualizar

aviso() { printf '%s\n' "$*" >&2; }

command -v git >/dev/null 2>&1 || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
  aviso "· Repositório ainda não é Git — verificação de atualização pulada."
  exit 0
}
git remote get-url origin >/dev/null 2>&1 || {
  aviso "· Sem remoto 'origin' configurado — verificação de atualização pulada."
  exit 0
}

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || exit 0
[ "$branch" = "HEAD" ] && exit 0

if ! git fetch --quiet origin "$branch" 2>/dev/null; then
  aviso "· Não deu para falar com o remoto (offline?) — seguindo sem verificar."
  exit 0
fi

git rev-parse --verify --quiet "origin/$branch" >/dev/null || exit 0

atras=$(git rev-list --count "HEAD..origin/$branch" 2>/dev/null || echo 0)
[ "$atras" -eq 0 ] && exit 0

criticos=$(git diff --name-only "HEAD..origin/$branch" -- brand/ design-system/ templates/ CLAUDE.md 2>/dev/null)
novidades=$(git log --format='  · %s' "HEAD..origin/$branch" -- CHANGELOG.md 2>/dev/null | head -10)

mostrar_novidades() {
  [ -n "$criticos" ] && { aviso ""; aviso "Mudou no padrão:"; printf '  · %s\n' $criticos >&2; }
  [ -n "$novidades" ] && { aviso ""; aviso "No CHANGELOG:"; aviso "$novidades"; }
}

if [ "$MODO" != "--atualizar" ]; then
  aviso "· Existe uma versão mais nova do padrão ($atras commit(s) atrás)."
  mostrar_novidades
  aviso ""
  aviso "Rode:  ./scripts/check-atualizacao.sh --atualizar"
  exit 1
fi

# --- modo atualizar ---------------------------------------------------------
# --ff-only de propósito: se o histórico local divergiu, é problema de quem cuida
# do repositório, não de quem está montando uma newsletter. Melhor parar do que
# tentar resolver merge por conta própria.
if ! git pull --ff-only --quiet origin "$branch" 2>/dev/null; then
  aviso ""
  aviso "NÃO FOI POSSÍVEL ATUALIZAR AUTOMATICAMENTE."
  aviso "Há alteração local nesta cópia que conflita com a versão nova."
  aviso "Avise quem cuida do repositório antes de montar — o e-mail sairia"
  aviso "com o padrão antigo."
  aviso ""
  exit 1
fi

aviso "· Padrão atualizado para a versão mais recente ($atras commit(s))."
mostrar_novidades
aviso ""
exit 0
