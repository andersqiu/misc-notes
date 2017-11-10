# Introduction
CPython `None` object inside

## Definition after preprocessed by C preprocessor
* PyNone_Type (`./Objects/object.c:1818`)
  ```
  static PyTypeObject PyNone_Type = {
      1, &PyType_Type,
      0,
      "NoneType",
      0,
      0,
      none_dealloc,
      0,
      0,
      0,
      0,
      none_repr,
      0,
      0,
      0,
      0,
  };
  ```

  `PyNone_Type` stands for `NoneType` in Python. This type object only defines two valid function pointers: `none_dealloc` and `none_repr`. 
  `none_dealloc` was never called
  ```
  static void
  none_dealloc(PyObject* ignore)
  {
      Py_FatalError("deallocating None");
  }
  ```

  `none_repr` just returns the `None` Python string object:
  ```
  static PyObject *
  none_repr(PyObject *op)
  {
      return PyString_FromString("None");
  }
  ```

* _Py_NoneStruct (`./Objects/object.c:1836`)
  ```
  PyObject _Py_NoneStruct = {
      1, &PyNone_Type,
  };
  ```

  `_Py_NoneStruct` stands for the `None` object in Python.