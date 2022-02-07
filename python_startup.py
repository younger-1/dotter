# prelude:
# os sys ic pt
import os
import sys

global ic, pt

try:
    from icecream import ic
except ImportError:  # Graceful fallback if IceCream isn't installed.
    ic = lambda *a: None if not a else (a[0] if len(a) == 1 else a)  # noqa

try:
    import prompt_toolkit as pt
except ImportError:
    print("🤣: ptpython or ipython is not installed")
else:
    # <https://github.com/prompt-toolkit/ptpython>
    try:
        from ptpython.repl import embed
    except ImportError:
        print("🐍: Hey!")
    else:
        print("😎: Fire!")
        sys.exit(embed(globals()))

