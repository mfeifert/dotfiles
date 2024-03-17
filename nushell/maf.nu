$env.EDITOR = "helix"

alias c = clear
alias p1 = ping 1.1.1.1
alias py = python3 -q
alias hx = helix
alias d = cd $env.DOCS
alias db = cd $env.DB
def ll [] { ls -a | sort-by type }
def www [] { cd ($env.DOCS | append "/www" | str join) ; helix }

# database scripts

def m [] { py ($env.DOCS | append "/projects/db_menu/menu.py" | str join) }
def s [] { py ($env.DOCS | append "/projects/db_menu/shows.py" | str join) }

# ledger & hledger

alias ledger = ledger -f $env.LEDGER_FILE
alias hledger = hledger --pretty -s
def bs []   = { c ; hledger bs --drop 1 }
def bsm []  = { c ; hledger bs --drop 1 -M }
def is []   = { c ; hledger is --drop 1 -S -b thismonth }
def iss []  = { c ; hledger is --drop 1 -S -b thismonth -2 }
def ism []  = { c ; hledger is --drop 1 -MST }
def issm [] = { c ; hledger is --drop 1 -MST -2 }
