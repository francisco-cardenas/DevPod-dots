#!/bin/bash
set -euo pipefail

echo "Running DevPod dotfiles install script..."

# --- Fix terminfo for ghostty ---
if [[ "$TERM" == "xterm-ghostty" ]]; then
    echo "📦 Installing hardcoded terminfo for Ghostty..."

    mkdir -p ~/.terminfo

    cat > /tmp/xterm-ghostty.terminfo << 'EOF'
xterm-ghostty|Ghostty Terminal,
  am, bce, ccc, mir, msgr, npc, xenl,
  colors#256, cols#80, it#8, lines#24,
  acsc=++\,\,--..00``aaffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~,
  bel=^G, blink=\E[5m, bold=\E[1m, clear=\E[H\E[2J,
  cr=^M, civis=\E[?25l, cnorm=\E[?25h,
  cub=\E[%p1%dD, cub1=\E[D, cud=\E[%p1%dB, cud1=\E[B,
  cuf=\E[%p1%dC, cuf1=\E[C, cup=\E[%i%p1%d;%p2%dH,
  cuu=\E[%p1%dA, cuu1=\E[A, dch=\E[%p1%dP, dch1=\E[P,
  dim=\E[2m, dl=\E[%p1%dM, dl1=\E[M,
  ech=\E[%p1%dX, el=\E[K, el1=\E[1K, ed=\E[J,
  flash=\E[?5h$<100/>\E[?5l, home=\E[H, hpa=\E[%i%p1%dG,
  ich=\E[%p1%d@, ich1=\E[@, il=\E[%p1%dL, il1=\E[L,
  ind=\n, invis=\E[8m, kbs=^H, kcub1=\EOD, kcud1=\EOB,
  kcuf1=\EOC, kcuu1=\EOA, kdch1=\E[3~, kend=\E[4~,
  kf1=\EOP, kf10=\E[21~, kf11=\E[23~, kf12=\E[24~,
  kf2=\EOQ, kf3=\EOR, kf4=\EOS, kf5=\E[15~,
  kf6=\E[17~, kf7=\E[18~, kf8=\E[19~, kf9=\E[20~,
  khome=\E[1~, knp=\E[6~, kpp=\E[5~, op=\E[39;49m,
  rev=\E[7m, ri=\EM, rmacs=\E(B, rmam=\E[?7l,
  rmcup=\E[?1049l, rmir=\E[4l, rmso=\E[27m, rmul=\E[24m,
  rs1=\Ec, sc=\E7, setab=\E[48;5;%p1%dm,
  setaf=\E[38;5;%p1%dm, sgr0=\E[0m, smacs=\E(0,
  smam=\E[?7h, smcup=\E[?1049h, smir=\E[4h,
  smso=\E[7m, smul=\E[4m, tbc=\E[3g,
  vpa=\E[%i%p1%dd,
EOF

    tic -x /tmp/xterm-ghostty.terminfo
    rm /tmp/xterm-ghostty.terminfo
fi

# --- Install Vim ---
echo "Installing vim..."
if command -v apt &>/dev/null; then
    sudo apt-get update -y
    sudo apt-get install -y vim
elif command -v dnf &>/dev/null; then
    sudo dnf install -y vim
else
    echo "No supported package manager found. Skipping vim install."
fi


echo "Devpod Successfully setup!"
