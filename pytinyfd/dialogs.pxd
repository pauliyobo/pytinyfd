cdef extern from "../lib/tinyfiledialogs.h":

    ctypedef Py_UNICODE wchar_t

    int tinyfd_notifyPopupW(
        const wchar_t* aTitle,
        const wchar_t* aMessage,
        const wchar_t* aIconType
    )
    int tinyfd_messageBoxW(
        const wchar_t* aTitle,
        const wchar_t* aMessage,
        const wchar_t* aDialogType,
        const wchar_t* aIconType,
        int aDefaultButton
    )
    wchar_t* tinyfd_inputBoxW(
        const wchar_t* aTitle,
        const wchar_t* aMessage,
        const wchar_t* aDefaultInput
    )
    wchar_t* tinyfd_saveFileDialogW(
        const wchar_t* aTitle,
        const wchar_t* aDefaultPathAndFile,
        int aNumOfFilterPatterns,
        const wchar_t** aFilterPatterns,
        const wchar_t aSingleFilterDescription
    )
    wchar_tn* tinyfd_openFileDialogW(
        const wchar_t* aTitle,
        const wchar_t* aDefaultPathAndFile,
        int aNumOfFilterPatterns,
        const wchar_t** aFilterPatterns,
        const wchar_t aSingleFilterDescription,
        int aAllowMultipleSelects
    )
    wchar_t* tinyfd_selectFolderW(
        const wchar_t* aTitle,
        const wchar_t* aDefaultPath
    )