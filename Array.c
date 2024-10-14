#include<stdio.h>
void main()
{
	int i,n,a[100],m;
	printf("Enter the size of array");
	scanf("%d",&n);
	printf("Enter elements:");
	for(i=0;i<n;i++)
	{
		scanf("%d",&a[i]);
	}
	printf("Array elements are:\n");
	for(i=0;i<n;i++)
	{
		printf("%d",a[i]);
	}
	printf("\nEnter the number to be searched:\n");
	scanf("%d",&m);
	for(i=0;i<n;i++)
	{
		if(a[i]==m)
		{
		printf("%d is present at %d location in the array",m,i);
		break;
		}
	}
	if(i==n)
	{
		printf("Element is not in the list");
	}
}
	
		
