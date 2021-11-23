# <https://github.com/prompt-toolkit/ptpython>
import sys

try:
    from ptpython.repl import embed
except ImportError:
    print("🤣: ptpython is not available: falling back to standard prompt")
else:
    sys.exit(embed(globals(), locals()))
