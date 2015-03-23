/**
 * 
 */
package com.logisense.loms.business;

import java.util.Calendar;
import java.util.GregorianCalendar;

enum OrderStatus {Pending, Booked, Dispatched, Completed, OnHold, Billed}
enum ZoneName{South, Center, North, Quetta, Peshawar}

/**
 * @author Sajid
 *
 */

public class Utilities {
    
    public static Station []stations;
 

    public static void initialize(){

    }
    
       public static String dateParser(GregorianCalendar aDate){
    	
    	return aDate.get(Calendar.DAY_OF_MONTH)+"-"+(aDate.get(Calendar.MONTH)+1)+"-"+aDate.get(Calendar.YEAR);
    }
    
    public static int getIndexOfStation(int stationID){
    	int indexOfStation=0;
    	for(int i=0; i<stations.length;i++){
    		
            if(stationID==stations[i].getStationID()){
                indexOfStation=i;
                break;
                }
            }
    	return indexOfStation;
    }
    
    public static String toDisplayCase(String s) {

        final String ACTIONABLE_DELIMITERS = " '-/"; // these cause the character following
                                                     // to be capitalized

        StringBuilder sb = new StringBuilder();
        boolean capNext = true;

        for (char c : s.toCharArray()) {
            c = (capNext)
                    ? Character.toUpperCase(c)
                    : Character.toLowerCase(c);
            sb.append(c);
            capNext = (ACTIONABLE_DELIMITERS.indexOf((int) c) >= 0); // explicit cast not needed
        }
        return sb.toString();
    }
}// end of Utility Class


