CREATE DATABASE SignWave;

USE SignWave;


CREATE TABLE wlasl (
    word VARCHAR(25) NOT NULL,
    path VARCHAR(250) NOT NULL
);


INSERT INTO wlasl (word, path)
VALUES
('About', 'C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\about%0A.webm'),
('All', 'C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\all.webm'),
('But', 'C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\but%0A.webm'),
('Can','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\can.webm'),
('Do','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\do-.webm'),
('Each','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\each.webm'),
('From','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\from-.webm'),
('Had','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\had.webm'),
('Hot','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\hot.webm'),
('How','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\How.webm'),
('If','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\if.webm'),
('Many','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\many-%0A.webm'),
('Or','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\or.webm'),
('Other','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\other.webm'),
('Out','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\out.webm'),
('Said','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\said.webm'),
('She','C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\she.webm'),
('Some', 'C:\Users\hirus\OneDrive\Desktop\SignWave\signs translations\some.webm');


SELECT word, path
From wlasl;
