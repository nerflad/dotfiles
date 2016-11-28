function fish_right_prompt -d "Write out the right-side command line prompt"
    set -l last_status $status
    if [ $last_status -ne 0 ]
        echo \:\(
    end
end
