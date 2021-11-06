package com.miniProject.entity;

import javax.persistence.*;
import java.io.*;

@Entity
@Table(name = "playerScores", indexes = @Index(name = "highScore", columnList = "level,time"))
public class PlayerScore implements Comparable<PlayerScore>, Externalizable {

    @Serial
    private static final long serialVersionUID = 1547236472549265528L;

    @EmbeddedId
    private PlayerScorePk playerScorePk;
    @Column(name = "time")
    private long time;

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public Level getLevel() {
        return playerScorePk.getLevel();
    }

    public void setLevel(Level level) {
        this.playerScorePk.setLevel(level);
    }

    @Override
    public int compareTo(PlayerScore o) {
        if (this.getLevel() != o.getLevel()) {
            return Level.compare(o.getLevel(), this.getLevel());
        }
        return Long.compare(this.time, o.time);
    }

    @Override
    public void writeExternal(ObjectOutput out) throws IOException {
        out.writeObject(playerScorePk);
        out.writeLong(time);
    }

    @Override
    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        playerScorePk = (PlayerScorePk) in.readObject();
        time = in.readLong();
    }

    @Override
    public String toString() {
        return "PlayerScore{" +
                "playerScorePk=" + playerScorePk +
                ", time=" + time +
                '}';
    }

    @Embeddable
    private static class PlayerScorePk implements Externalizable {
        @Serial
        private static final long serialVersionUID = 17654235627723478L;

        @ManyToOne
        @JoinColumn(foreignKey = @ForeignKey(name = "Fk_player_username"))
        private Player player;

        @Enumerated(EnumType.ORDINAL)
        @Column(name = "level")
        private Level level;

        public Player getPlayer() {
            return player;
        }

        public void setPlayer(Player player) {
            this.player = player;
        }

        public Level getLevel() {
            return level;
        }

        public void setLevel(Level level) {
            this.level = level;
        }

        @Override
        public void writeExternal(ObjectOutput out) throws IOException {
            out.writeObject(player);
            out.writeObject(level);
        }

        @Override
        public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
            player = (Player) in.readObject();
            level = (Level) in.readObject();
        }

        @Override
        public String toString() {
            return "PlayerScorePk{" +
                    "player=" + player +
                    ", level=" + level +
                    '}';
        }

        @Override
        public int hashCode() {
            return super.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj instanceof PlayerScorePk pk) {
                return pk.player.equals(this.player) && pk.level.equals(this.level);
            }
            return false;
        }
    }
}
