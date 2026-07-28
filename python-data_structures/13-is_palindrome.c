#include "lists.h"

/**
 * reverse_list - reverses a singly linked list
 * @head: head of the list to reverse
 *
 * Return: new head of the reversed list
 */
static listint_t *reverse_list(listint_t *head)
{
	listint_t *previous = NULL;
	listint_t *next;

	while (head != NULL)
	{
		next = head->next;
		head->next = previous;
		previous = head;
		head = next;
	}

	return (previous);
}

/**
 * is_palindrome - checks whether a singly linked list is a palindrome
 * @head: address of the list head pointer
 *
 * Return: 1 if the list is a palindrome, otherwise 0
 */
int is_palindrome(listint_t **head)
{
	listint_t *slow, *fast, *second_half, *current, *first;
	int result = 1;

	if (head == NULL || *head == NULL || (*head)->next == NULL)
		return (1);

	slow = *head;
	fast = *head;
	while (fast->next != NULL && fast->next->next != NULL)
	{
		slow = slow->next;
		fast = fast->next->next;
	}

	second_half = reverse_list(slow->next);
	slow->next = second_half;
	current = second_half;
	first = *head;

	while (current != NULL)
	{
		if (first->n != current->n)
		{
			result = 0;
			break;
		}
		first = first->next;
		current = current->next;
	}

	slow->next = reverse_list(second_half);
	return (result);
}
