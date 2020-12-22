from dialogs cimport *

def  notify_popup(title, message, icon_type="info"):
    return tinyfd_notifyPopupW(title, message, icon_type)

def message_box(title, message, dialog_type="ok", icon_type="info", default_button=1):
    return tinyfd_messageBoxW(title, message, dialog_type, icon_type, default_button)

def save_dialog(title, default_path_and_file, num_of_filter_patterns=0, filter_patterns="", filter_description=""):
    return tinyfd_saveFileDialogW(title, default_path_and_file, num_of_filter_patterns, NULL, filter_description)
