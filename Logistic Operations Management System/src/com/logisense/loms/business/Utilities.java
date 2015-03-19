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
}// end of Utility Class


