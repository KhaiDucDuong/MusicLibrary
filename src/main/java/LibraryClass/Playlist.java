/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package LibraryClass;
import java.util.Set;
import java.util.Date;
import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author GIGABYTE
 */
@Entity
public class Playlist implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long playlistID;
    private String name;
    @Temporal(TemporalType.DATE)
    private Date created;
    String cover;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn
    private User user;
    @ManyToMany
    private Set<Music> Songs;

    
    public Playlist(){
        
    }
    public Playlist(long playlistID, String name, Date created, User user, Set<Music> Songs, String cover) {
        this.playlistID = playlistID;
        this.name = name;
        this.created = created;
        this.user = user;
        this.Songs = Songs;
        this.cover = cover;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    
    public long getPlaylistID() {
        return playlistID;
    }

    public void setPlaylistID(long playlistID) {
        this.playlistID = playlistID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Music> getSongs() {
        return Songs;
    }

    public void setSongs(Set<Music> Songs) {
        this.Songs = Songs;
    }
    
}
