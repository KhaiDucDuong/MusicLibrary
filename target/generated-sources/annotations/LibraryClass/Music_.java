package LibraryClass;

import LibraryClass.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-11-21T20:32:02")
@StaticMetamodel(Music.class)
public class Music_ { 

    public static volatile SingularAttribute<Music, String> image;
    public static volatile SingularAttribute<Music, Long> musicID;
    public static volatile SingularAttribute<Music, User> author;
    public static volatile SingularAttribute<Music, Date> created;
    public static volatile SingularAttribute<Music, String> name;
    public static volatile SingularAttribute<Music, String> category;
    public static volatile SingularAttribute<Music, Integer> liked;
    public static volatile SingularAttribute<Music, Boolean> existed;
    public static volatile SingularAttribute<Music, Integer> listen;

}