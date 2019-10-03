
# rn-dominant-color
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://github.com/matinzd/rn-dominant-color/compare)    [![npm version](https://badge.fury.io/js/rn-dominant-color.svg)](https://badge.fury.io/js/rn-dominant-color)    
Extract the dominant colors of an image for android and ios.   
Thanks [react-native-dominant-color](https://github.com/hu9osaez/react-native-dominant-color) for android module

## Getting started
`$ yarn add rn-dominant-color`

### Mostly automatic installation   

For react-native <= 60:      
`$ react-native link rn-dominant-color`


#### Android

1. Rebuild your app.

#### iOS

1. `$ cd ios && pod install`


## Usage
```javascript
import React, { Component } from 'react';
import { StyleSheet, View } from 'react-native';
import { getColorFromURL } from 'rn-dominant-color';

const imageUrl = 'http://donapr.com/wp-content/uploads/2016/03/RRUe0Mo.png';

const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center'
    },
    image: {
        width: 300,
        height: 300,
        borderRadius: 10
    }
});

class Example extends Component {
    constructor() {
        super();
        this.state = {
            color: '#ffffff',
        };
    }

    componentWillMount() {
        let self = this;
        getColorFromURL(imageUrl).then(colors => {
            this.setState({color: colors.primary})
        })
    }

    render() {
        return (
            <View style={[styles.container, {backgroundColor: this.state.color }]}>
                <Image style={styles.image} source={{ uri: imageUrl}} />
            </View>
        );
    }
}

```

## API
#### Methods
* `getColorFromURL(imageUrl, callback)`: Callback returns an object with the prominent colors from the image. Object properties are `primary`, `secondary`,  `background` and `detail`. If some color doesn't exist will return `#00000000`.