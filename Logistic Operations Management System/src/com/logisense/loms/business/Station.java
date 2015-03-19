/**
 * 
 */
package com.logisense.loms.business;

/**
 * @author Sajid
 *
 */
public class Station {
	   private static int stationCount;
	   
	   private String stationName;
	   private String stationZone;
	   private int regionCode;
	   private int stationID;
	   private int distance;
	   private boolean isSpecial;
	   
	   static {
	       setStationCount(0);
	   }
	   
	   /**
		 * @return the stationCount
		 */
		public static int getStationCount() {
			return stationCount;
		}

		/**
		 * @param stationCount the stationCount to set
		 */
		public static void setStationCount(int stationCount) {
			Station.stationCount = stationCount;
		}

		public Station(int stationID, String name, String stationZoneName, int regionCode, int distance, boolean isSpecial){
	       this.stationName = name;
	       this.stationZone = stationZoneName;
	       this.regionCode=regionCode;
	       this.distance = distance;
	       this.stationID=stationID;
	       this.isSpecial=isSpecial;
	       setStationCount(getStationCount() + 1);
	   }

	   public String getStationName(){
	       return this.stationName;
	   }
	   
	   public String getStationZone(){
	       return this.stationZone;
	       
	   }
	   
	   public int getDistance(){
	       return this.distance;
	   }
	   
	   public int getStationID(){
	       return this.stationID;
	   }
	   
	   public int getRegionCode(){
	       return this.regionCode;
	   }
	   
	   public boolean isSpecial(){
	       return this.isSpecial;
	   }
	   
	   public void setStationName(String newStationName){
	       this.stationName=newStationName;
	   }
	   
	   public void setStationZone(String newZoneName){
	       this.stationZone=newZoneName;
	       
	   }
	   
	   public void setDistance(int newDistance){
	       this.distance=newDistance;
	   }
	   
	   public void setStationID(int newStationID){
	       this.stationID=newStationID;
	   }
	   
	   public void setRegionCode(int newRegionCode){
	       this.regionCode=newRegionCode;
	   }
	   
	   public void setSpecial(boolean newValue){
	       this.isSpecial=newValue;
	   }
	      
	}
