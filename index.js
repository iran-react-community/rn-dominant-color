import { NativeModules, Platform } from 'react-native';

const { RNDominantColor } = NativeModules;

export const getColorFromURL = (url) => {
  Platform.select({
    ios: () => {
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
    },
    android: () => {
      return new Promise((resolve, reject) => {
        RNDominantColor.colorsFromUrl(url, (err, colors) => {
          if (err) {
            reject({
              primary: '#00000000',
              secondary: '#00000000',
              background: '#00000000',
              detail: '#00000000'
            })
          } else {
            resolve({
              primary: colors.dominantColor,
              secondary: colors.averageColor,
              background: colors.lightVibrantColor,
              detail: colors.vibrantColor
            })
          }
        });
      })
    }
  })
}