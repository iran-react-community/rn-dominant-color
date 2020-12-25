
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

You need to have swift enabled in your project. In order to have this installed follow these steps: #https://github.com/iran-react-community/rn-dominant-color/issues/3   
1. In project navigator right click on project name and create new swift file (any name
2. After that press save and click on Create Bridging Header.
3. Recompile your project

You may run to this issue if you don't create swift file:
```
warning: Could not find or use auto-linked library 'swiftWebKit'
Undefined symbols for architecture x86_64:
  "__swift_FORCE_LOAD_$_swiftWebKit", referenced from:
      __swift_FORCE_LOAD_$_swiftWebKit_$_RNDominantColor in libRNDominantColor.a(RNDominantColor.o)
      __swift_FORCE_LOAD_$_swiftWebKit_$_RNDominantColor in libRNDominantColor.a(UIImageColors.o)
      __swift_FORCE_LOAD_$_swiftWebKit_$_lottie_react_native in liblottie-react-native.a(ContainerView.o)
      __swift_FORCE_LOAD_$_swiftWebKit_$_lottie_react_native in liblottie-react-native.a(AnimationViewManagerModule.o)
     (maybe you meant: __swift_FORCE_LOAD_$_swiftWebKit_$_lottie_react_native, __swift_FORCE_LOAD_$_swiftWebKit_$_RNDominantColor )
ld: symbol(s) not found for architecture x86_64
```

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
