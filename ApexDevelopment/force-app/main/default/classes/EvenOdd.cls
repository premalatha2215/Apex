public with sharing class EvenOdd {
    public static void checkEvenOdd(Integer num)
    {
        if(Math.mod(num, 2)==0)
        {
            System.debug('Number is Even');
        }
        else
        {
            System.debug('Number is Odd');
        }
    }
}
//Static method is belong to classes itself no need to create a instance obj
//EvenOdd.EvenOddMethod(4)
// a static method can be invoked without creating object

// a non static method need to create object to invoke method
//EvenOdd obj =new Evenodd();
//obj.checkEvenOdd(4)