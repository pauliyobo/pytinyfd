from typing import List
from typing import Optional

from dialogs cimport *

from libc.stdlib cimport  malloc, free

# Icon types
ICON_ERROR =    "error"
ICON_INFO = "info"
ICON_QUESTION = "question"
ICON_WARNING = "warning"

# Dialog types
DIALOG_TYPE_OK = "ok"
DIALOG_TYPE_CANCEL = "cancel"
DIALOG_TYPE_YESNO = "yesno"

# Button types
BUTTON_CANCEL = 0
BUTTON_OK = 1

# Input types
INPUT_PASSWORD  = None
INPUT_TEXT = ""


def  notify_popup(title: str, message: str, icon_type: str=ICON_INFO) -> int:
    title = title.encode()
    message = message.encode()
    icon_type = icon_type.encode()
    return tinyfd_notifyPopup(title, message, icon_type)


def message_box(title: str, message: str, dialog_type: str=DIALOG_TYPE_OK, icon_type: str=ICON_INFO, default_button: int=BUTTON_OK) -> int:
    title = title.encode()
    message = message.encode()
    dialog_type = dialog_type.encode()
    icon_type = icon_type.encode()
    return tinyfd_messageBox(title, message, dialog_type, icon_type, default_button)

def input_box(title: str, message: str, input_type: str=INPUT_TEXT) -> Optional[str]:
    title = title.encode()
    message = message.encode()
    input_type   = input_type.encode()
    cdef char * data = tinyfd_inputBox(title, message, input_type)
    if data == NULL:
        return None
    return data.decode()

def save_dialog(title: str, default_path_and_file: str, filter_patterns: List[str]=[], filter_description: str="") -> Optional[str]:
    c_title = title.encode()
    c_path = default_path_and_file.encode()
    c_description = filter_description.encode()
    num_of_filter_patterns = len(filter_patterns)
    cdef char ** c_filter_patterns = NULL
    if num_of_filter_patterns > 0:
        c_filter_patterns = <char **>malloc(num_of_filter_patterns * sizeof(char*))
        for i in range(num_of_filter_patterns):
            pattern = filter_patterns[i].encode()
            c_filter_patterns[i] = pattern
    cdef char * result = tinyfd_saveFileDialog(c_title, c_path, num_of_filter_patterns, c_filter_patterns, c_description)
    free(c_filter_patterns)
    return result.decode() if result != NULL else None
