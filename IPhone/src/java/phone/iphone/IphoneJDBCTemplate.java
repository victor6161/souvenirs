package phone.iphone;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import org.springframework.jdbc.core.RowMapper;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class IphoneJDBCTemplate implements IphoneDAO {

    private DataSource dataSource;
    private NamedParameterJdbcTemplate jdbcTemplateObject;
    
    public void addOrder(Map namedParameters){
        String sql="insert into orders(customer_name,id_good) values (:customer_name,:id_good);";
        jdbcTemplateObject.update(sql, namedParameters);
    }
    /*
    public User getUser(String tableName, String customer,String password ){
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("customer",customer);
        params.addValue("password",password);
        jdbcTemplateObject.queryForObject("SELECT * FROM"+tableName+"WHERE customer = :customer AND password=:password",params, new SouvenirMapper());
        
    }*/
    
   

    @Override
    public List<Souvenir> getListSouvenir() {

        List<Souvenir> listSouvenir = jdbcTemplateObject.query("select * from goods", new SouvenirMapper());
        return listSouvenir;
    }

    @Override
    public Souvenir getSouvenir(String id) {
        MapSqlParameterSource params = new MapSqlParameterSource("id", id);
        Souvenir iphone = jdbcTemplateObject.queryForObject("select * from goods where id=:id", params, new SouvenirMapper());
        return iphone;
    }

    public void setSouvenir(Map namedParameters) {
        String sql = "insert into goods(id,title,lacquer,fastening,bevel,length,weight,thickness,price,photo1,photo2,photo3,photo4,photo5,description) values (:id,:title,:lacquer,:fastening,:bevel,:length,:weight,:thickness,:price,:photo1,:photo2,:photo3,:photo4,:photo5,:description) ";
        jdbcTemplateObject.update(sql, namedParameters);

    }

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplateObject = new NamedParameterJdbcTemplate(dataSource);
    }
}
