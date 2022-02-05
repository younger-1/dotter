# <https://github.com/prompt-toolkit/ptpython>
import sys

try:
    from icecream import ic
except ImportError:  # Graceful fallback if IceCream isn't installed.
    ic = lambda *a: None if not a else (a[0] if len(a) == 1 else a)  # noqa

try:
    from ptpython.repl import embed
except ImportError:
    try:
        import prompt_toolkit as pt
    except ImportError:
        print("🤣: ptpython or ipython is not installed")
    else:
        print("😎: Fire!")
else:
    print("😎: Fire!")
    sys.exit(embed(globals(), locals()))
