/**
 *
 * @author Johnny
 */
package DBUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import java.util.List;

import java.util.Set;
import java.util.HashSet;
import LibraryClass.Music;
import LibraryClass.Playlist;
import LibraryClass.User;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import javax.persistence.Query;

public class MusicDB {

    public static boolean insertMusic(Music music) {
        boolean insertSuccess = false;
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.persist(music);
            trans.commit();
            insertSuccess = true;
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
            return insertSuccess;
        }
    }

    public static Music selectMusicByMusicID(long MusicID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        try {
            Music music = em.find(Music.class, MusicID);
            return music;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static List<Music> selectMusicbyUserID(User userID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        String qString = "SELECT u FROM Music u " + "WHERE u.author = :id" + " AND u.existed = true";
        TypedQuery<Music> q = em.createQuery(qString, Music.class);
        q.setParameter("id", userID);
        List<Music> music = null;

        try {
            music = q.getResultList();
            return music;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Set<Music> selectMusicInPlaylist(long playlistID) {
        Playlist playlist = PlaylistDB.selectPlaylistByID(playlistID);
        Set<Music> playlistSongs = playlist.getSongs();
        Set<Music> playlistExistedSongs = new HashSet<Music>();
        for (Music song: playlistSongs) {
            if (song.isExisted()) {
                playlistExistedSongs.add(song);
            }
        }
        return playlistExistedSongs;
    }

    public static boolean musicExist(long MusicID) {
        Music music = selectMusicByMusicID(MusicID);
        if (music == null) {
            return false;
        }
        
        return music.isExisted();
    }

    public static boolean updateMusic(Music music) {
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        Music updated = em.find(Music.class, music.getMusicID());
        try {
            updated.setName(music.getName());
            updated.setAuthor(music.getAuthor());
            updated.setCategory(music.getCategory());
            updated.setImage(music.getImage());
            em.merge(updated);
            trans.commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            if (trans.isActive()) {
                trans.rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

    public static void deleteMusic(long MusicID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        Music removedMusic = em.find(Music.class, MusicID);
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove( em.merge(removedMusic));
            trans.commit();
        }
        catch (Exception e) {
            System.out.println(e);
            trans.rollback();  
        }
        finally {
            em.close();
        }
    }

    public static boolean setMusicExistenceFalse(long musicID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        Music updatedMusic = em.find(Music.class, musicID);
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            updatedMusic.setExisted(false);
            em.merge(updatedMusic);
            trans.commit();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
            return false;
        } finally {
            em.close();
        }
    }

    public static List<Music> findMusic(String find) throws UnsupportedEncodingException {
        String decodedFind = URLDecoder.decode(find, StandardCharsets.UTF_8.toString());
        EntityManager em = DButil.getFactory().createEntityManager();
        String queryString = "SELECT u FROM Music u WHERE u.name LIKE :search";
        TypedQuery<Music> query = em.createQuery(queryString, Music.class);
        query.setParameter("search", "%" + decodedFind + "%");
        List<Music> result = query.getResultList();
        return result;
    }
    public static List<Music> selectAllMusic(){
        EntityManager em = DButil.getFactory().createEntityManager();
         String queryString = "SELECT u FROM Music u";
         TypedQuery<Music> query = em.createQuery(queryString, Music.class);
          List<Music> result = query.getResultList();
          return result;
    }
     public static List<Music> select12Songs(){
        EntityManager em = DButil.getFactory().createEntityManager();
         String queryString = "SELECT u FROM Music u ORDER BY u.musicID DESC";
         TypedQuery<Music> query = em.createQuery(queryString, Music.class);
         query.setMaxResults(12);
          List<Music> result = query.getResultList();
          return result;
    }
}
