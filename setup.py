import os 
import sys
from typing import List
from typing import Optional
from typing import Tuple

from setuptools import setup, Extension, find_packages
from Cython.Build import cythonize
from Cython.Distutils import build_ext
 

def get_source() -> str:
    """
    Returns pytinyfd/dialogs.pyx if the env var BUILD_TINYFD is set, else returns the already generated C file
    """
    source = "pytinyfd/dialogs"
    if "BUILD_TINYFD" in os.environ:
        source += ".pyx"
    else:
        source += ".c"
    return source
        

def get_libraries() -> List[str]:
    """
    Returns a list of libraries with which the extension should link. If the platform is not windows, the list will be empty
    """
    if sys.platform == "win32":
        return "Shell32 User32 Comdlg32 Ole32".split(" ")
    return []
    


def get_macros() -> List[Tuple[str, Optional[str]]]:
    """
    returns list of macros that the extension needs to define
    """
    if sys.platform == "win32":
        return [("_WIN32", None)]
    return []
    

extensions = [Extension(
    "pytinyfd.dialogs",
    [get_source(), "lib/tinyfiledialogs.c"],
    define_macros=get_macros(),
    language_level=3,
    libraries=get_libraries(),
)]

setup(
    name = "pytinyfd",
    version = "0.1.0",
    cmdclass  = {"build_ext": build_ext},
    ext_modules = cythonize(extensions),
)