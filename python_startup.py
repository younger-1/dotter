# <https://github.com/prompt-toolkit/ptpython>
import sys

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
