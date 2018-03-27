using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Comments : MyBase,IDatabase
    {
       
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ProductId { get; set; }
        public string Description { get; set; }


        public  bool Insert()
        {
            Command = CommandBuilder("insert into Comments (userId, productId, description) values (@userId, @productId, @description)");
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@description", Description);

            return ExecuteNq(Command);
        }

        public  bool Update()
        {
            Command = CommandBuilder("update Comments set userId=@userId, description=@description where id=@id");
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@description", Description);
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool Delete()
        {
            Command = CommandBuilder("delete from Comments where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool SelectById()
        {
            if (!Connection())
                return false;

            Command = CommandBuilder("select id, userId, productId, description from Comments where userId=@id");
            Command.Parameters.AddWithValue("@id", UserId);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                Id = Convert.ToInt32(Reader["id"]);
                ProductId = Convert.ToInt32(Reader["productId"]);
                UserId = Convert.ToInt32(Reader["userId"]);
                Description = Reader["description"].ToString();
                return true;
            }
            return false;
        }
        public DataSet Select()
        {
            Command = CommandBuilder("select c.id, u.name from Comments as c left join Users as u on c.usrdId=u.id where c.id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
           return  ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table Comments( id int identity(1,1) primary key,
                                    userId int,[description] varchar(50),foreign key (userId) references Users(id),)");
            return ExecuteNq(Command);
        }
    }
}
