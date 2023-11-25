let playlist = [];
let n_songs = 0;
let audio_index = 0;

function addSongToPlaylist(songID, songName, songAuthor) {
    let song = {
        filePath: `songs/song${songID}.mp3`,
        name: `${songName}`,
        author: `${songAuthor}`
    };
    playlist.push(song);
    n_songs += 1;
    loadSong();
    document.getElementById("audio-player").pause();
}

function createNewPlaylist(songID, songName, songAuthor) {
    let song = {
        filePath: `songs/song${songID}.mp3`,
        name: `${songName}`,
        author: `${songAuthor}`
    };
    playlist = [];
    playlist.push(song);
    audio_index = 0;
    n_songs = 1;
    playSingleSong();
}
function playSingleSong() {
    document.getElementById("audio-player").pause();
    let cur_song_file = playlist[audio_index].filePath;
    document.getElementById("audio-player").setAttribute('src', cur_song_file);
    document.getElementById("audio-player").load();
    document.getElementById("audio-player").play();
    document.getElementById("songName").innerText = `${playlist[audio_index].name}`;
    document.getElementById("songAuthor").innerText = `${playlist[audio_index].author}`;
    document.getElementById("audio-player").onended = function () {
        playNext();
    };
}

function loadSong() {
    document.getElementById("audio-player").pause();
    let cur_song_file = playlist[audio_index].filePath;
    document.getElementById("audio-player").setAttribute('src', cur_song_file);
    document.getElementById("audio-player").load();
    document.getElementById("audio-player").play();
    document.getElementById(`song${audio_index}`).classList.add("active-song");
    document.getElementById("songName").innerText = `${playlist[audio_index].name}`;
    document.getElementById("songAuthor").innerText = `${playlist[audio_index].author}`;
    document.getElementById("audio-player").onended = function () {
        playNext();
    };
}

function playNext() {
    try {
        document.getElementById(`song${audio_index}`).classList.remove("active-song");
    }
    catch (err) {
        
    }
    
    if (n_songs > 1) {
        if (audio_index + 1 === n_songs) {
            audio_index = 0;
        } else {
            audio_index += 1;
        }
    }
    loadSong();
}

function playPrevious() {
    try {
        document.getElementById(`song${audio_index}`).classList.remove("active-song");
    }
    catch (err) {
        
    }
    if (n_songs > 1) {
        if (audio_index === 0) {
            audio_index = n_songs - 1;
        } else {
            audio_index -= 1;
        }
    }
    loadSong();
}

function playChosenSong(songIndex) {
    document.getElementById(`song${audio_index}`).classList.remove("active-song");
    audio_index = songIndex;
    loadSong();
}
