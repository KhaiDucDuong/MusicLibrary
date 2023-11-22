/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBUtil;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import java.util.List;

import LibraryClass.User;
/**
 *
 * @author GIGABYTE
 */
public class UserDB {
    public static void insertUser(User user){
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(user);
            trans.commit();
        }
        catch (Exception e){
            System.out.println(e);
            trans.rollback();
        }
        finally {
            em.close();
        }
    }
    
    public static List<User> selectUser(String email,String pass){
    EntityManager em = DButil.getFactory().createEntityManager();
    String qString = "Select u FROM User u " + "WHERE u.gmail = :email AND" +" u.pass = :pass";
    TypedQuery<User> q = em.createQuery(qString, User.class);
    q.setParameter("email", email);
    q.setParameter("pass", pass);
    List<User> user = null;
    try{
        user = q.getResultList();
        return user;
    }
    catch (NoResultException e){
        return null;
    }
    finally{
        em.close();
    }
}
    
    public static String selectUserNameFromID(long userID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        try {
            User user = em.find(User.class, userID);
            return user.getName();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    } 
    
    
    public static boolean checkUser(String email){
    EntityManager em = DButil.getFactory().createEntityManager();
    String qString = "Select u FROM User u " + "WHERE u.gmail = :email";
    TypedQuery<User> q = em.createQuery(qString, User.class);
    q.setParameter("email", email);
    List<User> user;
    try{
        user = q.getResultList();
        return !user.isEmpty();
    }
    catch (NoResultException e){
        System.out.println("Loi exception roi");
        return false;
    }
    finally{
        em.close();
    }  
} 
    public static List<User> selectAllUser(){
    EntityManager em = DButil.getFactory().createEntityManager();
    String qString = "Select u FROM User u ";
    TypedQuery<User> q = em.createQuery(qString, User.class);
    List<User> user = null;
    try{
        user = q.getResultList();
        return user;
    }
    catch (NoResultException e){
        return null;
    }
    finally{
        em.close();
    }  
} 
public static boolean userExist(String email, String pass){
   List<User> u = selectUser(email, pass);
   return !u.isEmpty();
}

public static boolean updateUser(User user){
         EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        User updated = em.find(User.class, user.getUserID());
        try {
            updated.setPass(user.getPass());
            updated.setName(user.getName());
            updated.setPhoneNumber(user.getPhoneNumber());
            updated.setInfor(user.getInfor());
            updated.setImage(user.getImage());
            em.merge(updated);
            trans.commit();
        }
        catch (Exception e){
            System.out.println(e);
            trans.rollback();
            return false;
        }
        finally {
            em.close();
            return true;
        }
    
}

public static void deleteUser(User user){
         EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        User updated = em.find(User.class, user.getUserID());
        try {
            em.remove(em.merge(updated));
            trans.commit();
        }
        catch (Exception e){
            System.out.println(e);
            trans.rollback();
        }
        finally {
            em.close();
        }
    
}
}


