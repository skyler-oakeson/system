def gbs [] {
  let branch = (
    git branch |
    split row "\n" |
    str trim |
    where ($it !~ '\*') |
    where ($it != '') |
    str join (char nl) |
    fzf --no-multi
  )
  if $branch != '' {
    git switch $branch
  }
}

def gbd [] {
  let branches = (
    git branch |
    split row "\n" |
    str trim |
    where ($it !~ '\*') |
    where ($it != '') |
    str join (char nl) |
    fzf --multi |
    split row "\n" |
    where ($it != '')
  )
  if ($branches | length) > 0 {
    $branches | each { |branch| git branch -d $branch }
    ""
  }
}

alias sc = cd ($env.HOME | append .config/system | str join "/")
def switch [-f] {
    sc
    if $f {
      nix fmt
    }
    sudo nixos-rebuild switch --flake .
}

def test [-f] {
    sc
    if $f {
      nix fmt
    }
    sudo nixos-rebuild test --flake .
}

alias cdf = cd (fd -t d | fzf)
alias ll = ls -l
alias lg = lazygit

source ~/.cache/carapace/init.nu

$env.config.table.mode = 'single'
$env.config.edit_mode = 'vi'
$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"
$env.LS_COLORS = "di=1;34"
