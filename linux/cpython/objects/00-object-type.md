# Introduction
`PyObject` and `PyTypeObject` inside.

## Definition after preprocessed by C preprocessor

* PyObject (`./Include/object.h:103`)

  ```
  typedef struct _object {
      Py_ssize_t ob_refcnt;
      struct _typeobject *ob_type;
  } PyObject;
  ```
 
  `PyObject` is the abstract of all Python objects. All Python objects have the two fields at least.

* PyVarObject (`./Include/object.h:107`)

  ```
  typedef struct {
      Py_ssize_t ob_refcnt;
      struct _typeobject *ob_type;
      Py_ssize_t ob_size;
  } PyVarObject;
  ```

  Compare to the `PyObject`, `PyVarObject` has a more field: `ob_size`, that is the number of the elements.

* PyTypeObject (`./Include/object.h:345`)
  ```
  typedef struct _typeobject {
      Py_ssize_t ob_refcnt;
      struct _typeobject *ob_type;
      Py_ssize_t ob_size;
      const char *tp_name;
      Py_ssize_t tp_basicsize, tp_itemsize;

      destructor tp_dealloc;
      printfunc tp_print;
      getattrfunc tp_getattr;
      setattrfunc tp_setattr;
      cmpfunc tp_compare;
      reprfunc tp_repr;

      PyNumberMethods *tp_as_number;
      PySequenceMethods *tp_as_sequence;
      PyMappingMethods *tp_as_mapping;

      hashfunc tp_hash;
      ternaryfunc tp_call;
      reprfunc tp_str;
      getattrofunc tp_getattro;
      setattrofunc tp_setattro;

      PyBufferProcs *tp_as_buffer;
      long tp_flags;
      const char *tp_doc;
      
      traverseproc tp_traverse;
      inquiry tp_clear;
      richcmpfunc tp_richcompare;

      Py_ssize_t tp_weaklistoffset;
      getiterfunc tp_iter;
      iternextfunc tp_iternext;

      struct PyMethodDef *tp_methods;
      struct PyMemberDef *tp_members;
      struct PyGetSetDef *tp_getset;
      struct _typeobject *tp_base;
      PyObject *tp_dict;
      descrgetfunc tp_descr_get;
      descrsetfunc tp_descr_set;
      Py_ssize_t tp_dictoffset;
      initproc tp_init;
      allocfunc tp_alloc;
      newfunc tp_new;
      freefunc tp_free;
      inquiry tp_is_gc;
      PyObject *tp_bases;
      PyObject *tp_mro;
      PyObject *tp_cache;
      PyObject *tp_subclasses;
      PyObject *tp_weaklist;
      destructor tp_del;
  } PyTypeObject;
  ```
  
  `PyTypeObject` is the **class** concept of all Python objects. Every object has a **type**, even `PyTypeObject` itself. Meanwhile, any `PyTypeObject` is a `PyVarObject`. 
  A tricky question: What is the type of a type object? The answer is `PyType_Type`.

* PyHeapTypeObject (`./Include/object.h:349`)
  ```
  typedef struct _heaptypeobject {
      PyTypeObject ht_type;
      PyNumberMethods as_number;
      PyMappingMethods as_mapping;
      PySequenceMethods as_sequence;
      PyBufferProcs as_buffer;
      PyObject *ht_name, *ht_slots;
  } PyHeapTypeObject;
  ```

  The `PyHeapTypeObject` is the extension of `PyTypeObject`.

* PyType_Type (`./Objects/typeobject.c:2352`)
  ```
  PyTypeObject PyType_Type = {
      1, &PyType_Type,
      0,
      "type",
      sizeof(PyHeapTypeObject),
      sizeof(PyMemberDef),
      (destructor)type_dealloc,
      0,
      0,
      0,
      type_compare,
      (reprfunc)type_repr,
      0,
      0,
      0,
      (hashfunc)_Py_HashPointer,
      (ternaryfunc)type_call,
      0,
      (getattrofunc)type_getattro,
      (setattrofunc)type_setattro,
      0,
      ( (1L<<0) | (1L<<1) | (1L<<3) | (1L<<5) | (1L<<6) | (1L<<7) | (1L<<8) | 0 | (1L<<17) | 0) | (1L<<14) |
        (1L<<10),
      type_doc,
      (traverseproc)type_traverse,
      (inquiry)type_clear,
      0,
       __builtin_offsetof (PyTypeObject, tp_weaklist),
      0,
      0,
      type_methods,
      type_members,
      type_getsets,
      0,
      0,
      0,
      0,
      __builtin_offsetof (PyTypeObject, tp_dict),
      0,
      0,
      type_new,
      PyObject_GC_Del,
      (inquiry)type_is_gc,
  };
  ```
  
  `PyType_Type` is the meta class of all Python class objects. That is `PyType_Type` is the type of all `PyTypeObject` objects. It stands for the `type` object in Python.

* PyBaseObject_Type (`./Objects/typeobject.c:2887`)
  ```
  PyTypeObject PyBaseObject_Type = {
      1, &PyType_Type,
      0,
      "object",
      sizeof(PyObject),
      0,
      object_dealloc,
      0,
      0,
      0,
      0,
      object_repr,
      0,
      0,
      0,
      object_hash,
      0,
      object_str,
      PyObject_GenericGetAttr,
      PyObject_GenericSetAttr,
      0,
      ( (1L<<0) | (1L<<1) | (1L<<3) | (1L<<5) | (1L<<6) | (1L<<7) | (1L<<8) | 0 | (1L<<17) | 0) | (1L<<10),
      "The most base type",
      0,
      0,
      0,
      0,
      0,
      0,
      object_methods,
      0,
      object_getsets,
      0,
      0,
      0,
      0,
      0,
      object_init,
      PyType_GenericAlloc,
      object_new,
      PyObject_Free,
  };
  ```
  `PyBaseObject_Type` is the super class of all builtin types, it stands for the `object` object in Python.
