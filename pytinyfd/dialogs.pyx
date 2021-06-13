from typing import Optional

from dialogs cimport *

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
    return tinyfd_notifyPopupW(title, message, icon_type)


def message_box(title: str, message: str, dialog_type: str=DIALOG_TYPE_OK, icon_type: str=ICON_INFO, default_button: int=BUTTON_OK) -> int:
    return tinyfd_messageBoxW(title, message, dialog_type, icon_type, default_button)

def input_box(title: str, message: str, input_type: str=INPUT_TEXT) -> Optional[str]:
    cdef wchar_t * data = tinyfd_inputBoxW(title, message, input_type)
    if data == NULL:
        return None
    return data

def save_dialog(title: str, default_path_and_file: str, num_of_filter_patterns: int=0, filter_patterns: str="", filter_description: str="") -> Optional[str]:
    cdef wchar_t * result = tinyfd_saveFileDialogW(title, default_path_and_file, num_of_filter_patterns, NULL, filter_description)
    return result if result != NULL else None
