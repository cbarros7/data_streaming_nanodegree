# Data Streaming Nanodegree

[![lisence](https://img.shields.io/github/license/cbarros7/ml_engineer_nanodegree?style=plastic)](https://github.com/cbarros7/ml_engineer_nanodegree/blob/main/LICENSE)
[![Twitter Carlos](https://img.shields.io/twitter/follow/cbarros27?label=CarlosBarros&style=social)](https://twitter.com/cbarros27)


### Installation 
#### 1. Clone the repository
Use the following command to clone the repository: 

Then enter the [Configuration](./data_streaming_nanodegree-/Configuration/) folder and run the ``config.sh`` command. 

- Give necessary run permissions: ``chmod u+x config.sh``
- Execute the script: ``./config.sh``

Once the script is finished, please copy and paste the following script into the terminal: 
```
export PATH=$PATH:/home/$USER/kafka_2.13-3.1.0/bin
source ~/.bashrc
```

#### 2. First commands
##### Create a topic with 3 partitions and a replica

```
kafka-topics.sh --create --bootstrap-server localhost:9092 --topic "test"  --replication-factor 1 --partitions 1
```

<br>

##### List topics
```
kafka-topics --list --bootstrap-server localhost:9092
```

##### Describe the previously created topic
```
kafka-topics.sh --zookeper localhost:2181 --topic "test" --describe
```


### Disclaimer

This script is based on the course taken at **A Cloud Guru** called [Kafka deep dive](https://github.com/linuxacademy/content-kafka-deep-dive). It has been updated to the latest version of *Zookeeper*. 



<br>

### Acknowledgements :pray:
Thanks to all the teachers, mentors and colleagues of **Udacity** who have been supportive in this nanodegree. It was undoubtedly a great experience both personally and professionally.


For more information about course on Udacity, visit this [link](https://www.udacity.com/course/data-streaming-nanodegree--nd029).

<br>


<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Udacity_logo.svg/1280px-Udacity_logo.svg.png" alt="Coursera logo">
</p>

<br>

### Follow me on :technologist:
[![alt text][1.1]][1]
[![alt text][2.1]][2]
[![alt text][3.1]][3]
[![alt text][4.1]][4]
[![alt text][5.1]][5]
[![alt text][6.1]][6]


<!-- icons with padding -->

[1.1]: https://i.imgur.com/I3n7R1x.png (portfolio)
[2.1]: https://i.imgur.com/AQlyAgc.png (linkedin)
[3.1]: https://i.imgur.com/LuHf8y7.png (twitter)
[4.1]: https://i.imgur.com/iXstsGR.png (github)
[5.1]: https://i.imgur.com/Zijs86N.png (medium)
[6.1]: https://i.imgur.com/Jucrrsg.png (tableau)

<!-- links to your social media accounts -->

[1]: https://carlosbarros.netlify.app/
[2]: https://www.linkedin.com/in/carlosbarros7/
[3]: https://twitter.com/cbarros27
[4]: https://github.com/cbarros7
[5]: https://medium.com/@cbarros7
[6]: https://public.tableau.com/profile/carlos.barros#!/?newProfile=&activeTab=0