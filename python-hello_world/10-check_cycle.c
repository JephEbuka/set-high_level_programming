#include "lists.h"

/**
 * check_cycle - checks whether a singly linked list contains a cycle
 * @list: pointer to the head of the list
 *
 * Return: 1 if the list contains a cycle, otherwise 0
 */
int check_cycle(listint_t *list)
{
	listint_t *slow, *fast;

	slow = list;
	fast = list;

	while (fast != NULL && fast->next != NULL)
	{
		slow = slow->next;
		fast = fast->next->next;

		if (slow == fast)
			return (1);
	}

	return (0);
}
