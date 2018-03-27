using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Owin.Security.DataHandler.Encoder;


namespace DAL
{
    public class PlaceManagers : MyBase,IDatabase
    {
       
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string MobileNo { get; set; }
        public string Image { get; set; }
        public string FileName { get; set; } 


        public  bool Insert()
        {
            Command = CommandBuilder(@"insert into PlaceManagers (name, email, mobileNo, image, fileName) values 
                                       (@name, @email, @mobileNo, @image, @fileName)");

            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@mobileNo", MobileNo);
            Command.Parameters.AddWithValue("@image", Image);
            Command.Parameters.AddWithValue("@fileName", FileName);

            return ExecuteNq(Command);
        }

        public  bool Update()
        {
            Command = CommandBuilder("update PlaceManagers set name=@name, email=@email, mobileNo=@mobileNo, image=@image, fileName=@fileName where id=@id");
            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@mobileNo", MobileNo);
            Command.Parameters.AddWithValue("@image", Image);
            Command.Parameters.AddWithValue("@fileName", FileName);
            Command.Parameters.AddWithValue("@id", Id);

            return ExecuteNq(Command);
        }

        public  bool Delete()
        {
            Command = CommandBuilder("delete from PlaceManagers where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }
        public bool LoadManagerDetails()   
        {
            if (!Connection())
                return false;

            Command = CommandBuilder("select id , name, mobileNo, image from PlaceManagers where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                Name = Reader["name"].ToString();
                MobileNo = Reader["mobileNo"].ToString();
                Image = Reader["image"].ToString();
                return true;
            }
            return false;
        }

        public  bool SelectById()
        {
            Command = CommandBuilder("select id, name, email, mobileNo, image, fileName from PlaceManagers where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                Name = Reader["name"].ToString();
                Email = Reader["email"].ToString();
                MobileNo = Reader["mobileNo"].ToString();
              //  Image =(byte[])Reader["image"];
                FileName = Reader["fileName"].ToString();
                return true;
            }
            return false;
        }

        public DataSet SelectId(int id)
        {
            Command = CommandBuilder("select id, name, email, mobileNo, Image from PlaceManagers where id=@id");
            Command.Parameters.AddWithValue("@id", id);
            return ExecuteDs(Command);
        }
        public DataSet Select()
        {
            Command = CommandBuilder(@"select id, name, email, mobileNo, image from PlaceManagers where id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
           return  ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table PlaceManagers( id int identity(1,1) primary key, name varchar(30) not null, email varchar(30),
                                       mobileNo varchar(15), [image] varbinary(MAX), [fileName] varchar(500))");
            return ExecuteNq(Command);
        }
    }
}
