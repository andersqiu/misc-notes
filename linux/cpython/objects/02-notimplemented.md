# Introduction
CPython `NotImplemented` object inside

## Definition after preprocessed by C preprocessor
* PyNotImplemented_Type (`./Objects/object.c:1849`)
  ```
  static PyTypeObject PyNotImplemented_Type = {
      1, &PyType_Type,
      0,
      "NotImplementedType",
      0,
      0,
      none_dealloc,
      0,
      0,
      0,
      0,
      NotImplemented_repr,
      0,
      0,
      0,
      0,
  };
  ```
  `PyNotImplemented_Type` stands for the `NotImplementedType` in Python. It's very like the `NoneType`.

* _Py_NotImplementedStruct (`./Objects/object.c:1867`)
  ```
  PyObject _Py_NotImplementedStruct = {
      PyObject_HEAD_INIT(&PyNotImplemented_Type);
  }
  ```
  `_Py_NotImplementedStruct` stands for the `NotImplemented` object in Python.
