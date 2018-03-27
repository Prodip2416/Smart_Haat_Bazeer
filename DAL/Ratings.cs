using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Ratings : MyBase,IDatabase
    {
       
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }      

        public  bool Insert()
        {
            Command = CommandBuilder("insert into Ratings (userId, productId) values (@userId, @productId)");
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@productId", ProductId);

            return ExecuteNq(Command);
        }

        public  bool Update()
        {
            Command = CommandBuilder("update Ratings set userId=@userId where id=@id");
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool Delete()
        {
            Command = CommandBuilder("delete from Ratings where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool SelectById()
        {
            Command = CommandBuilder("select id, userId from Ratings where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                UserId = Convert.ToInt32(Reader["name"]);
                return true;
            }
            return false;
        }
        public DataSet Select()
        {
            Command = CommandBuilder("select r.id, u.name as user from Ratings as r left join Users as u on r.userId=u.id where id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
           return  ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table Ratings ( id int identity(1,1)primary key,
                                       userId int,foreign key (userId) references Users(id),)");
            return ExecuteNq(Command);
        }
    }
}
