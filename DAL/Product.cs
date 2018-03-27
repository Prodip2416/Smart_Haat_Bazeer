using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Product : MyBase, IDatabase
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public string Tag { get; set; }
        public byte[] Image { get; set; }
        public string FileName { get; set; }
        public double Price { get; set; }
        public DateTime DateTime { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; } 
        public int UserId { get; set; }
        public string Ip { get; set; }
        public string UpdateHistory { get; set; }
        public int MessagesId { get; set; }
        public int CommentId { get; set; }
        public int RatingId { get; set; }
        public int StatusId { get; set; }
        public bool Insert()
        {
            Command = CommandBuilder(@"insert into Product (name, tag, image, fileName, price, date, description, userId, ip, updateHistory, messageId, commentId, ratingId, statuId) 
                                  values (@name, @tag, @image, @fileName, @price, @date, @description, @userId, @ip, @updateHistory, @messageId, @commentId, @ratingId, @statuId)");

            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@tag", Tag);
            Command.Parameters.AddWithValue("@image", Image);
            Command.Parameters.AddWithValue("@fileName", FileName);
            Command.Parameters.AddWithValue("@price", Price);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@description", Description);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@ip", Ip);
            Command.Parameters.AddWithValue("@updateHistory", UpdateHistory);
            Command.Parameters.AddWithValue("@messageId", MessagesId);
            Command.Parameters.AddWithValue("@commentId", CommentId);
            Command.Parameters.AddWithValue("@ratingId", RatingId);
            Command.Parameters.AddWithValue("@statuId", StatusId);


            return ExecuteNq(Command);
        }

        public bool Update()
        {
            Command = CommandBuilder(@"update Product set name=@name, tag=@tag, image=@image, fileLink=@fileLink, price=@price, date=@date, description=@description,
                                    userId=@userId, ip=@ip, updateHistory=@updateHistory, messageId=@messageId, commentId=@commentId, ratingId=@ratingId,
                                    statuId=@statuId where id=@id");

            Command.Parameters.AddWithValue("@name", Name);
            Command.Parameters.AddWithValue("@tag", Tag);
            Command.Parameters.AddWithValue("@image", Image);
            Command.Parameters.AddWithValue("@fileName", FileName);
            Command.Parameters.AddWithValue("@price", Price);
            Command.Parameters.AddWithValue("@date", DateTime.ToShortDateString());
            Command.Parameters.AddWithValue("@description", Description);
            Command.Parameters.AddWithValue("@userId", UserId);
            Command.Parameters.AddWithValue("@ip", Ip);
            Command.Parameters.AddWithValue("@updateHistory", UpdateHistory);
            Command.Parameters.AddWithValue("@messageId", MessagesId);
            Command.Parameters.AddWithValue("@commentId", CommentId);
            Command.Parameters.AddWithValue("@ratingId", RatingId);
            Command.Parameters.AddWithValue("@statuId", StatusId);

            Command.Parameters.AddWithValue("@id", Id);

            return ExecuteNq(Command);
        }

        public bool Delete()
        {
            Command = CommandBuilder("delete from Product where id=@id");
            Command.Parameters.AddWithValue("@id", Id);
            return ExecuteNq(Command);
        }

        public bool SelectName()
        {
            if (!Connection())
                return false;

            Command = CommandBuilder(@"select id, name from Product where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                Name = Reader["name"].ToString();
                return true;
            }
            return false;
        }

        public bool SelectById()
        {
            Command = CommandBuilder("select id, name, tag, image, fileName, price, date, description, userId, ip, updateHistory, messageId, commentId, ratingId, statuId from Product where id=@id");
            Command.Parameters.AddWithValue("@id", Id);

            Reader = ExecuteReader(Command);
            while (Reader.Read())
            {
                Name = Reader["name"].ToString();
                Tag = Reader["tag"].ToString();
                Image = (byte[])(Reader["image"]);
                FileName = Reader["fileLink"].ToString();
                Price = Convert.ToDouble(Reader["price"]);
                DateTime = Convert.ToDateTime(Reader["date"]);
                Description = Reader["description"].ToString();
                UserId = Convert.ToInt32(Reader["userId"]);
                Ip = Reader["ip"].ToString();
                UpdateHistory = Reader["updateHistory"].ToString();
                MessagesId = Convert.ToInt32(Reader["messageId"]);
                CommentId = Convert.ToInt32(Reader["commentId"]);
                RatingId = Convert.ToInt32(Reader["ratingId"]);
                StatusId = Convert.ToInt32(Reader["statuId"]);
                return true;
            }
            return false;
        }

        public DataSet SelectClient()
        {
            Command = CommandBuilder(@"SELECT [id], [name], [tag], [fileName], [price], [date],
                             [description], [categoryId], [category], [updateHistory], [user], [Rating], [Comments],
                             [status] FROM [vwProduct] WHERE id > 0");

            if (CategoryId > 0)
            {
                string s = "";
                LoadSubCategory(CategoryId, ref s);
                Command.CommandText += " and categoryId in ("+ s +CategoryId.ToString()+")";        
            }
            return ExecuteDs(Command);
        }

        private void LoadSubCategory(int categoryId, ref string s)
        {
            Category c= new Category();
            DataTable dt = c.Select(" where c.categoryId=" + categoryId.ToString()).Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += dt.Rows[i].ItemArray[0].ToString() + " ,";
                LoadSubCategory(Convert.ToInt32(dt.Rows[i].ItemArray[0]),ref s);
            }
        }

        public DataSet Select()
        {
            Command = CommandBuilder(@"select p.id, p.name, p.tag, p.image, p.fileName, p.price, p.date, p.description, u.name as [user],
                                     p.ip, p.updateHistory, m.description as message, c.description as comment, r.id as rating, s.description as status
                                     from Product as p
                                     left join Users as u on p.userId=u.id
                                     left join Messages as m on p.messageId=m.id
                                     left join Comments as c on p.commentId=c.id
                                     left join Ratings as r on p.ratingId=r.id
                                     left join Status as s on p.statuId=s.id where p.id>0");

            if (!string.IsNullOrEmpty(Search))
            {
                Command.CommandText += " and name like @search";
                Command.Parameters.AddWithValue("@search", "%" + Search + "%");
            }
            return ExecuteDs(Command);
        }
        public bool Table()
        {
            Command = CommandBuilder(@"create table Product ( id int identity(1,1) primary key, name varchar(30) not null, tag varchar(20),
                                       [image] varbinary(MAX), [fileName] varchar(500), price float, [date] datetime, [description] varchar(100),
                                       userId int, ip varchar(15), updateHistory varchar(20), messageId int, commentId int, ratingId int, statuId int, foreign key (messageId) references Messages(id),
                                       foreign key (commentId) references Comments(id),
                                       foreign key (ratingId) references Ratings(id),
                                       foreign key (statuId) references [Status](id))");
            return ExecuteNq(Command);
        }
    }
}
