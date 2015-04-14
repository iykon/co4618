#include<stdio.h>
typedef unsigned int word;
word atof(char *str) {
	int i=0;
	int j=0;
	int k=0;      
	int exp=0;    //exponent part
	word p1=0;    //integer part
	word res=0;   //final result
	int flag=0;   //the sign of the output
	int arr[100]; //an array to store the integer value of input string
	
	if(str[i]=='-') {   //the sign
		flag=1;
		i++;
	}
	while(str[i]!='.'&&str[i]!='\0') {
		
		p1=p1*10+str[i]-'0';   //get the value of integer part
		
		while(p1&0xFF000000) { //do not allow it to have more than 23 bits
			p1>>=1;
			exp++;	
		}
		i++;
	}
	exp+=23;  
	if((p1&0xFF800000)==0) { //transfer the fraction part to integers in the array
		for(i=0;str[i]!='\0';i++) {
			if(str[i]>='0'&&str[i]<='9') arr[i]=str[i]-'0';
			else arr[i]=str[i];
		}
		j=i-1;
	}
	int carry=0;  //carry in calculating the fraction part
	while((p1&0xFF800000)==0) { //transfering the fraction part into the mantissa
		carry=0;                //by multiplying by 2 and being devided by 10
		for(k=j;str[k]!='.'&&k>=0;k--) {
			arr[k]=arr[k]*2+carry;
			if(arr[k]>=10) {
				arr[k]-=10;
				carry=1;
			}
			else carry=0;
		}
		p1<<=1;
		p1+=carry;
		exp--;
	}
	exp+=127;   //get the biased notation of exponent
	res=flag;   //the sign bit
	res<<=8;     
	res|=exp;   //the exponent bits
	res<<=23;
	p1&=0x007FFFFF;  //remove the 24th bit, since it is definitely 1
	res|=p1;     //get the final result
	return res;
}



void ftoa(char* str, word num) {
	int i=0;
	int j=0;
	int k=0;

	int arr[30];
	
	word test=0x80000000; //test the bits' values
	word div=1000000000;  //get the decimal number
	int exp=0;      //the exponent in decimal
	word fra=1;		 //the fraction(mantissa) part, having a default 1  
	
	if(num&test) str[i++]='-'; //test the sign
	test>>=1;
	for(j=0;j<8;j++) {  //generating the exponent in decimal, ps. biased notation
		exp=(exp<<1)+!!(num&test);
		test>>=1;
	}
	exp-=127; 
	for(j=0;j<exp&&j<23;j++) {   //get the first23 binary integer bits into decimal if exponent is positive
		fra=(fra<<1)+!!(num&test); 
		test>>=1;
	}
	if(exp<0) { //if the exponent is negative, move the default 1 to its position
		num=num&0x007FFFFF;
		num|=0x00800000;
		num>>=1; 
		exp+=1;
		while(exp<0) { //and generate the zero bits
			num>>=1;
			exp++;
		}
		str[i++]='0'; //in this case the first bit of output is 0
		fra=0;   //clear the fraction part
	}
	else{   //otherwise, get the integer part
		int cnt=0;
		int flag=0;
		
		while(j<exp) {   //if the exponent is too large
			fra<<=1;     //get overlook the exact value of the rest bits, but maintain the range
			while(fra&0xC0000000) {
				fra/=10;
				cnt++;
			}
			j++;
		}
		while(div) {   //transfer the exact bits into chars
			if((flag==0)&&(fra/div)) {
				flag=1;
			}	
			if(flag) str[i++]=fra/div+'0';
			fra%=div;
			div/=10;
		}
		while(cnt) {  //use zeros to maintain the range
			str[i++]='0';
			cnt--;	
		}	
	}
	
	str[i++]='.'; //finish the integer part
	
	for(k=j;k<23;k++) {   //put the rest bits into the array representing the fraction
		arr[k-j]=!!(num&test);
		test>>=1;
 	}
 	k=k-j;  //number of the rest bits
 	int carry=0;
 	while(i<=10) {   //presumably, calculate only 10 bits of the fraction part, since the accuracy is enough
 		carry=0;
 		for(j=k-1;j>=0;j--) {   //get the decimal value by multiplying by ten and devided by 2, taking the final carry
 			arr[j]=arr[j]*10+carry;
 			if(arr[j]/2) {
 				carry=arr[j]/2;
 				arr[j]%=2;
 			}
 			else carry=0;
 		}
 		str[i++]=carry+'0';
 	}
 	str[i]='\0';  //the end of the string
}
int main(void) {
	union{
		float a;
		word b;
	}u;
	
	char s[100];
	scanf("%s",s);
	u.b=atof(s);
	printf("%f\n",u.a);
	printf("%X\n",u.b);
	
	/*
	scanf("%f",&u.b);
	char s[100];
	ftoa(s,u.b);
	printf("%s",s);
	*/
	/*
	scanf("%X",&u.b);
	printf("%f\n",u.a);
	*/
}
