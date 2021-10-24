cdef extern from "../lib/tinyfiledialogs.h":

    int tinyfd_notifyPopup(
        const char* aTitle,
        const char* aMessage,
        const char* aIconType
    )
    int tinyfd_messageBox(
        const char* aTitle,
        const char* aMessage,
        const char* aDialogType,
        const char* aIconType,
        int aDefaultButton
    )
    char* tinyfd_inputBox(
        const char* aTitle,
        const char* aMessage,
        const char* aDefaultInput
    )
    char* tinyfd_saveFileDialog(
        const char* aTitle,
        const char* aDefaultPathAndFile,
        int aNumOfFilterPatterns,
        const char** aFilterPatterns,
        const char* aSingleFilterDescription
    )
    char* tinyfd_openFileDialog(
        const char* aTitle,
        const char* aDefaultPathAndFile,
        int aNumOfFilterPatterns,
        const char** aFilterPatterns,
        const char* aSingleFilterDescription,
        int aAllowMultipleSelects
    )
    char* tinyfd_selectFolderDialog(
        const char* aTitle,
        const char* aDefaultPath
    )