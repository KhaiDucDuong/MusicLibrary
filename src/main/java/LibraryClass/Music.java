/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package LibraryClass;
import java.util.Date;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.*;
/**
 *
 * @author GIGABYTE
 */
@Entity
public class Music implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long musicID;
    private String name;
    @ManyToOne
    private User author;
    private String category;
    private int liked;
    private boolean existed;
    private int listen;
    private String image;
    @Temporal(TemporalType.DATE)
    private Date created;
    
    public Music(){
        this.existed = true;
        }
    
    public Music(long musicID, String name, User author, String category, int like, int listen, String image, Date created) {
        this.musicID = musicID;
        this.name = name;
        this.author = author;
        this.category = category;
        this.liked = like;
        this.listen = listen;
        this.image = image;
        this.created = created;
        this.existed = true;
    }
    
     public int getLiked() {
        return liked;
    }

    public void setLiked(int liked) {
        this.liked = liked;
    }

    public boolean isExisted() {
        return existed;
    }

    public void setExisted(boolean existed) {
        this.existed = existed;
    }
    public Music(String name, User author, String category, int like, int listen, String image, Date created) {
        this.name = name;
        this.author = author;
        this.category = category;
        this.liked = like;
        this.listen = listen;
        this.image = image;
        this.created = created;
        this.existed = true;
    }
    

    public long getMusicID() {
        return musicID;
    }

    public void setMusicID(long musicID) {
        this.musicID = musicID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getLike() {
        return liked;
    }

    public void setLike(int like) {
        this.liked = like;
    }

    public int getListen() {
        return listen;
    }

    public void setListen(int listen) {
        this.listen = listen;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
}

