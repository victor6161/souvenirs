/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.iphone;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Admin
 */
public class SouvenirMapper implements RowMapper<Souvenir> {

    @Override
    public Souvenir mapRow(ResultSet rs, int i) throws SQLException {
        Souvenir souvenir = new Souvenir();
        souvenir.setId(rs.getString("id"));
        souvenir.setTitle(rs.getString("title"));
         souvenir.setLacquer(rs.getString("lacquer"));
        souvenir.setFastening(rs.getString("fastening"));
        
         souvenir.setBevel(rs.getString("bevel"));
           souvenir.setLength(rs.getInt("length"));
        souvenir.setWeight(rs.getInt("weight"));
        souvenir.setThickness(rs.getInt("thickness"));
        souvenir.setPrice(rs.getInt("price"));
          souvenir.setPhoto1(rs.getString("photo1"));
        souvenir.setPhoto2(rs.getString("photo2"));
         souvenir.setPhoto3(rs.getString("photo3"));
        souvenir.setPhoto4(rs.getString("photo4"));
        souvenir.setDescription(rs.getString("description"));
        return souvenir;
    }
}

///------------------
//CREATE TABLE IF NOT EXISTS `phones`.`iphone` (
//  `id` INT NOT NULL AUTO_INCREMENT,
//  `model` VARCHAR(255) NULL,
//  `manufacturer` VARCHAR(100) NULL,
//  `year` INT NULL,
//  `type` VARCHAR(45) NULL,
//  `os` VARCHAR(45) NULL,
//  `display_size` INT NULL,
//  `display_resolution` VARCHAR(45) NULL,
//  `ram_memory` INT NULL,
//  `flash_memory` INT NULL,
//  `sim_several` VARCHAR(55) NULL,
//  `camera` VARCHAR(45) NULL,
//  `matrix_points` INT NULL,
//  `design_case` VARCHAR(45) NULL,
//  `material` VARCHAR(45) NULL,
//  `color` VARCHAR(45) NULL,
//  `sim_format` VARCHAR(45) NULL,
//  `dimensions` VARCHAR(255) NULL,
//  `weight` DOUBLE NULL,
//  `battery_type` VARCHAR(55) NULL,
//  `battery_capacity` INT NULL,
//  `battery_removable` VARCHAR(55) NULL,
//  `time_talk` INT NULL,
//  `time_out` INT NULL,
//  `price` INT NULL,
//  `description` TEXT NULL,
//  `photo1` VARCHAR(45) NULL,
//  `photo2` VARCHAR(45) NULL,
//  `photo3` VARCHAR(45) NULL,
//  PRIMARY KEY (`id`))
//ENGINE = InnoDB;
