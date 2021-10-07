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
    c_title = title.encode()
    c_message = message.encode()
    c_icon = icon_type.encode()
    return tinyfd_notifyPopup(c_title, c_message, c_icon)


def message_box(title: str, message: str, dialog_type: str=DIALOG_TYPE_OK, icon_type: str=ICON_INFO, default_button: int=BUTTON_OK) -> int:
    c_title = title.encode()
    c_message = message.encode()
    c_dialog = dialog_type.encode()
    c_icon = icon_type.encode()
    return tinyfd_messageBox(c_title, c_message, c_dialog, c_icon, default_button)

def input_box(title: str, message: str, input_type: Optional[str]=INPUT_TEXT) -> Optional[str]:
    c_title = title.encode()
    c_message = message.encode()
    input_type   = input_type.encode() if input_type is not None else None
    cdef char* c_input_type = NULL
    if input_type is not None:
        c_input_type = input_type
    cdef char * data = tinyfd_inputBox(c_title, c_message, c_input_type)
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
