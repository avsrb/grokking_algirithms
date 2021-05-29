#include <stdio.h>
#include <stdlib.h>
#ifndef SIZE
#define SIZE 5
#endif

int	find_smalllest(int *arr)
{
	int	smallest;
	int	smallest_index;

	smallest = arr[0];
	smallest_index = 0;

	for (int i = 1; i < SIZE; i++)
	{
		if (arr[i] < smallest)
		{
			smallest = arr[i];
			smallest_index = i;
		}
	}
	return (smallest_index);
}

int *selection_sort(int *arr)
{
	int	*new_arr = (int *)malloc(sizeof(int) * SIZE);
	for (int i = 0; i < SIZE; i++)
	{
		int smallest = find_smalllest(arr);
		new_arr[i] = arr[smallest];
		arr[smallest] = __INT_MAX__;
	}
	return (new_arr);
}

int main(void)
{
	int	arr[SIZE] = {73, 21, 13, 53, 36, 29, 43, 76, 79, 3, 81, 97, 28, 16, 46, 38, 85, 52, 100, 94, 49, 25, 51, 39, 96, 63, 80, 59, 32, 54, 37, 77, 10, 22, 1, 14, 60, 24, 7, 23, 83, 45, 6, 48, 62, 68, 66, 57, 44, 33, 98, 93, 40, 69, 11, 64, 84, 90, 70, 86, 41, 65, 61, 74, 8, 15, 91, 75, 82, 4, 5, 35, 71, 67, 87, 19, 9, 89, 72, 50, 18, 34, 12, 27, 42, 30, 31, 2, 88, 55, 95, 47, 26, 17, 78, 92, 99, 58, 20, 56};
	int	*sortarr = selection_sort(arr);
	for (int i = 0; i < SIZE; i++)
	{
		printf("%d ", sortarr[i]);
	}
	return (0);
}