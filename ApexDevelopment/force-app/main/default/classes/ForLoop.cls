public with sharing class ForLoop {
    public static void checkForLoop(){
        Integer j=1;
        for(Integer i=1;i<=10;i++)
        {
            System.debug('number'+i);
        }
        while(j<5)
        {
            System.debug('WhileLOOPNumner is :'+j);
            j++;
        }
        
    }
}