#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int infinite_while(void);

/**
 * main - creates 5 zombie processes.
 * Return: 0
 */
int main(void)
{
	int i;
	pid_t child_id;

	for (i = 0; i < 5; i++)
	{
		child_id = fork();

		if (child_id == 0)
		{
			/*child process*/
			_exit(0);
		}
		else
		{
			/*parent process*/
			printf("Zombie process created, PID: %d\n", child_id);
		}

	}
	return (infinite_while());
}

/**
 * infinite_while - infinite loop
 * Return: 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
