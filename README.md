# pytinyfd
a  python wrapper over tinyfiledialogs
## Usage 

```python
from pytinyfd import dialogs

dialogs.message_box("test  title", "test message", dialog_type="dialogs.DIALOGTYPES_OK", icon_type=dialogs.ICON_INFO, default_button=dialogs.BUTTON_OK)
```

## Building
A generated c file is already present in the repository, to build

```cmd
python setup.py install
```

Should suffice.