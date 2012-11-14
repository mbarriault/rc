function fish_prompt --description 'Write out the prompt'
  
  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

    if not set -q __git_cb
        if [ (git status 2> /dev/null | tail -n1) ]
        	set __git_d "*"
        	set __git_status (git status 2> /dev/null | tail -n1)
        end
        if set -q __git_d
        	if [ $__git_status = "nothing to commit (working directory clean)" ]
        		set __git_d ""
        	else
        		if [ $__git_status = "nothing added to commit but untracked files present (use \"git add\" to track)" ]
        			set __git_d ""
        		end
        	end
        end
        set __git_cb ":"(set_color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(echo $__git_d)(set_color normal)""
    end

  switch $USER

    case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

    echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal " "$__git_cb " '# '

    case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" "$__git_cb " "> "

  end
end
