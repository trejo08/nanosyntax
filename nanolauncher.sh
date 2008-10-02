#!/bin/bash 

NANO="/usr/bin/nano" 

for PARAM; do 
        if [[ -f $PARAM ]]; then 
                [[ ! $NANOFILE ]] && NANOFILE="${PARAM}" || exec $NANO "$@" 
        fi 
done 

case `file -b "${NANOFILE}"` in 
        *perl*"script text"* ) 
                SYNTAX="--syntax perl" 
                ;; 
        *python*"script text"* ) 
                SYNTAX="--syntax python" 
                ;; 
        *ruby*"script text"* ) 
                SYNTAX="--syntax ruby" 
                ;; 
        *PHP*"script text"* ) 
                SYNTAX="--syntax php" 
                ;; 
        *"script text"* ) 
                SYNTAX="--syntax sh" 
                ;; 
        *"diff output text"* ) 
                SYNTAX="--syntax patch" 
                ;; 
        *C*"program text"*) 
                SYNTAX="--syntax c" 
                ;; 
        *"Java program text"* ) 
                SYNTAX="--syntax java" 
                ;; 
        *"HTML document text"* ) 
                SYNTAX="--syntax html" 
                ;; 
esac 

exec $NANO ${SYNTAX} "$@" 

exit