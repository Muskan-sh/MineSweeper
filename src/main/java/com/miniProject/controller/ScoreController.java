package com.miniProject.controller;

import com.miniProject.DAO.PlayerScoreDAO;
import com.miniProject.entity.Level;
import com.miniProject.entity.Player;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/score")
public class ScoreController {
    private static final Logger logger = LogManager.getLogger(ScoreController.class);

    private final PlayerScoreDAO playerScoreDAO;

    @Autowired
    public ScoreController(PlayerScoreDAO playerScoreDAO) {
        this.playerScoreDAO = playerScoreDAO;
    }

    @PostMapping("/collect")
    @ResponseStatus(HttpStatus.OK)
    public String getScore(@RequestBody String jsonString, HttpSession session) {
        JSONObject returnJson = new JSONObject();
        logger.atInfo().log("Request at: /score/collect");
        logger.atDebug().log("request body: {}", jsonString);
        if (session.getAttribute("player") instanceof Player player) {
            JSONObject jsonObject = new JSONObject(jsonString);
            logger.atDebug().log("JSON Object received {}", jsonObject);
            JSONArray time_array = jsonObject.getJSONArray("time");
            double timeTaken = (time_array.getDouble(0) * 60 + time_array.getDouble(1)) * 100
                    + time_array.getDouble(2);
            JSONObject levelDescription = jsonObject.getJSONObject("level");
            Level level = Level.valueOf(levelDescription.getString("levelName"));
            if (jsonObject.getString("result").equals("Win")) {
                playerScoreDAO.saveScore(player, level, timeTaken);
            } else {
                playerScoreDAO.addTimeLoose(player, level, timeTaken);
            }
            returnJson.put("scoreRecorded", true);
        } else {
            logger.atWarn().log("player not authorized");
            returnJson.put("scoreRecorded", false);
        }
        return returnJson.toString();
    }
}
