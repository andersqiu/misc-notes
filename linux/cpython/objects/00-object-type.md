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
