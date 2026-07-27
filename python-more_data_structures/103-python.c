#include <stdio.h>
#include <Python.h>

/**
 * print_python_bytes - prints information about a Python bytes object
 * @p: pointer to the Python object
 */
void print_python_bytes(PyObject *p)
{
	PyBytesObject *bytes;
	Py_ssize_t size;
	Py_ssize_t count;
	Py_ssize_t i;

	printf("[.] bytes object info\n");
	if (p == NULL || p->ob_type != &PyBytes_Type)
	{
		printf("  [ERROR] Invalid Bytes Object\n");
		fflush(stdout);
		return;
	}

	bytes = (PyBytesObject *)p;
	size = bytes->ob_base.ob_size;
	count = size + 1;
	if (count > 10)
		count = 10;

	printf("  size: %ld\n", (long)size);
	printf("  trying string: %s\n", bytes->ob_sval);
	printf("  first %ld bytes:", (long)count);
	for (i = 0; i < count; i++)
		printf(" %02x", (unsigned char)bytes->ob_sval[i]);
	printf("\n");
	fflush(stdout);
}

/**
 * print_python_list - prints information about a Python list object
 * @p: pointer to the Python list
 */
void print_python_list(PyObject *p)
{
	PyListObject *list;
	Py_ssize_t size;
	Py_ssize_t i;
	PyObject *item;

	list = (PyListObject *)p;
	size = list->ob_base.ob_size;

	printf("[*] Python list info\n");
	printf("[*] Size of the Python List = %ld\n", (long)size);
	printf("[*] Allocated = %ld\n", (long)list->allocated);

	for (i = 0; i < size; i++)
	{
		item = list->ob_item[i];
		printf("Element %ld: %s\n", (long)i, item->ob_type->tp_name);
		if (item->ob_type == &PyBytes_Type)
			print_python_bytes(item);
	}
	fflush(stdout);
}
