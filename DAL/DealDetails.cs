using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class DealDetails : MyBase,IDatabase
    {
       
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int PlaceId { get; set; }
        public int UserId { get; set; }
        public DateTime DateTime { get; set; }
        public string Remarks { get; set; }

        public  bool Insert()
        {
            Command = CommandBuilder(@"insert into DealDetails (productId, placeId, userId, date, remarks) values 
                                       (@productId, @placeId, @userId, @date, @remarks)");

            Command.Parameters.AddWithValue("@productId", ProductId);
            Command.Parameters.AddWithValue("@placeId", PlaceId);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@remarks", Remarks);

            return ExecuteNq(Command);
        }

        public  bool Update()
        {
            Command = CommandBuilder("update DealDetails set dealId=@dealId, placeId=@placeId, userId=@userId, date=@date, remarks=@remarks where id=@id");
            Command.Parameters.AddWithValue("@dealId", ProductId);
            Command.Parameters.AddWithValue("@placeId", PlaceId);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@remarks", Remarks);

            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool Delete()
        {
            Command = CommandBuilder("delete from DealDetails where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public  bool SelectById()
        {
            Command = CommandBuilder("select id, dealId, placeId, userId, date, remarks name from DealDetails where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                ProductId = Convert.ToInt32(Reader["dealId"]);
                PlaceId = Convert.ToInt32(Reader["placeId"]);
                UserId = Convert.ToInt32(Reader["userId"]);
                DateTime = Convert.ToDateTime(Reader["date"]);
                Remarks = Reader["remarks"].ToString();
                return true;
            }
            return false;
        }
        public DataSet Select()
        {
            Command = CommandBuilder(@"select dd.id, d.name as deal, p.name as place, u.name as user, date, dd.remarks from DealDetails as dd 
                                       left join Deal as d on dd.dealId=d.id
                                       left join Place as p on dd.placeId=p.id 
                                       left join Users as u on dd.userId=u.id
                                      where d.id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
           return  ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table DealDetails ( id int identity(1,1) primary key, dealId int, placeId int, userId int, [date] datetime,
                                       remarks varchar(500), foreign key(dealId) references Deal(id),
                                       foreign key(placeId) references Place(id),foreign key(userId) references Users(id))");
            return ExecuteNq(Command);
        }
    }
}
