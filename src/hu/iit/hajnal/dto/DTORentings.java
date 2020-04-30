package hu.iit.hajnal.dto;

import hu.iit.hajnal.dataConnect.HibernateUtil;
import hu.iit.hajnal.model.RentingEntity;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class DTORentings {

    private static List<RentingEntity> rentings;

    public static List<RentingEntity> getAllRenting(){
        rentings = new ArrayList<>();
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            rentings = session.createQuery("from RentingEntity ",RentingEntity.class).list();
        }catch(Exception e){
            e.getMessage();
        }
        return rentings;
    }

    public static void dateRenting(int rentingId){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            RentingEntity deletedRenting = (RentingEntity)session.load(RentingEntity.class, rentingId);
            session.delete(deletedRenting);
            transaction.commit();
        }catch (Exception e){
            if(transaction != null){
                transaction.rollback();
            }
            e.getMessage();
        }
    }

    public static void addRentingToDatabase(RentingEntity renting){
        Transaction transaction = null;
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            transaction = session.beginTransaction();
            session.save(renting);
            transaction.commit();
        }catch (Exception e){
            if(transaction != null){
                transaction.rollback();
            }
            System.out.println("Add Reting Exception, Message: " + e.getMessage());
        }
    }
}
