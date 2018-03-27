using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Deal : MyBase,IDatabase
    {
       
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public DateTime DateTime { get; set; }
        public int StatusId { get; set; }


        public  bool Insert()
        {
            Command = CommandBuilder("insert into Deal (productId, userId, date, statusId) values (@productId, @userId, @date, @statusId)");
            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@statusId", StatusId);

            return ExecuteNq(Command);
        }

        public  bool Update()
        {
            Command = CommandBuilder("update Deal set productId=@productId, userId=@userId, date=@date, statusId=@statusId where id=@id");
            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@date", DateTime);
            Command.Parameters.AddWithValue("@statusId", StatusId);
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool Delete()
        {
            Command = CommandBuilder("delete from Deal where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool SelectById()
        {
            Command = CommandBuilder("select id, productId, userId, date, statusId name from Deal where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                ProductId = Convert.ToInt32(Reader["productId"]);
                UserId = Convert.ToInt32(Reader["userId"]);
                DateTime = Convert.ToDateTime(Reader["date"]);
                StatusId = Convert.ToInt32(Reader["statusId"]);
                return true;
            }
            return false;
        }
        public DataSet Select()
        {
            Command = CommandBuilder(@"select d.id, p.name as product, u.name as user, date, s.description as status from Deal as d 
                                       left join Product as p on d.productId=p.id 
                                       left join Users as u on d.userId=u.id
                                       left join Status as s on d.statusId=s.id where d.id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
           return  ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table Deal ( id int identity(1,1) primary key, productId int, userId int, [date] datetime,
                                       statusId int,foreign key (statusId) references [Status](id), foreign key (productId) references Product(id),
                                       foreign key (userId) references Users(id))");
            return ExecuteNq(Command);
        }
    }
}
