#include <stdio.h>

int main() {
    long number= 4508075204, sum = 0;

    //printf("Введите число: ");
    //scanf("%d", &number);

    while (number > 0) {
        sum += number % 10;  // Добавляем последнюю цифру числа к сумме
        number /= 10;        // Удаляем последнюю цифру числа
    }

    printf("Сумма цифр: %d\n", sum);

    return 0;
}