from setuptools import setup, Extension, find_packages
from Cython.Build import cythonize
from Cython.Distutils import build_ext
 

macros = [
	("_WIN32", None),
]

extensions = [Extension(
	"pytinyfd.dialogs",
	["pytinyfd/dialogs.pyx", "lib/tinyfiledialogs.c"],
	define_macros=macros,
	libraries = "Shell32 User32 Comdlg32 Ole32".split(" "),
)]

setup(
	name = "pytinyfd",
	cmdclass  = {"build_ext": build_ext},
	ext_modules = cythonize(extensions),
)