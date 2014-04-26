#!/bin/sh


################################################################################
#                                                                              #
# Utility Functions                                                            #
#                                                                              #
################################################################################


## Indent output piped into this function $1 times
indent()
{
    while read line; do
        printf " %.0s" {0..$1}
    done
}

