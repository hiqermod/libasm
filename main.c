#include "stdio.h"
#include "unistd.h"
#include "stdlib.h"

typedef struct s_list
{
    void *data;
    struct s_list *next;
} t_list;

extern int  ft_strlen(char *str);
extern char *ft_strcpy(char *dst, char *src);
extern int  ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fildes, const void *buff, size_t nbyte);
extern ssize_t ft_read(int fd, void *buff, size_t nbyte);
extern char *ft_strdup(const char *s1);
extern void ft_list_push_front(t_list **begin_list, void *data);
extern int ft_list_size(t_list *begin_list);
extern void ft_list_sort(t_list **begin_list, int (*cmp)());


int main()
{
    char omer[] = "bmeryumusak\0";
    char a[] = "ameryumusak\0";
    t_list *lst;


    lst = malloc(sizeof(t_list));
    lst->data = omer;
    lst->next = 0;

    ft_list_push_front(&lst, "martin");

    ft_list_sort(&lst, ft_strcmp);
    //printf("%d\n", ft_list_sort(&lst, ft_strcmp));

    //printf("%d\n",ft_list_sort(&lst, ft_strcmp));

    // printf("%s", (char *)lst->data);
    printf("%s %s\nlistSize=%d\n", (char *)lst->data, (char *)lst->next->data, ft_list_size(lst));
    //printBits(ft_strcmp(omer, a));

    //printf("ret_val=%lu\ndest=%lu\nsrc=%s\n", ft_strcpy(omer, a), omer, a);

    //printf("%d\n", ft_write(1, omer[0], 1));
    // ft_read(0, a, 1);



    //char *x = ft_strdup("omeryumusak");
    //printf("%s\n", x);

}