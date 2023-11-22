package LibraryClass;

import LibraryClass.Music;
import LibraryClass.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-11-21T20:32:02")
@StaticMetamodel(Playlist.class)
public class Playlist_ { 

    public static volatile SingularAttribute<Playlist, Long> playlistID;
    public static volatile SingularAttribute<Playlist, String> cover;
    public static volatile SingularAttribute<Playlist, Date> created;
    public static volatile SingularAttribute<Playlist, String> name;
    public static volatile SetAttribute<Playlist, Music> Songs;
    public static volatile SingularAttribute<Playlist, User> user;

}