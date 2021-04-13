from enum import Enum, IntEnum

from dialogs cimport *

class Icon(Enum):
    ERROR =    "error"
    INFO = "info"
    QUESTION = "question"
    WARNING = "warning"

class DialogType(Enum):
    OK = "ok"
    CANCEL = "cancel"
    YESNO = "yesno"

class Button(IntEnum):
    CANCEL = 0
    OK = 1

class Input(Enum):
    PASSWORD  = None
    TEXT = ""


def  notify_popup(title, message, icon_type=Icon.INFO):
    return tinyfd_notifyPopupW(title, message, icon_type.value)

def message_box(title, message, dialog_type=DialogTypes.OK, icon_type=Icon.INFO, default_button=Button.OK):
    return tinyfd_messageBoxW(title, message, dialog_type.value, icon_type.value, default_button.value)

def save_dialog(title, default_path_and_file, num_of_filter_patterns=0, filter_patterns="", filter_description=""):
    return tinyfd_saveFileDialogW(title, default_path_and_file, num_of_filter_patterns, NULL, filter_description)
