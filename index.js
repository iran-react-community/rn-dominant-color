import { NativeModules, Platform } from 'react-native';

const { RNDominantColor } = NativeModules;

export const getColorFromURL = (url) => {

  if (Platform.OS == 'ios') {
    return new Promise((resolve, reject) => {
      RNDominantColor.getColorFromURL(url, (primary, secondary, background, detail) => {
        resolve({
          primary,
          secondary,
          background,
          detail
        })
      })
    })
  }

  if (Platform.OS == 'android') {
    return new Promise((resolve, reject) => {
      RNDominantColor.colorsFromUrl(url).then(colors => {
        resolve({
          primary: colors.dominantColor,
          secondary: colors.averageColor,
          background: colors.lightVibrantColor,
          detail: colors.vibrantColor
        })

      }).catch(err => {
        reject({
          primary: '#00000000',
          secondary: '#00000000',
          background: '#00000000',
          detail: '#00000000'
        })
      })
    })
  }
}