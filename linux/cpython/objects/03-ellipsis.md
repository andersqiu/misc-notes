# Introduction
CPython `Ellipsis` object inside

## Definition after preprocessed by C preprocessor
* PyEllipsis_Type (`./Objects/sliceobject.c:25`)
  ```
  static PyTypeObject PyEllipsis_Type = {
      1, &PyType_Type,
      0,
      "ellipsis",
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      ellipsis_repr,
      0,
      0,
      0,
      0,
      0,
      0,
      PyObject_GenericGetAttr,
      0,
      0,
      ( (1L<<0) | (1L<<1) | (1L<<3) | (1L<<5) | (1L<<6) | (1L<<7) | (1L<<8) | 0 |    (1L<<17) | 0),
  };
  ```
  `PyEllipsis_Type` stands for the `EllipsisType` in Python.

* _Py_EllipsisObject (`./Objects/sliceobject.c:49`)
  ```
  PyObject _Py_EllipsisObject = {
      1, &PyEllipsis_Type,
  };
  ```
  `_Py_EllipsisObject` stands for the `Ellipsis` object in Python.