

npm install react-native-reanimated react-navigation react-navigation-stack

Basic things:
-	Alart model with showing different values..
-	Dark and ligh mode
-	Animation and transition
-	Text input values
-	Stack navigation
-	Background images
-	Knowledge about css



Alert button:

import React, {useState} from 'react';
import {View, Button, Alert} from 'react-native';

export default App = () =>{
  const [no,setNo] = useState(0);
  const show= () =>{
    setNo(no+1);
    Alert.alert('Button clicked', `you clicked the button! ${no}`, [
      {text: 'Ok', onPress: ()=>console.log("pressed")},
    ]);
  };
  return(
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Button title="CLicke me" onPress={show}></Button>
    </View>
  )
}

Dark- light mode:

import React, { useEffect, useState } from 'react';
import { View, Text, Button, useColorScheme } from 'react-native';

const App = () => {
  const colorScheme = useColorScheme();
  const [theme, setTheme] = useState(colorScheme);

  useEffect(() => {
    setTheme(colorScheme);
  }, [colorScheme]);

  const toggleTheme = () => {
    const newTheme = theme === 'light' ? 'dark' : 'light';
    setTheme(newTheme);
  };

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: theme === 'dark' ? '#333' : '#fff' }}>
      <Text style={{ color: theme === 'dark' ? '#fff' : '#333', fontSize: 24 }}>Hello, World!</Text>
      <Button title={`Toggle ${theme === 'light' ? 'Dark' : 'Light'} Mode`} onPress={toggleTheme} />
    </View>
  );
};

export default App;





Text input value

import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';

const MyForm = () => {
  const [name, setName] = useState('');
  const [password, setPassword] = useState('');

  const handleReset = () => {
    setName('');
    setPassword('');
  };

  const handleSubmit = () => {
    // Handle the form submission logic here
    // For simplicity, just logging the input values
    console.log('Name:', name);
    console.log('Password:', password);
  };

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Name:</Text>
      <TextInput
        style={styles.input}
        placeholder="Enter your name"
        value={name}
        onChangeText={(text) => setName(text)}
      />

      <Text style={styles.label}>Password:</Text>
      <TextInput
        style={styles.input}
        placeholder="Enter your password"
        secureTextEntry
        value={password}
        onChangeText={(text) => setPassword(text)}
      />

      <View style={styles.buttonContainer}>
        <Button title="Submit" onPress={handleSubmit} />
        <Button title="Reset" onPress={handleReset} />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  label: {
    fontSize: 18,
    marginBottom: 5,
  },
  input: {
    height: 40,
    width: 300,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 10,
    paddingLeft: 10,
  },
  buttonContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    width: '100%',
    marginTop: 20,
  },
});

export default MyForm;


1.	Book store
App.js

import React, { useState } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import AddBook from './components/AddBook';
import ShowBooks from './components/ShowBooks';

const Stack = createStackNavigator();

const App = () => {
  const [books, setBooks] = useState([]);

  const addBook = (book) => {
    setBooks([...books, book]);
  };

  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="AddBook">
        <Stack.Screen name="AddBook">
          {() => <AddBook addBook={addBook} />}
        </Stack.Screen>
        <Stack.Screen name="ShowBooks" component={ShowBooks} initialParams={{ books }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;

components/vAddBook

import React, {useState} from 'react';
import {View, Text, TextInput, Button, StyleSheet, ImageBackground}  from 'react-native';
import {useNavigation} from '@react-navigation/native';

const AddBook = () =>{
    const navigation = useNavigation();
    const [name, setName] = useState('');
    const [isbn, setIsbn] = useState('');
    const [author, setAuthor] = useState('');

    return(
        <ImageBackground source={require('../assets/OIP.jpeg')} style={StyleSheet.background}>
            <View style={styles.container}>
                <Text style={styles.heading}>Add a book</Text>
                <TextInput
                placeholder="Enter book anme"
                value={name}
                onChangeText={setName}
                style={styles.input}
                />
                <TextInput
                placeholder="Enter author anme"
                value={author}
                onChangeText={setAuthor}
                style={styles.input}
                /><TextInput
                placeholder="Enter book anme"
                value={author}
                onChangeText={setAuthor}
                style={styles.input}
                />

<TextInput
                placeholder="Enter book anme"
                value={name}
                onChangeText={setName}
                style={styles.input}
                />s
            </View>
        </ImageBackground>
    );
};

export default AddBook;

components/showBook

import React from 'react';
import { View, Text, FlatList, StyleSheet, ImageBackground } from 'react-native';

const ShowBooks = ({ route }) => {
  const books = route.params.books || [];

  return (
    <ImageBackground source={require('../assets/b.jpeg')} style={styles.background}>
      <View style={styles.container}>
        <Text style={styles.heading}>Books Added</Text>
        <FlatList
          data={books}
          keyExtractor={(item) => item.isbn}
          renderItem={({ item }) => (
            <View style={styles.bookContainer}>
              <Text style={styles.bookText}>{`Book Name: ${item.name}`}</Text>
              <Text style={styles.bookText}>{`ISBN: ${item.isbn}`}</Text>
            </View>
          )}
        />
      </View>
    </ImageBackground>
  );
};

const styles = StyleSheet.create({
  background: {
    flex: 1,
    resizeMode: 'cover',
    justifyContent: 'center',
    alignItems: 'center',
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  heading: {
    fontSize: 24,
    margin: 30,
    fontWeight: 'bold',
    color: 'black',
    marginBottom: 20,
    padding: 10,
    backgroundColor: 'rgba(255, 255, 255, 0.7)',
  },
  bookContainer: {
    backgroundColor: 'rgba(255, 255, 255, 0.7)',
    padding: 15,
    marginBottom: 15,
    width: '80%',
    borderRadius: 10,
  },
  bookText: {
    fontSize: 16,
    marginBottom: 5,
  },
});

export default ShowBooks;

2 blog
npm install react-native-reanimated
npx react-native link react-native-reanimated
// App.js
import React from 'react';
import { ScrollView } from 'react-native';
import BlogPost from './BlogPost';

const App = () => {
  return (
    <ScrollView>
      <BlogPost
        title="Sample Blog Post"
        description="This is a sample blog post description. Like it if you enjoy!"
        imageUri="https://picsum.photos/200/300"
      />
      {/* Add more BlogPost components as needed */}
    </ScrollView>
  );
};

export default App;

// BlogPost.js
import React, { useState } from 'react';
import { View, Text, Image, TouchableOpacity, StyleSheet } from 'react-native';

const BlogPost = ({ title, description, imageUri }) => {
  const [liked, setLiked] = useState(false);
  const [likeCount, setLikeCount] = useState(0);

  const handleLikePress = () => {
    setLiked(!liked);
    setLikeCount(liked ? likeCount - 1 : likeCount + 1);
  };

  return (
    <View style={styles.container}>
      <Image source={{ uri: imageUri }} style={styles.image} />
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.description}>{description}</Text>
      <TouchableOpacity onPress={handleLikePress} style={[styles.likeButton, { backgroundColor: liked ? 'red' : 'grey' }]}>
        <Text style={styles.likeText}>{liked ? 'Liked!' : 'Like'}</Text>
      </TouchableOpacity>
      <Text style={styles.likeCount}>{likeCount} likes</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    margin: 10,
    padding: 10,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#ddd',
  },
  image: {
    width: '100%',
    height: 200,
    borderRadius: 8,
    marginBottom: 10,
  },
  title: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 5,
  },
  description: {
    fontSize: 16,
    marginBottom: 10,
  },
  likeButton: {
    backgroundColor: 'grey',
    padding: 10,
    borderRadius: 5,
    alignItems: 'center',
  },
  likeText: {
    color: 'white',
    fontWeight: 'bold',
  },
  likeCount: {
    marginTop: 5,
    fontSize: 14,
    color: 'grey',
  },
});

export default BlogPost;


// not in 
4 navigation for popular movie list (dark theme not working)

import React,{useState, useEffect} from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { View, Text, Button, useColorScheme } from 'react-native';

function HomeScreen() {

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>A</Text>
      <Text>b</Text>
      <Text>c</Text>
      <Text>d</Text>
    </View>
  );
}

function SettingsScreen() {
  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text>Some Favorite tv 1!</Text>
      <Text>Some Favorite tv 2!</Text>
      <Text>Some Favorite tv 3!</Text>
      <Text>Some Favorite tv 4!</Text>
    </View>
  );
}

const Tab = createBottomTabNavigator();

export default function App() {
  const colorScheme = useColorScheme();
  const [theme, setTheme] = useState(colorScheme);

  useEffect(() => {
    setTheme(colorScheme);
  }, [colorScheme]);

  const toggleTheme = () => {
    const newTheme = theme === 'light' ? 'dark' : 'light';
    setTheme(newTheme);
  };

  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="Popular Movie list" component={HomeScreen} />
        <Tab.Screen name="Settings" component={SettingsScreen} />
      </Tab.Navigator>
      <Button title={`Toggle ${theme === 'light' ? 'Dark' : 'Light'} Mode`} onPress={toggleTheme} />
    </NavigationContainer>
  );
}



5 check the own work clock, digital clock ,timer ,set timer


import React, { useState } from 'react';
import { View, Text, TouchableOpacity, StatusBar } from 'react-native';
import { DefaultTheme, DarkTheme, Provider as PaperProvider } from 'react-native-paper';


const App = () => {
  const [isDarkMode, setIsDarkMode] = useState(false);

  const theme = isDarkMode ? DarkTheme : DefaultTheme;

  const toggleDarkMode = () => {
    setIsDarkMode(!isDarkMode);
  };

  return (
    <PaperProvider theme={theme}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: theme.colors.background }}>
        <Text style={{ fontSize: 24, marginBottom: 20, color: theme.colors.text }}>React Native Dark/Light Mode</Text>
        <TouchableOpacity onPress={toggleDarkMode} style={{ padding: 10, backgroundColor: theme.colors.primary }}>
          <Text style={{ fontSize: 18, color: theme.colors.text }}>Toggle {isDarkMode ? 'Light' : 'Dark'} Mode</Text>
        </TouchableOpacity>
      </View>
    </PaperProvider>
  );
};

export default App;



/*
import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet } from 'react-native';

const App = () => {
  const [currentTime, setCurrentTime] = useState('');

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentTime(getFormattedTime());
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  const getFormattedTime = () => {
    const now = new Date();
    const hours = now.getHours();
    const minutes = now.getMinutes();
    const seconds = now.getSeconds();

    return `${formatTimeUnit(hours)}:${formatTimeUnit(minutes)}:${formatTimeUnit(seconds)}`;
  };

  const formatTimeUnit = (unit) => {
    return unit < 10 ? `0${unit}` : `${unit}`;
  };

  return (
    <View style={styles.container}>
      <Text style={styles.clockText}>{currentTime}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  clockText: {
    fontSize: 48,
  },
});

export default App;
*/


/*
import React, { useState, useEffect } from 'react';
import { View, Text, Button, StyleSheet } from 'react-native';

const TimerApp = () => {
  const [time, setTime] = useState(0);
  const [isRunning, setIsRunning] = useState(false);

  useEffect(() => {
    let timerInterval;

    if (isRunning) {
      timerInterval = setInterval(() => {
        setTime((prevTime) => prevTime + 1);
      }, 1000);
    } else {
      clearInterval(timerInterval);
    }

    return () => clearInterval(timerInterval);
  }, [isRunning]);

  const startTimer = () => {
    setIsRunning(true);
  };

  const stopTimer = () => {
    setIsRunning(false);
  };

  const resetTimer = () => {
    setTime(0);
    setIsRunning(false);
  };

  return (
    <View style={styles.container}>
      <Text style={styles.timerText}>{formatTime(time)}</Text>
      <View style={styles.buttonContainer}>
        <Button title="Start" onPress={startTimer} />
        <Button title="Stop" onPress={stopTimer} />
        <Button title="Reset" onPress={resetTimer} />
      </View>
    </View>
  );
};

const formatTime = (timeInSeconds) => {
  const minutes = Math.floor(timeInSeconds / 60);
  const seconds = timeInSeconds % 60;

  return `${formatUnit(minutes)}:${formatUnit(seconds)}`;
};

const formatUnit = (unit) => {
  return unit < 10 ? `0${unit}` : unit;
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  timerText: {
    fontSize: 48,
  },
  buttonContainer: {
    flexDirection: 'row',
    marginTop: 20,
  },
});

export default TimerApp;

*/


6 .  Feedback form for name, course, email, feedback star

import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, StyleSheet } from 'react-native';

const FeedbackForm = ({ navigation }) => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [feedback, setFeedback] = useState('');
  const [errors, setErrors] = useState({});
  const [course, setCourse] = useState('');

  const handleFormSubmit = () => {
    // Perform form validation
    const errors = {};

    if (!name.trim()) {
      errors.name = 'Name is required';
    }

    if (!email.trim()) {
      errors.email = 'Email is required';
    } else if (!isValidEmail(email)) {
      errors.email = 'Invalid email format';
    }

    if (!feedback.trim() || feedback>5) {
      errors.feedback = 'Feedback is required';
    }

    if (Object.keys(errors).length > 0) {
      setErrors(errors);
      return;
    }

    console.log('Name:', name);
    console.log('Email:', email);
    console.log('Feedback:', feedback);

    alert('Feedback submitted successfully!');
    setCourse('');
    setEmail('');
    setName('');
    setFeedback('');
  };

  const isValidEmail = (email) => {
    // Simple email format validation using a regular expression
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  };

  return (
      <View style={styles.container}>
        <Text style={styles.label}>Name</Text>
        <TextInput
          style={styles.input}
          placeholder="Enter your name"
          value={name}
          onChangeText={setName}
        />
        {errors.name && <Text style={styles.errorText}>{errors.name}</Text>}

        <Text style={styles.label}>Course</Text>
        <TextInput
          style={styles.input}
          placeholder="Enter your Course"
          value={course}
          onChangeText={setCourse}
        />
        {errors.name && <Text style={styles.errorText}>{errors.name}</Text>}

        <Text style={styles.label}>Email</Text>
        <TextInput
          style={styles.input}
          placeholder="Enter your email"
          value={email}
          onChangeText={setEmail}
        />
        {errors.email && <Text style={styles.errorText}>{errors.email}</Text>}

        <Text style={styles.label}>Feedback</Text>
        <TextInput
          style={styles.input}
          placeholder="Enter your feedback"
          multiline
          value={feedback}
          onChangeText={setFeedback}
        />
        {errors.feedback && <Text style={styles.errorText}>{errors.feedback}</Text>}

        <TouchableOpacity style={styles.submitButton} onPress={handleFormSubmit}>
          <Text style={styles.submitButtonText}>Submit</Text>
        </TouchableOpacity>
      </View>
  );
};

const styles = StyleSheet.create({
  backgroundImage: {
    flex: 1,
    resizeMode: 'cover', // You can use 'contain' or 'stretch' if you prefer
    justifyContent: 'center',
  },
  container: {
    padding: 20, // Add padding to the container
    alignContent:'center',
  },
  label: {
    fontSize: 16,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 16,
    paddingHorizontal: 10,
  },
  errorText: {
    color: 'red',
    marginBottom: 8,
  },
  submitButton: {
    backgroundColor: 'blue',
    padding: 10,
    borderRadius: 5,
    alignItems: 'center',
  },
  submitButtonText: {
    color: 'white',
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default FeedbackForm;

7.get location and put in notification
import React, { useState } from 'react';
import { View, TextInput, Button, Alert, ImageBackground, StyleSheet } from 'react-native';
import Geolocation from 'react-native-geolocation-service';

// ... rest of your code

const App = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = () => {
    // Implement your login logic here
    // For now, let's show an alert with the entered credentials
    Alert.alert('Login', `Email: ${email}\nPassword: ${password}`);
  };

  return (
    <ImageBackground source={require('./assets/c.png')} style={styles.backgroundImage}>
      <View style={styles.container}>
        <TextInput
          style={styles.input}
          placeholder="Email"
          value={email}
          onChangeText={setEmail}
        />
        <TextInput
          style={styles.input}
          placeholder="Password"
          secureTextEntry
          value={password}
          onChangeText={setPassword}
        />
        <Button title="Login" onPress={handleLogin} />
      </View>
    </ImageBackground>
  );
};
const handleLocation = () => {
    Geolocation.getCurrentPosition(
      position => {
        const { latitude, longitude } = position.coords;
        Alert.alert('Location', `Latitude: ${latitude}\nLongitude: ${longitude}`);
        // Implement logic to generate a notification here
      },
      error => Alert.alert('Error', error.message),
      { enableHighAccuracy: true, timeout: 20000, maximumAge: 1000 },
    );
  };
  

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  input: {
    height: 40,
    width: '80%',
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 20,
    paddingHorizontal: 10,
  },
  backgroundImage: {
    flex: 1,
    resizeMode: 'cover',
    justifyContent: 'center',
  },
});

export default App;




8 bmi calculator


import React, {useState} from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';

import { TextInput, View,Text,Button ,StyleSheet,ImageBackground} from 'react-native';

const tab = createBottomTabNavigator();

const firsScreen =() =>{
  const [height, setHeight]= useState('');
  const [weight, setWeight] = useState('');
  const workFun =() =>{
    let val = (weight/(height*height));
    alert(val);
  }
  return(
    <ImageBackground source={require('./assets/c.png')} 
    style={styles.backgroundImage}>
    <View style={styles.container}>
      <Text style={styles.label}>Height</Text>
      <TextInput style={styles.input} 
      placeholder='Enter your height'
      value={height}
      onChangeText={setHeight}
      />
      <Text style={styles.label}>Weight</Text>
      <TextInput style={styles.input} 
      placeholder='Enter your weight'
      value={weight}
      onChangeText={setWeight}
      />
      <Button title='Submit' onPress={workFun}></Button>
    </View>
    </ImageBackground>
  );  
}
const SecondScreen = ()=>{
    return(
        <View>
            <Text>Second page</Text>
        </View>
    )
}
const App = () =>{

    return(
        <NavigationContainer>
            <tab.Navigator>
                <tab.Screen name="first" component={firsScreen}/>
                <tab.Screen name="second" component={SecondScreen} />
            </tab.Navigator>
        </NavigationContainer>
    )
}

const styles=StyleSheet.create({
  conatiner:{
    flex:1,
    alignContent:'center',
    justifyContent:'center',
  },
  label:{
    fontSize:16,
    fontWeight:'bold',
    marginBottom:8,
  },
  input:{
    height:40,
    borderColor:'gray',
    borderWidth:1,
    marginBottom:16,
    paddingHorizontal:10,
  },
  backgroundImage: {
    flex: 1,
    resizeMode: 'cover', // or 'stretch' for a different effect
  },

})

export default App;


9
°C = (°F – 32) * 5/9
°F = °C * 9/5 + 32

import React, { useState } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';

import { TextInput, View, Text, Button, StyleSheet, ImageBackground } from 'react-native';

const Tab = createBottomTabNavigator();

const FirstScreen = () => {
  const [height, setHeight] = useState('');

  const workFun = () => {
    let f = (height * 9) / 5 + 32;
    alert(f);
  };

  return (
    <ImageBackground source={require('./assets/c.png')} style={styles.backgroundImage}>
      <View style={styles.container}>
        <Text style={styles.label}>Height</Text>
        <TextInput
          style={styles.input}
          placeholder="Enter your celsius"
          value={height}
          onChangeText={setHeight}
        />
        <Button title="Submit" onPress={workFun} />
      </View>
    </ImageBackground>
  );
};

const SecondScreen = () => {
  return (
    <View>
      <Text>Second screen</Text>
    </View>
  );
};

const App = () => {
  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="first" component={FirstScreen} />
        <Tab.Screen name="second" component={SecondScreen} />
      </Tab.Navigator>
    </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  label: {
    fontSize: 16,
    fontWeight: 'bold',
    marginBottom: 8,
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 16,
    paddingHorizontal: 10,
  },
  backgroundImage: {
    flex: 1,
    resizeMode: 'cover',
  },
});

export default App;




10. grocery list with flatlist, section list 

expo install @expo-google-fonts/poppins


import React, { useState } from 'react';
import { NavigationContainer, DefaultTheme, DarkTheme, useTheme } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { Text, View, FlatList, TouchableOpacity, StyleSheet, Switch } from 'react-native';
import { useFonts, Poppins_400Regular, Poppins_700Bold } from '@expo-google-fonts/poppins';

const Tab = createBottomTabNavigator();

const ToBuyScreen = () => {
  const [toBuyItems, setToBuyItems] = useState([
    { id: '1', name: 'Milk', category: 'To Buy' },
    { id: '2', name: 'Bread', category: 'To Buy' },
    // Add more items
  ]);

  return (
    <View style={styles.container}>
      <FlatList
        data={toBuyItems}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => (
          <View style={styles.item}>
            <Text>{item.name}</Text>
          </View>
        )}
      />
    </View>
  );
};

const BoughtScreen = () => {
  const [boughtItems, setBoughtItems] = useState([
    { id: '1', name: 'Apples', category: 'Bought' },
    { id: '2', name: 'Chicken', category: 'Bought' },
    // Add more items
  ]);

  return (
    <View style={styles.container}>
      <FlatList
        data={boughtItems}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => (
          <View style={styles.item}>
            <Text>{item.name}</Text>
          </View>
        )}
      />
    </View>
  );
};

const ToAvoidScreen = () => {
  const [toAvoidItems, setToAvoidItems] = useState([
    { id: '1', name: 'Soda', category: 'To Avoid' },
    { id: '2', name: 'Candies', category: 'To Avoid' },
    // Add more items
  ]);

  return (
    <View style={styles.container}>
      <FlatList
        data={toAvoidItems}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => (
          <View style={styles.item}>
            <Text>{item.name}</Text>
          </View>
        )}
      />
    </View>
  );
};

const App = () => {
  const [isDarkMode, setIsDarkMode] = useState(false);
  const { colors } = useTheme();

  const toggleDarkMode = () => {
    setIsDarkMode(!isDarkMode);
  };

  let [fontsLoaded] = useFonts({
    Poppins_400Regular,
    Poppins_700Bold,
  });

  if (!fontsLoaded) {
    return <Text>Loading...</Text>;
  }

  return (
    <NavigationContainer theme={isDarkMode ? DarkTheme : DefaultTheme}>
      <Tab.Navigator>
        <Tab.Screen name="To Buy" component={ToBuyScreen} />
        <Tab.Screen name="Bought" component={BoughtScreen} />
        <Tab.Screen name="To Avoid" component={ToAvoidScreen} />
      </Tab.Navigator>
      <View style={styles.themeToggleContainer}>
        <Text style={styles.themeToggleText}>Dark Mode</Text>
        <Switch value={isDarkMode} onValueChange={toggleDarkMode} />
      </View>
    </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  item: {
    padding: 16,
    marginVertical: 8,
    borderColor: 'gray',
    borderWidth: 1,
    borderRadius: 8,
  },
  themeToggleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 16,
    backgroundColor: '#fff', // Adjust as needed
  },
  themeToggleText: {
    marginRight: 8,
  },
});

export default App;


11. clg admission registration.
Step 1: npx create-expo-app college
Step 2: cd college
Step 3: npx expo install @react-navigation/native @react-navigation/bottom-tabs react-native-reanimated react-native-gesture-handler react-native-screens
Step 4: npm install @react-navigation/stack

—-----------------------------------------------—-----------------------------------------------

App.js

import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { createStackNavigator } from '@react-navigation/stack';
import HomeScreen from './screens/HomeScreen';
import FormScreen from './screens/FormScreen';
import AdmissionForm from './components/AdmissionForm';
const Tab = createBottomTabNavigator();
const Stack = createStackNavigator();
const FormStack = () => (
  <Stack.Navigator>
    <Stack.Screen name="Admission Form" component={FormScreen} />
  </Stack.Navigator>
);
const App = () => {
  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen name="Home" component={HomeScreen} />
        <Tab.Screen name="Admission" component={FormStack} />
      </Tab.Navigator>
    </NavigationContainer>
  );
};
export default App;

components/AdmissionForm.js

import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet, Alert } from 'react-native';
const AdmissionForm = () => {
  const [name, setName] = useState('');
  const [contact, setContact] = useState('');
  const [academicHistory, setAcademicHistory] = useState('');
  const handleSubmit = () => {
    if (name && contact && academicHistory) {
      // Perform form submission logic here
      Alert.alert('Form Submitted', 'Thank you for submitting your admission form!');
    } else {
      Alert.alert('Error', 'Please fill in all required fields.');
    }
  };
  return (
    <View style={styles.container}>
      <Text>Name:</Text>
      <TextInput
        style={styles.input}
        value={name}
        onChangeText={(text) => setName(text)}
        placeholder="Enter your name"
      />
      <Text>Contact Information:</Text>
      <TextInput
        style={styles.input}
        value={contact}
        onChangeText={(text) => setContact(text)}
        placeholder="Enter your contact information"
      />
      <Text>Academic History:</Text>
      <TextInput
        style={styles.input}
        value={academicHistory}
        onChangeText={(text) => setAcademicHistory(text)}
        placeholder="Enter your academic history"
      />
      <Button title="Submit" onPress={handleSubmit} />
    </View>
  );
};
const styles = StyleSheet.create({
  container: {
    padding: 20,
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 10,
  },
});
export default AdmissionForm;



screens/FormScreen.js

import React from 'react';
import { View } from 'react-native';
import AdmissionForm from '../components/AdmissionForm';
const FormScreen = () => {
  return (
    <View>
      <AdmissionForm />
    </View>
  );
};
export default FormScreen;


screens/HomeScreen.js

import React from 'react';
import { View, Text } from 'react-native';
const HomeScreen = () => {
  return (
    <View>
      <Text>Welcome to College Admission App</Text>
    </View>
  );
};
export default HomeScreen;

12. credit,cash with total cash

import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, Modal, StyleSheet, Switch } from 'react-native';

const App = () => {
  const [productPrice, setProductPrice] = useState('');
  const [paymentMethod, setPaymentMethod] = useState('cash');
  const [totalAmount, setTotalAmount] = useState('');
  const [isDarkTheme, setIsDarkTheme] = useState(false);
  const [isModalVisible, setModalVisible] = useState(false);

  const calculateTotalAmount = () => {
    // Implement your payment calculation logic here
    // For simplicity, let's assume a 5% tax for credit card payments
    const taxRate = paymentMethod === 'creditCard' ? 0.05 : 0;
    const totalPrice = parseFloat(productPrice);
    const taxAmount = totalPrice * taxRate;
    const finalAmount = totalPrice + taxAmount;
    setTotalAmount(finalAmount.toFixed(2));
    setModalVisible(true);
  };

  const toggleTheme = () => {
    setIsDarkTheme(!isDarkTheme);
  };

  const closeModal = () => {
    setModalVisible(false);
  };

  return (
    <View style={[styles.container, isDarkTheme && styles.darkContainer]}>
      <Text style={[styles.header, isDarkTheme && styles.darkText]}>Payment Calculator</Text>

      <TextInput
        style={styles.input}
        placeholder="Product Price"
        keyboardType="numeric"
        value={productPrice}
        onChangeText={(text) => setProductPrice(text)}
      />

      <View style={styles.paymentMethodContainer}>
        <Text style={[styles.label, isDarkTheme && styles.darkText]}>Payment Method:</Text>
        <TouchableOpacity
          style={[styles.paymentMethodButton, paymentMethod === 'cash' && styles.selectedButton]}
          onPress={() => setPaymentMethod('cash')}
        >
          <Text style={styles.paymentMethodButtonText}>Cash</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.paymentMethodButton, paymentMethod === 'creditCard' && styles.selectedButton]}
          onPress={() => setPaymentMethod('creditCard')}
        >
          <Text style={styles.paymentMethodButtonText}>Credit Card</Text>
        </TouchableOpacity>
      </View>

      <TouchableOpacity style={styles.calculateButton} onPress={calculateTotalAmount}>
        <Text style={styles.calculateButtonText}>Calculate Total</Text>
      </TouchableOpacity>

      <Modal visible={isModalVisible} transparent animationType="slide">
        <View style={styles.modalContainer}>
          <Text style={[styles.modalText, isDarkTheme && styles.darkText]}>Order Summary</Text>
          <Text style={[styles.resultText, isDarkTheme && styles.darkText]}>
            Product Price: ${productPrice}
          </Text>
          <Text style={[styles.resultText, isDarkTheme && styles.darkText]}>
            Payment Method: {paymentMethod === 'cash' ? 'Cash' : 'Credit Card'}
          </Text>
          <Text style={[styles.resultText, isDarkTheme && styles.darkText]}>
            Total Amount: ${totalAmount}
          </Text>
          <TouchableOpacity style={styles.closeModalButton} onPress={closeModal}>
            <Text style={styles.closeModalButtonText}>Close</Text>
          </TouchableOpacity>
        </View>
      </Modal>

      <View style={styles.themeToggleContainer}>
        <Text style={[styles.label, isDarkTheme && styles.darkText]}>Dark Theme</Text>
        <Switch value={isDarkTheme} onValueChange={toggleTheme} />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#fff',
  },
  darkContainer: {
    backgroundColor: '#333',
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  darkText: {
    color: '#fff',
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginBottom: 20,
    paddingHorizontal: 8,
    width: '80%',
  },
  paymentMethodContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
    marginRight: 10,
  },
  paymentMethodButton: {
    backgroundColor: '#3498db',
    padding: 10,
    borderRadius: 5,
    marginRight: 10,
  },
  selectedButton: {
    backgroundColor: '#2c3e50',
  },
  paymentMethodButtonText: {
    color: '#fff',
  },
  calculateButton: {
    backgroundColor: '#27ae60',
    padding: 10,
    borderRadius: 5,
    marginBottom: 20,
  },
  calculateButtonText: {
    color: '#fff',
  },
  modalContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(0, 0, 0, 0.8)',
  },
  modalText: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
    marginBottom: 20,
  },
  resultText: {
    fontSize: 18,
    color: '#fff',
    marginBottom: 10,
  },
  closeModalButton: {
    backgroundColor: '#e74c3c',
    padding: 10,
    borderRadius: 5,
    marginTop: 20,
  },
  closeModalButtonText: {
    color: '#fff',
  },
  themeToggleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
  },
});

export default App;

13. todo list

// TodoListApp.js
import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, FlatList, Switch, StyleSheet } from 'react-native';

const TodoListApp = () => {
  const [task, setTask] = useState('');
  const [tasks, setTasks] = useState([]);
  const [darkMode, setDarkMode] = useState(false);

  const addTask = () => {
    if (task.trim() !== '') {
      setTasks([...tasks, { id: Date.now(), name: task, completed: false }]);
      setTask('');
    }
  };

  const editTask = (taskId, newName) => {
    const updatedTasks = tasks.map((t) => (t.id === taskId ? { ...t, name: newName } : t));
    setTasks(updatedTasks);
  };

  const deleteTask = (taskId) => {
    const updatedTasks = tasks.filter((t) => t.id !== taskId);
    setTasks(updatedTasks);
  };

  const toggleCompletion = (taskId) => {
    const updatedTasks = tasks.map((t) => (t.id === taskId ? { ...t, completed: !t.completed } : t));
    setTasks(updatedTasks);
  };

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
  };

  const renderItem = ({ item }) => (
    <View style={styles.taskContainer}>
      <Switch
        value={item.completed}
        onValueChange={() => toggleCompletion(item.id)}
        style={styles.taskCompletionToggle}
      />
      <TextInput
        style={[styles.taskText, { textDecorationLine: item.completed ? 'line-through' : 'none' }]}
        value={item.name}
        onChangeText={(text) => editTask(item.id, text)}
        multiline
      />
      <TouchableOpacity onPress={() => deleteTask(item.id)} style={styles.deleteButton}>
        <Text style={styles.deleteButtonText}>Delete</Text>
      </TouchableOpacity>
    </View>
  );

  return (
    <View style={[styles.container, darkMode ? styles.darkModeContainer : null]}>
      <Text style={styles.heading}>Todo List</Text>
      <View style={styles.inputContainer}>
        <TextInput
          style={[styles.input, darkMode ? styles.darkModeInput : null]}
          placeholder="Enter a task"
          value={task}
          onChangeText={(text) => setTask(text)}
        />
        <TouchableOpacity onPress={addTask} style={styles.addButton}>
          <Text style={styles.buttonText}>Add</Text>
        </TouchableOpacity>
      </View>
      <FlatList
        data={tasks}
        renderItem={renderItem}
        keyExtractor={(item) => item.id.toString()}
      />
      <View style={styles.darkModeToggleContainer}>
        <Text style={styles.darkModeToggleText}>Dark Mode</Text>
        <Switch value={darkMode} onValueChange={toggleDarkMode} />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#fff',
  },
  darkModeContainer: {
    backgroundColor: '#333',
  },
  heading: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
    color: '#333',
  },
  inputContainer: {
    flexDirection: 'row',
    marginBottom: 20,
  },
  input: {
    flex: 1,
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginRight: 10,
    paddingLeft: 10,
    color: '#333',
  },
  darkModeInput: {
    backgroundColor: '#555',
    color: 'white',
  },
  addButton: {
    backgroundColor: 'blue',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 5,
  },
  buttonText: {
    color: 'white',
    fontWeight: 'bold',
  },
  taskContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 10,
  },
  taskCompletionToggle: {
    marginRight: 10,
  },
  taskText: {
    flex: 1,
    fontSize: 16,
    color: '#333',
  },
  deleteButton: {
    backgroundColor: 'red',
    paddingVertical: 5,
    paddingHorizontal: 10,
    borderRadius: 5,
  },
  deleteButtonText: {
    color: 'white',
  },
  darkModeToggleContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-end',
    marginTop: 20,
  },
  darkModeToggleText: {
    marginRight: 10,
    fontSize: 16,
    color: '#333',
  },
});

export default TodoListApp;






14. timer with dark/light mode with popup.

import React, { useState, useEffect } from 'react';
import { View, Text, Modal, TouchableOpacity, StyleSheet, Switch } from 'react-native';

const App = () => {
  const [currentTime, setCurrentTime] = useState(new Date());
  const [isDarkTheme, setIsDarkTheme] = useState(false);
  const [isTimerModalVisible, setTimerModalVisible] = useState(false);

  useEffect(() => {
    // Update the current time every second
    const interval = setInterval(() => {
      setCurrentTime(new Date());
    }, 1000);

    return () => clearInterval(interval);
  }, []);

  const toggleTheme = () => {
    setIsDarkTheme(!isDarkTheme);
  };

  const openTimerModal = () => {
    setTimerModalVisible(true);
  };

  const closeTimerModal = () => {
    setTimerModalVisible(false);
  };

  return (
    <View style={[styles.container, isDarkTheme && styles.darkContainer]}>
      <View style={styles.clockContainer}>
        <Text style={[styles.time, isDarkTheme && styles.darkText]}>
          {currentTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit' })}
        </Text>
      </View>

      <View style={styles.themeContainer}>
        <Text style={styles.themeText}>Dark Theme</Text>
        <Switch value={isDarkTheme} onValueChange={toggleTheme} />
      </View>

      <TouchableOpacity style={styles.timerButton} onPress={openTimerModal}>
        <Text style={styles.timerButtonText}>Set Timer</Text>
      </TouchableOpacity>

      <Modal visible={isTimerModalVisible} animationType="slide" transparent>
        <View style={styles.timerModalContainer}>
          <Text style={styles.timerModalText}>Timer Popup</Text>
          <TouchableOpacity style={styles.closeButton} onPress={closeTimerModal}>
            <Text style={styles.closeButtonText}>Close</Text>
          </TouchableOpacity>
        </View>
      </Modal>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#fff',
  },
  darkContainer: {
    backgroundColor: '#333',
  },
  clockContainer: {
    marginBottom: 20,
  },
  time: {
    fontSize: 30,
    fontWeight: 'bold',
    color: '#000',
  },
  darkText: {
    color: '#fff',
  },
  themeContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 20,
  },
  themeText: {
    fontSize: 18,
    marginRight: 10,
  },
  timerButton: {
    backgroundColor: 'blue',
    padding: 10,
    borderRadius: 5,
  },
  timerButtonText: {
    color: '#fff',
    fontSize: 18,
  },
  timerModalContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
  },
  timerModalText: {
    fontSize: 24,
    color: '#fff',
    marginBottom: 20,
  },
  closeButton: {
    backgroundColor: 'red',
    padding: 10,
    borderRadius: 5,
  },
  closeButtonText: {
    color: '#fff',
    fontSize: 18,
  },
});

export default App;


15 timer to zero to alarm

// CountdownTimerApp.js
import React, { useState, useEffect } from 'react';
import { View, Text, TouchableOpacity, Alert, StyleSheet } from 'react-native';

const CountdownTimerApp = () => {
  const [countdown, setCountdown] = useState(10);
  const [isDarkMode, setDarkMode] = useState(false);

  useEffect(() => {
    const intervalId = setInterval(() => {
      if (countdown > 0) {
        setCountdown(countdown - 1);
      } else {
        clearInterval(intervalId);
        showAlert();
      }
    }, 1000);

    return () => clearInterval(intervalId);
  }, [countdown]);

  const showAlert = () => {
    Alert.alert(
      'Countdown Complete!',
      'Time\'s up! Your countdown has reached 0.',
      [{ text: 'OK', onPress: () => resetCountdown() }],
      { cancelable: false }
    );
  };

  const resetCountdown = () => {
    setCountdown(10);
  };

  const toggleDarkMode = () => {
    setDarkMode(!isDarkMode);
  };

  return (
    <View style={[styles.container, isDarkMode ? styles.darkModeContainer : null]}>
      <Text style={[styles.timerText, isDarkMode ? styles.darkModeText : null]}>{countdown}</Text>
      <TouchableOpacity onPress={resetCountdown} style={styles.resetButton}>
        <Text style={styles.buttonText}>Reset</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={toggleDarkMode} style={styles.toggleThemeButton}>
        <Text style={styles.buttonText}>Toggle Theme</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#fff',
  },
  darkModeContainer: {
    backgroundColor: '#333',
  },
  timerText: {
    fontSize: 40,
    fontWeight: 'bold',
    color: '#333',
  },
  darkModeText: {
    color: 'white',
  },
  resetButton: {
    backgroundColor: 'blue',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 5,
    marginVertical: 20,
  },
  toggleThemeButton: {
    backgroundColor: 'green',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 5,
  },
  buttonText: {
    color: 'white',
    fontWeight: 'bold',
  },
});

export default CountdownTimerApp;


16, student detail management

npm install @react-navigation/stack


import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

const Stack = createStackNavigator();

const StudentFormScreen = ({ navigation }) => {
  const [name, setName] = useState('');
  const [className, setClassName] = useState('');
  const [age, setAge] = useState('');
  const [registerNumber, setRegisterNumber] = useState('');

  const handleSubmit = () => {
    // Assuming you want to navigate to the details screen with the submitted data
    navigation.navigate('StudentDetails', {
      name,
      className,
      age,
      registerNumber,
    });
  };

  return (
    <View style={styles.container}>
      <Text>Student Form</Text>
      <TextInput
        placeholder="Name"
        value={name}
        onChangeText={setName}
        style={styles.input}
      />
      <TextInput
        placeholder="Class"
        value={className}
        onChangeText={setClassName}
        style={styles.input}
      />
      <TextInput
        placeholder="Age"
        value={age}
        onChangeText={setAge}
        keyboardType="numeric"
        style={styles.input}
      />
      <TextInput
        placeholder="Register Number"
        value={registerNumber}
        onChangeText={setRegisterNumber}
        keyboardType="numeric"
        style={styles.input}
      />
      <Button title="Submit" onPress={handleSubmit} />
    </View>
  );
};

const StudentDetailsScreen = ({ route }) => {
  const { name, className, age, registerNumber } = route.params;

  return (
    <View style={styles.container}>
      <Text>Student Details</Text>
      <Text>Name: {name}</Text>
      <Text>Class: {className}</Text>
      <Text>Age: {age}</Text>
      <Text>Register Number: {registerNumber}</Text>
    </View>
  );
};

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="StudentForm" component={StudentFormScreen} />
        <Stack.Screen name="StudentDetails" component={StudentDetailsScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  input: {
    height: 40,
    borderColor: 'gray',
    borderWidth: 1,
    marginVertical: 8,
    paddingHorizontal: 8,
  },
});

export default App;









