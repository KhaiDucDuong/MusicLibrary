package LibraryClass;

import LibraryClass.Music;
import LibraryClass.Playlist;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-11-21T20:32:02")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> gmail;
    public static volatile SingularAttribute<User, String> image;
    public static volatile SingularAttribute<User, Long> phoneNumber;
    public static volatile SetAttribute<User, Playlist> playlist;
    public static volatile SingularAttribute<User, String> pass;
    public static volatile SingularAttribute<User, Date> created;
    public static volatile SingularAttribute<User, String> name;
    public static volatile SetAttribute<User, Music> Songs;
    public static volatile SingularAttribute<User, Long> userID;
    public static volatile SingularAttribute<User, String> infor;

}