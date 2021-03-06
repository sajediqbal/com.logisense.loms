package com.logisense.loms.data;

import java.util.List;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.PreparedQuery.TooManyResultsException;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;

import com.google.appengine.api.datastore.QueryResultList;
import com.logisense.loms.business.Station; 

/**
 *
 * @author Sajid
 */
public class StationIO {
    public static void add(Station station) {
    	   String stationName = station.getStationName();
    	   String stationZone = station.getStationZone();
    	   int regionCode = station.getRegionCode();
    	   int stationID = station.getStationID();
    	   int distance = station.getDistance();
    	   boolean isSpecial = station.isSpecial();
    	   
    	   Key stationKey = KeyFactory.createKey("Station", stationID);
 

                Entity stationEntity = new Entity("Station", stationKey);

                stationEntity.setProperty("stationName", stationName);
                stationEntity.setProperty("stationZone", stationZone);
                stationEntity.setProperty("regionCode", regionCode);
                stationEntity.setProperty("stationID", stationID);                
                stationEntity.setProperty("distance", distance);
                stationEntity.setProperty("isSpecial", isSpecial);

 
                DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
                datastore.put(stationEntity);

    }
    
    public static void update(int stationID, Station station){
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
 
		Query query = new Query("Station");
		query.addFilter("stationID", FilterOperator.EQUAL, stationID);
		PreparedQuery pq = datastore.prepare(query);
 
		 Entity stationEntity = pq.asSingleEntity();

         stationEntity.setProperty("stationName", station.getStationName());
         stationEntity.setProperty("stationZone", station.getStationZone());
         stationEntity.setProperty("regionCode", station.getRegionCode());
         stationEntity.setProperty("stationID", station.getStationID());                
         stationEntity.setProperty("distance", station.getDistance());
         stationEntity.setProperty("isSpecial", station.isSpecial());
         
         datastore.put(stationEntity);

    }
    
    public static void delete(int stationID){
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    	 
        Query query = new Query("Station");
        query.addFilter("stationID", FilterOperator.EQUAL, stationID);
        PreparedQuery pq = datastore.prepare(query);
        Entity station = pq.asSingleEntity();

        datastore.delete(station.getKey());
    }
    
    public static Entity getStationByID(int stationID){
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    	 
        Query query = new Query("Station");
        query.addFilter("stationID", FilterOperator.EQUAL, stationID);
        PreparedQuery pq = datastore.prepare(query);
        Entity station = pq.asSingleEntity();

        return station;
    }
    
    public static QueryResultList<Entity> getStationsResultList(
            int offset, 
            int noOfRecords)
{
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    	
    	int pageSize = noOfRecords;
    	
    	FetchOptions fetchOptions = FetchOptions.Builder.withLimit(pageSize).offset(offset);
        
    	Query query = new Query("Station").addSort("stationName", Query.SortDirection.ASCENDING);
    	PreparedQuery pq = datastore.prepare(query);
 
    	QueryResultList<Entity> stationResultList =
                pq.asQueryResultList(fetchOptions);
       
    return stationResultList;
}


    
    public static int getStationIDByName(String stationName){
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    	 
        Query query = new Query("Station");
        query.addFilter("stationName", FilterOperator.EQUAL, stationName);
        PreparedQuery pq = datastore.prepare(query);
        Entity station = pq.asSingleEntity();

        return Integer.parseInt(station.getProperty("stationID").toString());
    }
    
 public static List<Entity> getStationList(){
    	
    	
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        FetchOptions fetchOptions = FetchOptions.Builder.withDefaults();
        
        
        // If this servlet is passed a cursor parameter, let's use it
        
        
        
    	Query query = 
                      new Query("Station").addSort("stationName", Query.SortDirection.ASCENDING);
    	PreparedQuery pq = datastore.prepare(query);
        
        List<Entity> stations = pq.asQueryResultList(fetchOptions);

    		        return stations;
    }
    
    public static QueryResultList<Entity> listStation(String startCursor){
    	
    	
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

    	FetchOptions fetchOptions = FetchOptions.Builder.withDefaults();
        
        // If this servlet is passed a cursor parameter, let's use it
        
        if (startCursor != null) {
          //fetchOptions.startCursor(Cursor.fromWebSafeString(startCursor));
        }
        
    	Query query = 
                      new Query("Station").addSort("stationName", Query.SortDirection.ASCENDING);
    	PreparedQuery pq = datastore.prepare(query);
        
        QueryResultList<Entity> stations = pq.asQueryResultList(fetchOptions);

    		        return stations;
    }

    public static boolean exist(String stationName)
    throws NullPointerException, TooManyResultsException{
		boolean result=false;
    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query query = 
                      new Query("Station");
		query.addFilter("stationName", FilterOperator.EQUAL, stationName);
		PreparedQuery pq = datastore.prepare(query);
        Entity station = pq.asSingleEntity();
        try{
        		if ((station.getProperty("stationName") != null) & (station.getProperty("stationName").toString().equalsIgnoreCase(stationName))){
        			result = true;
        		}        
        	}
        catch(NullPointerException e){
        	result = false;
        }
        return result;
    }
    
    
    public static boolean exist(int stationID)
    	    throws NullPointerException, TooManyResultsException{
    			boolean result=false;
    	    	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    			Query query = 
    	                      new Query("Station");
    			query.addFilter("stationID", FilterOperator.EQUAL, stationID);
    			PreparedQuery pq = datastore.prepare(query);
    	        Entity station = pq.asSingleEntity();
    	        try{
    	        		if (station.getProperty("stationID") != null){
    	        				result = true;
    	        		}        
    	        	}
    	        catch(NullPointerException e){
    	        	result = false;
    	        }
    	        return result;
    	    }
    
    public static int getCount(){
    	// Create a query to get the people, sorted by their initials.
    	DatastoreService data = DatastoreServiceFactory.getDatastoreService();
    	
    	Query q = new Query("Station"); 
        q.setKeysOnly(); 
        FetchOptions fetchOptions = FetchOptions.Builder.withOffset(0); 
        PreparedQuery preparedQuery = data.prepare(q); 
        int pageCount = (int)preparedQuery.asList(fetchOptions).size(); 

    	return pageCount;
    }

}

