{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
          ${pkgs.tmux}/bin/tmux attach-session -t ssh_tmux || ${pkgs.tmux}/bin/tmux new-session -s ssh_tmux
      fi
    '';
  };
}
