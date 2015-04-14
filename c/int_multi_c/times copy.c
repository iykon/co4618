#include <stdio.h>
#include <stdlib.h>

typedef unsigned long long word;
unsigned long long half = ((unsigned long long)1 << 32);
unsigned long long whole = ((unsigned long long)1 << 64);
unsigned long long half_num = 32;
unsigned long long whole_num = 64;

word atom(char *);
char *mtoa(word);
word times(word, word, word, word, word);
word complete(word);
word x, y, neg_y, twice_y, neg_twice_y;

int main(void) {
	char str[100];
	int i = 0;
	while (1) {
		str[i] = getchar();
		if (str[i] == '\n') break;
		i++;
	}
	x = atom(str);				//读入第一个数

	char str2[100];
	i = 0;
	while (1) {
		str2[i] = getchar();
		if (str2[i] == '\n') break;
		i++;
	}
	y = atom(str2);			//读入第二个数
	neg_y = y ^ (half >> 1);
	twice_y = (y & (half >> 1)) == (half >> 1)? (neg_y << 1) ^ (half >> 1): y << 1;
	neg_twice_y = twice_y ^ (half >> 1);	

	//printf("%d %d %d %d\n", y, neg_y, twice_y, neg_twice_y);

	word ans = times(x, y, neg_y, twice_y, neg_twice_y);		//调用加法
	//printf("%i\n", ans);

	char *str3 = mtoa(ans);
	printf("%s\n", str3);
}

word atom(char *str) {
	word num = 0;
	int flag = 0;
	int i = 0;
	char bit;
	bit = str[i++];
	if (bit == '-')	flag = 1;
		else if (bit == '+') flag = 0;
			else num = (int)bit - (int)'0';
	while (1) {
		bit = str[i++];
		if (bit == '\n') break;
		num = num * 10 + (int)bit - (int)'0';
	}
	if (num >= (half >> 1)) {
		num = 0;
	}
	if (flag && num!=0)
		num |= (half >> 1);
	return num;
}

char *mtoa(word num) {
	int flag = 0;
	int i = 0;
    char str[100];
	if ((num & (whole >> 1)) == (whole >> 1)) {
		num -= 1;
		num ^= ((whole >> 1) - 1);
	}
	if ((num & (whole >> 1)) == (whole >> 1))
		flag = 1;
	num = num & ((whole >> 1) - 1);
	if (flag)
		sprintf(str, "-%d", num);
	else
		sprintf(str, "%d", num);
	return str;
}

word complete(word num) {
	if ((num & (half >> 1)) == (half >> 1)) {
		num ^= ((half >> 1) - 1);
		return num + 1;
	} else
		return num;
}

word times(word x, word y, word neg_y, word twice_y, word neg_twice_y) {
	long long mark;
	x = complete(x);
	y = complete(y);
	neg_y = complete(neg_y);
	twice_y = complete(twice_y);
	neg_twice_y = complete(neg_twice_y);
	//printf("%d %d %d %d\n", y, neg_y, twice_y, neg_twice_y);
	mark = (-2) * ((x & 2) == 2) + ((x & 1) == 1);
	for (word i = 0; i < (half_num / 2); i++) {
		switch (mark) {
			case 1:
				x = ((x & (half - 1)) | (((x >> half_num) + y) << half_num)) & (whole - 1);
				break;
			case 2:
				x = ((x & (half - 1)) | (((x >> half_num) + twice_y) << half_num)) & (whole - 1);
				break;
			case -1:
				x = ((x & (half - 1)) | (((x >> half_num) + neg_y) << half_num)) & (whole - 1);
				break;
			case -2:
				x = ((x & (half - 1)) | (((x >> half_num) + neg_twice_y) << half_num)) & (whole - 1);
				break;
			default:
				break;
		}
		mark = (-2) * ((x & 8) == 8) + ((x & 4) == 4) + ((x & 2) == 2);
		if ((x & (whole >> 1)) == (whole >> 1)) {
			x = (x >> 2);
			x |= ((whole >> 1) + (whole >> 2));
		} else
			x >>= 2;
	}
	return x;
}
