using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Status : MyBase,IDatabase
    {
        public int Id { get; set; }
        public string Description { get; set; } 


        public  bool Insert()
        {
            Command = CommandBuilder("insert into Status ( description) values (@description)");
            Command.Parameters.AddWithValue("@description", Description);

            return ExecuteNq(Command);
        }

        public  bool Update()
        {
            Command = CommandBuilder("update Status set description=@description where id=@id");
            Command.Parameters.AddWithValue("@description", Description);
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool Delete()
        {
            Command = CommandBuilder("delete from Status where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool SelectById()
        {
            Command = CommandBuilder("select id, description from Status where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                Description = Reader["description"].ToString();
                return true;
            }
            return false;
        }
        public DataSet Select()
        {
            Command = CommandBuilder("select id, description from Status  where id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
           return  ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table Messages( id int identity(1,1) primary key, userId int, [description] varchar(50),
                                       foreign key (userId) references Users(id))");
            return ExecuteNq(Command);
        }
    }
}
