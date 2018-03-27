using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Users : MyBase, IDatabase
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string MobileNo { get; set; }
        public string Image { get; set; }  
        public DateTime DateTime { get; set; }
        public string Nid { get; set; }
        public string LocalAddress { get; set; }
        public string ParmanentAddress { get; set; }      
        public int CountryId { get; set; }
        public int CityId { get; set; } 
        public string Type { get; set; }
        public string IP { get; set; }

        public bool UserName()
        {
            if (!Connection())
                return false;

            Command = CommandBuilder("select id , name from Users where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                Name = Reader["name"].ToString();
                return true;
            }
            return false;
        }
        public bool Login()
        {
            if (!Connection())
                return false;

            Command = CommandBuilder(@"select id, name, email, password, type from Users where email=@email and password=@password");
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@password", Password);
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                Id = Convert.ToInt32(Reader["id"]);
                Name = Reader["name"].ToString();
                Email = Reader["email"].ToString();
                Password = Reader["password"].ToString();
                Type = Reader["type"].ToString();
                return true;
            }

            return false;
        }

        public bool Insert()
        {
            Command = CommandBuilder(@"insert into Users (name, email, password, mobileNo, image, fileName, date, nId, localAddress, permanentAddress, countryId, cityId, type) 
                                  values (@name, @email, @password, @mobileNo, @image, @fileName, @date, @nId, @localAddress, @permanentAddress, @countryId, @cityId, @type)");

            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@password", Password);
            Command.Parameters.AddWithValue("@mobileNo", MobileNo);
            Command.Parameters.AddWithValue("@image", Image);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@nId", Nid);
            Command.Parameters.AddWithValue("@localAddress", LocalAddress);
            Command.Parameters.AddWithValue("@permanentAddress", ParmanentAddress);
            Command.Parameters.AddWithValue("@countryId", CountryId);
            Command.Parameters.AddWithValue("@cityId", CityId);
            Command.Parameters.AddWithValue("@type", Type);


            return ExecuteNq(Command);
        }
        public bool RegistrationInsert()
        {
            Command = CommandBuilder(@"insert into Users (name, email, mobileNo, password, type) 
                                  values (@name, @email, @mobileNo, @password, @type)");

            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@mobileNo", MobileNo);
            Command.Parameters.AddWithValue("@password", Password);
            Command.Parameters.AddWithValue("@type", Type);
         
           
            return ExecuteNq(Command);
        }

        public bool Update()
        {
            Command = CommandBuilder(@"update Users set  countryId=@countryId, cityId=@cityId, image=@image, date=@date, nId=@nId, 
                         localAddress=@localAddress, permanentAddress=@permanentAddress,ip=@ip
                        where id=@id");

            Command.Parameters.AddWithValue("@countryId", CountryId);
            Command.Parameters.AddWithValue("@cityId", CityId);
            Command.Parameters.AddWithValue("@image", Image);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@nId", Nid);
            Command.Parameters.AddWithValue("@localAddress", LocalAddress);
            Command.Parameters.AddWithValue("@permanentAddress", ParmanentAddress);
            Command.Parameters.AddWithValue("@ip", IP);
            Command.Parameters.AddWithValue("@id", Id);

            return ExecuteNq(Command);
        }

        public bool Delete()
        {
            Command = CommandBuilder("delete from Users where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public bool SelectById()
        {
            Command = CommandBuilder("select id, name, email, password, mobileNo, image, fileName, date, nId, localAddress, permanentAddress, countryId, cityId, type from Users where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                Name = Reader["name"].ToString();
                Email = Reader["email"].ToString();
                Password = Reader["password"].ToString();
                MobileNo = Reader["mobileNo"].ToString();
              
                DateTime = Convert.ToDateTime(Reader["date"]);
                Nid = Reader["nId"].ToString();
                LocalAddress = Reader["localAddress"].ToString();
                ParmanentAddress = Reader["permanentAddress"].ToString();
                CountryId = Convert.ToInt32(Reader["countryId"]);
                CityId = Convert.ToInt32(Reader["cityId"]);
                Type = Reader["type"].ToString();

                return true;
            }
            return false;
        }
        public DataSet Select()
        {
            Command = CommandBuilder(@"select id, name, email, password, mobileNo, image, fileName, date, nId, localAddress, permanentAddress, countryId, cityId, type
                                     from Users where id > 0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
            return ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table Users( id int identity(1,1) primary key, name varchar(20) not null, email varchar(30) not null,
                                       [password] varchar(30),mobileNo varchar(15) not null,[Image] varbinary(MAX),[fileName] varchar(500),
                                       [date] datetime,nId int,localAddress varchar (100),permanentAddress varchar (100),
                                       countryId int, cityId int, [type] varchar(10), foreign key (countryId) references Country(id),
                                       foreign key (cityId) references City(id))");
            return ExecuteNq(Command);
        }
    }
}
