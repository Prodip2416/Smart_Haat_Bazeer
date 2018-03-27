using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class ProductApproved : MyBase, IDatabase
    {

        public int Id { get; set; }
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public DateTime DateTime { get; set; }
        public string Description { get; set; }
        public bool Insert()
        {
            Command = CommandBuilder(@"insert into ProductApproved (productId, userId, date, description) 
                                  values (@productId, @userId, @date, @description)");

            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@description", Description);


            return ExecuteNq(Command);
        }

        public bool Update()
        {
            Command = CommandBuilder(@"update ProductApproved set productId=@productId, userId=@userId, date=@date, description=@description where id=@id");

            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@description", Description);

            Command.Parameters.AddWithValue("@id", Id);

            return ExecuteNq(Command);
        }

        public bool Delete()
        {
            Command = CommandBuilder("delete from ProductApproved where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public bool SelectById()
        {
            Command = CommandBuilder("select id, productId, userId, date, description from ProductApproved where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                ProductId = Convert.ToInt32(Reader["productId"]);
                UserId = Convert.ToInt32(Reader["userId"]);
                DateTime = Convert.ToDateTime(Reader["date"]);
                Description = Reader["description"].ToString();
          
                return true;
            }
            return false;
        }
        public DataSet Select()
        {
            Command = CommandBuilder(@"select pp.id, p.name as product, u.name as user, pp.date, pp.description
                                     from ProductApproved as pp
                                     left join Users as u on p.userId=u.id
                                     left join Product as p on p.productId=p.id
                                      where pp.id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
            return ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table ProductApproved( id int identity(1,1) primary key,productId int, userId int, [date] datetime,
                                        [description] varchar(50), foreign key (userId) references Users(id),
                                        foreign key (productId) references Product(id))");
            return ExecuteNq(Command);
        }
    }
}
