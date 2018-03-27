using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Place:MyBase,IDatabase
    {
       
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int PlaceManager { get; set; }
        public string MapLink { get; set; }
        public string Remarks { get; set; } 


        public  bool Insert()
        {
            Command = CommandBuilder(@"insert into Place (name, description, placeManagerId, mapLink, remarks) values 
                                       (@name, @description, @placeManagerId, @mapLink, @remarks)");

            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@description", Description);
            Command.Parameters.AddWithValue("@placeManagerId", PlaceManager);
            Command.Parameters.AddWithValue("@mapLink", MapLink);
            Command.Parameters.AddWithValue("@remarks", Remarks);

            return ExecuteNq(Command);
        }

        public  bool Update()
        {
            Command = CommandBuilder("update Place set name=@name, description=@description, placeManagerId=@placeManagerId, mapLink=@mapLink, remarks=@remarks where id=@id");
            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@description", Description);
            Command.Parameters.AddWithValue("@placeManagerId", PlaceManager);
            Command.Parameters.AddWithValue("@mapLink", MapLink);
            Command.Parameters.AddWithValue("@remarks", Remarks);
            Command.Parameters.AddWithValue("@id", Id);

            return ExecuteNq(Command);
        }

        public  bool Delete()
        {
            Command = CommandBuilder("delete from Place where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }
        public bool LoadMapLink()
        {
            if (!Connection())
                return false;

            Command = CommandBuilder("select id , placeManagerId, mapLink from Place where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                MapLink = Reader["mapLink"].ToString();
                PlaceManager = Convert.ToInt32(Reader["placeManagerId"]);
                return true;
            }
            return false;
        }
        public  bool SelectById()
        {
            Command = CommandBuilder("select id, name, description, placeManagerId, mapLink, remarks from Place where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                Name = Reader["name"].ToString();
                Description = Reader["description"].ToString();
                PlaceManager = Convert.ToInt32(Reader["placeManagerId"]);
                MapLink = Reader["mapLink"].ToString();
                Remarks = Reader["remarks"].ToString();
                return true;
            }
            return false;
        }

        public DataSet SelectName()
        {
            Command = CommandBuilder("select id, name from Place");
             return ExecuteDs(Command);
        }
        public DataSet Select()
        {
            Command = CommandBuilder(@"select p.id, p.name, p.description, pm.id, pm.name as manager, p.mapLink, p.remarks from Place  as p 
                                       left join PlaceManagers as pm on p.placeManagerId=pm.id where id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
           return  ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table Place ( id int identity(1,1) primary key, name varchar(30) not null,
                                       [description] varchar (500), placeManagerID int, mapLink nvarchar(500), remarks varchar(100),
                                       foreign key (placeManagerID) references PlaceManagers(id))");
            return ExecuteNq(Command);
        }
    }
}
