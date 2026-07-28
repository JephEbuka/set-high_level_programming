#include <Python.h>
#include <stdio.h>

/**
 * print_python_list_info - prints basic information about a Python list
 * @p: Python list object
 */
void print_python_list_info(PyObject *p)
{
	PyListObject *list;
	Py_ssize_t index, size;

	list = (PyListObject *)p;
	size = PyList_Size(p);
	printf("[*] Size of the Python List = %ld\n", (long)size);
	printf("[*] Allocated = %ld\n", (long)list->allocated);

	for (index = 0; index < size; index++)
		printf("Element %ld: %s\n", (long)index,
		       Py_TYPE(list->ob_item[index])->tp_name);
}
