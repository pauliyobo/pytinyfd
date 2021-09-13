# pytinyfd
a  python wrapper over tinyfiledialogs
## Usage 

```python
from pytinyfd import dialogs

dialogs.message_box("test  title", "test message", dialog_type="dialogs.DIALOGTYPES_OK", icon_type=dialogs.ICON_INFO, default_button=dialogs.BUTTON_OK)
```

## notes
* although the wrapped library is cross platform, the wrapper currently only works on windows.
