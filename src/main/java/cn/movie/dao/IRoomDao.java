package cn.movie.dao;

import cn.movie.beans.Room;

public interface IRoomDao {
    void delRoom(String room_id);

    void addRoom(Room room);
}
