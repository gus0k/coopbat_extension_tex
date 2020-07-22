#!/usr/bin/awk -f
# Extract figure environments
#

BEGIN{
    printing = 0;
}

/begin\{figure/{
    printing = 1;
}

printing == 1 {
    print;
}

/end\{figure/{
    printing = 0;
}
