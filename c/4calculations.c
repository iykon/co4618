
#include<stdio.h>

typedef unsigned char byte;
typedef unsigned int word;
typedef unsigned long dwrd;

union {
    float f;
    dwrd d;
}u1,u2,u3,u4,u5,u6,u7;

void b_print(dwrd n){
    int i;
    dwrd m = 0x80000000;
    for(i=0; i<32; i++){
        if((i&7)==0)printf(" ");{
            if(m&n)printf("1");
            else printf("0");
        }
        m >>=1;
    }
    printf("\n");
}

dwrd fsubf(dwrd x, dwrd y);
dwrd faddf(dwrd x, dwrd y);
dwrd fmulf(dwrd x, dwrd y);
dwrd fdivf(dwrd x, dwrd y);
dwrd int_divide(dwrd x, dwrd y);

int main(){
    int i;
    dwrd m ;
    dwrd a,b ,c,d,e,f;
    while(1){
        m =0x80000000;
        scanf("%f %f",&u1.f , &u2 .f);
        u3.f=u1.f+u2.f;
        u4.f=u1.f-u2.f;
        u5.f=u1.f*u2.f;
        u6.f=u1.f/u2.f;
        a = b = c = d = e= f=0;
        for(i=0; i<32; i++){
            a += m & u1.d;
            b += m & u2.d;
            c += m & u3.d;
            d += m & u4.d;
            e += m & u5.d;
            f += m & u6.d;
            m >>=1;
        }
        printf("a:%f  ",u1.f);b_print( a );
        printf("b:%f  ",u2.f);b_print( b );
        printf("+:%f  ",u3.f);b_print( c );
        u7.d=faddf(a,b );printf("+:%f  ",u7.f);b_print(u7.d);
        printf("-:%f  ",u4.f);b_print( d );
        u7.d=fsubf(a,b );printf("-:%f  ",u7.f);b_print(u7.d);
        printf("*:%f  ",u5.f);b_print( e );
        u7.d=fmulf(a,b );printf("*:%f  ",u7.f);b_print(u7.d);
        printf("/:%f  ",u6.f);b_print( f );
        u7.d=fdivf(a,b );printf("/:%f  ",u7.f);b_print(u7.d);
    }
    getchar();
    getchar();
}

dwrd faddf(dwrd x, dwrd y){
    int s1,s2,m1,m2,e1,e2,s,m ,e;
    dwrd z;
    s1 = x&0x80000000; s2 = y&0x80000000;
    e1 = (x>>23)&0xff; e2 = (y>>23)&0xff;
    m1 = x&0x7fffff;   m2 = y&0x7fffff;
    if(e2>e1){
        e1 = e2; e2 = (x>>23)&0xff;
        m1 = m2; m2 = x&0x7fffff;
    }
    s = s1;
    e = e1;
    m = 0x800000+m1+(0x800000+m2>>(e1-e2));
    while((m >>24)>0){
        m >>= 1;
        ++e;
    }
    z = (s <<31)+(e <<23)+(m & 0x7fffff);
    return z;
}

dwrd fsubf(dwrd x, dwrd y){
    int m1,m2,e1,e2,s,m ,e,s1,s2;
    dwrd z;
    s1 = x&0x80000000; s2 = y&0x80000000;
    e1 = (x>>23)&0xff; e2 = (y>>23)&0xff;
    m1 = x&0x7fffff;   m2 = y&0x7fffff;
    if(e2>e1){
        e1 = e2; e2 = (x>>23)&0xff;
        m1 = m2; m2 = x&0x7fffff;
    }
    s = s1;
    e = e1;
    m = 0x800000+m1-(0x800000+m2>>(e1-e2));
    while((m&0x800000)==0){
        m <<= 1;
        --e;
    }
    z = (s<<31)+(e<<23)+(m & 0x7fffff);
    return z;
}

dwrd fmulf(dwrd x, dwrd y){
    int i,m1,m2,e1,e2,s,m ,e,s1,s2;
    dwrd z;
    s1 = x&0x80000000; s2 = y&0x80000000;
    e1 = (x>>23)&0xff; e2 = (y>>23)&0xff;
    m1 = 0x800000+(x&0x7fffff);   m2 = 0x800000+(y&0x7fffff);
    s = s1;
    e = e1+e2-127;
    m1 <<= 6;
    m2 <<= 6;
    m = 0;
    for(i=0;i<30;++i)
        if(m2&(1<<29-i))
            m += m1>>i;
    m >>= 6;
    while((m >>24)>0){
        m >>= 1;
        ++e;
    }
    z = (s <<31)+(e <<23)+(m & 0x7fffff);
    return z;
}

dwrd int_divide(dwrd x, dwrd y){
    int i;
    dwrd z = 0,m = 0xffffff;
    for(i=0;i<24;++i){
        z = (z << 1)+x/y ;
        x = x % y ;
        x <<= 1 ;
    }
    return z;
}

dwrd fdivf(dwrd x, dwrd y){
    int m1,m2,e1,e2,s,m ,e,s1,s2;
    dwrd z;
    s1 = x&0x80000000; s2 = y&0x80000000;
    e1 = (x>>23)&0xff; e2 = (y>>23)&0xff;
    m1 = 0x800000+(x&0x7fffff);   m2 = 0x800000+(y&0x7fffff);
    s = s1;
    e = e1-e2+127;
    m = int_divide(m1,m2);
    while((m &0x800000)==0){
        m <<= 1;
        --e;
    }
    z = (s <<31)+(e <<23)+(m & 0x7fffff);
    return z;
}
